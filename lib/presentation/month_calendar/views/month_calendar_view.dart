import 'package:calendar_app/core/app_router/router.dart';
import 'package:calendar_app/core/app_router/router.gr.dart';
import 'package:calendar_app/core/localization/app_localizations_extension.dart';
import 'package:calendar_app/core/shared/themes/app_text_style.dart';
import 'package:calendar_app/core/utils/extensions.dart';
import 'package:calendar_app/domain/entities/event.dart';
import 'package:calendar_app/presentation/month_calendar/bloc/month_calendar_bloc.dart';
import 'package:calendar_app/presentation/month_calendar/widgets/date_picker_widget.dart';
import 'package:calendar_app/presentation/widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MonthCalendarView extends StatefulWidget {
  const MonthCalendarView({super.key});

  @override
  MonthCalendarViewState createState() => MonthCalendarViewState();
}

class MonthCalendarViewState extends State<MonthCalendarView> {
  DateTime _currentDate = DateTime.now();
  late DateTime firstDayOfMonth;
  late DateTime lastDayOfMonth;
  late String formattedFirstDay;
  late String formattedLastDay;
  List<Event> events = [];
  final Map<String, Event> _eventsMap = {};

  void initializeDates() {
    firstDayOfMonth = DateTime(_currentDate.year, _currentDate.month, 1);
    lastDayOfMonth = DateTime(_currentDate.year, _currentDate.month + 1, 0);
    formattedFirstDay = DateFormat('dd-MM-yyyy').format(firstDayOfMonth);
    formattedLastDay = DateFormat('dd-MM-yyyy').format(lastDayOfMonth);
  }

  void fetchAndNavigate(String startDate, String? endDate) {
    router.push(EventsListRoute(startDate: startDate, endDate: endDate));
  }

  void _changeMonth(int offset) {
    setState(() {
      _currentDate = DateTime(
        _currentDate.year,
        _currentDate.month + offset,
        1,
      );
      initializeDates();
    });
    context.read<MonthCalendarBloc>().add(
      MonthCalendarEvent.getEventsList(
        startDate: formattedFirstDay,
        endDate: formattedLastDay,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                router.push(SettingsRoute());
              },
            ),
            Text(context.translate('calendar')),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final Map<String, DateTime?>? selectedRange = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return DateRangePickerWidget();
                  },
                );
                if (selectedRange != null) {
                  DateTime? startDate = selectedRange['startDate'];
                  DateTime? endDate = selectedRange['endDate'];

                  if (startDate != null && endDate != null) {
                    fetchAndNavigate(
                      startDate.toFormattedString(),
                      endDate.toFormattedString(),
                    );
                  } else if (startDate != null) {
                    fetchAndNavigate(startDate.toFormattedString(), null);
                  }
                }
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => _changeMonth(-1),
                ),
                Text(
                  DateFormat.yMMMM(currentLocale).format(_currentDate),
                  style: AppTextStyles.getCustomFont.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => _changeMonth(1),
                ),
              ],
            ),
            BlocBuilder<MonthCalendarBloc, MonthCalendarState>(
              builder: (context, state) {
                if (state is Error) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return ErrorDialog(errorDescription: state.message);
                      },
                    );
                  });
                  return const SizedBox();
                } else if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is Success) {
                  events = state.events;
                  _eventsMap.clear();
                  _eventsMap.addAll({
                    for (var event in events) event.date: event,
                  });
                  return Column(
                    children: [_buildWeekDaysTable(), _buildCalendarTable()],
                  );
                } else {
                  return Center(child: Text(context.translate('not-found')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekDaysTable() {
    List<String> weekDays =
        DateFormat.E(
          Localizations.localeOf(context).toString(),
        ).dateSymbols.SHORTWEEKDAYS;

    weekDays = [...weekDays.sublist(1), weekDays.first];

    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        TableRow(
          children:
              weekDays
                  .map(
                    (day) => Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        day,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }

  Widget _buildCalendarTable() {
    DateTime firstDayOfMonth = DateTime(
      _currentDate.year,
      _currentDate.month,
      1,
    );
    int firstWeekday = firstDayOfMonth.weekday;
    int daysInMonth =
        DateTime(_currentDate.year, _currentDate.month + 1, 0).day;
    int totalCells = ((firstWeekday - 1) + daysInMonth + 6) ~/ 7 * 7;
    int rowsCount = totalCells ~/ 7;

    List<TableRow> rows = List.generate(rowsCount, (rowIndex) {
      return TableRow(
        children: List.generate(7, (cellIndex) {
          int dayNum = (rowIndex * 7) + cellIndex - (firstWeekday - 2);
          String? eventName;
          if (dayNum > 0 && dayNum <= daysInMonth) {
            eventName = _getEventForDay(dayNum);
            return _buildCell(
              '$dayNum\n${eventName ?? ''}',
              isExpanded: true,
              rowsCount: rowsCount,
            );
          } else {
            return _buildCell('', isExpanded: true, rowsCount: rowsCount);
          }
        }),
      );
    });

    return Table(border: TableBorder.all(color: Colors.grey), children: rows);
  }

  String? _getEventForDay(int day) {
    String formattedDate = DateFormat(
      'dd-MM-yyyy',
    ).format(DateTime(_currentDate.year, _currentDate.month, day));
    return _eventsMap[formattedDate]?.eventName;
  }

  Widget _buildCell(String text, {bool isExpanded = false, int rowsCount = 6}) {
    return InkWell(
      onTap: () {
        if (text.isNotEmpty) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(
            DateTime(
              _currentDate.year,
              _currentDate.month,
              int.parse(text.split('\n')[0]),
            ),
          );
          Event? event = _eventsMap[formattedDate];
          if (event != null) {
            router.push(EventDetailsRoute(event: event));
          }
        }
      },
      child: Container(
        height:
            isExpanded
                ? MediaQuery.of(context).size.height * 0.8 / (rowsCount + 1)
                : null,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
