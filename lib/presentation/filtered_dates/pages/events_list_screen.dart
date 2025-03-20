import 'package:auto_route/auto_route.dart';
import 'package:calendar_app/data/datasources/remote/events_datasuorce.dart';
import 'package:calendar_app/data/repositories/event_repository_impl.dart';
import 'package:calendar_app/domain/usecases/get_events_usecase.dart';
import 'package:calendar_app/presentation/filtered_dates/views/events_list_view.dart';
import 'package:calendar_app/presentation/month_calendar/bloc/month_calendar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage(name: "EventsListRoute")
class EventsListScreen extends StatelessWidget {
  static const routeName = '/events-list-route';

  final String startDate;
  final String? endDate;
  const EventsListScreen({super.key, required this.startDate, this.endDate});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => MonthCalendarBloc(
            getEventsUseCase: GetEventsUseCase(EventRepositoryImpl(EventApi())),
          )..add(
            MonthCalendarEvent.getEventsList(
              startDate: startDate,
              endDate: endDate,
            ),
          ),
      child: const EventsListView(),
    );
  }
}
