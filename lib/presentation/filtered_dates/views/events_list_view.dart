import 'package:calendar_app/core/app_router/router.dart';
import 'package:calendar_app/core/app_router/router.gr.dart';
import 'package:calendar_app/core/localization/app_localizations_extension.dart';
import 'package:calendar_app/core/shared/themes/app_text_style.dart';
import 'package:calendar_app/domain/entities/event.dart';
import 'package:calendar_app/presentation/month_calendar/bloc/month_calendar_bloc.dart';
import 'package:calendar_app/presentation/widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EventsListView extends StatelessWidget {
  const EventsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate('events')),
        centerTitle: true,
      ),
      body: BlocBuilder<MonthCalendarBloc, MonthCalendarState>(
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
            return Center(child: Text(context.translate('loading-error')));
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Success) {
            final List<Event> events = state.events;
            return EventsListWidget(events: events);
          } else {
            return Center(child: Text(context.translate('not-found')));
          }
        },
      ),
    );
  }
}

class EventsListWidget extends StatelessWidget {
  final List<Event> events;

  const EventsListWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    List<DateTime> eventDates =
        events.map((e) => DateFormat('dd-MM-yyyy').parse(e.date)).toList();
    eventDates.sort();

    DateTime startDate =
        eventDates.isNotEmpty ? eventDates.first : DateTime.now();
    DateTime endDate = eventDates.isNotEmpty ? eventDates.last : DateTime.now();

    List<DateTime> allDates = [];
    for (
      DateTime date = startDate;
      date.isBefore(endDate.add(Duration(days: 1)));
      date = date.add(Duration(days: 1))
    ) {
      allDates.add(date);
    }

    return ListView.separated(
      itemCount: allDates.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        DateTime date = allDates[index];
        String formattedDate = DateFormat('dd-MM-yyyy').format(date);

        final event = events.firstWhere(
          (e) => e.date == formattedDate,
          orElse:
              () => Event(date: formattedDate, eventName: '', description: ''),
        );

        return ListTile(
          onTap: () {
            if (event.eventName.isNotEmpty) {
              router.push(EventDetailsRoute(event: event));
            }
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(event.eventName),
              Text(
                event.date,
                style: AppTextStyles.getCustomFont.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),

          leading: const Icon(Icons.event),
        );
      },
    );
  }
}
