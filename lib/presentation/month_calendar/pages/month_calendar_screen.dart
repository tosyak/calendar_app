import 'package:auto_route/auto_route.dart';
import 'package:calendar_app/data/datasources/remote/events_datasuorce.dart';
import 'package:calendar_app/data/repositories/event_repository_impl.dart';
import 'package:calendar_app/domain/usecases/get_events_usecase.dart';
import 'package:calendar_app/presentation/month_calendar/bloc/month_calendar_bloc.dart';
import 'package:calendar_app/presentation/month_calendar/views/month_calendar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage(name: "MonthCalendarRoute")
class MonthCalendarScreen extends StatelessWidget {
  static const routeName = '/characters-route';

  const MonthCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

    String formattedFirstDay = DateFormat('dd-MM-yyyy').format(firstDayOfMonth);
    String formattedLastDay = DateFormat('dd-MM-yyyy').format(lastDayOfMonth);

    return BlocProvider(
      create:
          (context) => MonthCalendarBloc(
            getEventsUseCase: GetEventsUseCase(EventRepositoryImpl(EventApi())),
          )..add(
            MonthCalendarEvent.getEventsList(
              startDate: formattedFirstDay,
              endDate: formattedLastDay,
            ),
          ),
      child: MonthCalendarView(),
    );
  }
}
