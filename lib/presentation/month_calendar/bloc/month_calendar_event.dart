part of 'month_calendar_bloc.dart';

@freezed
class MonthCalendarEvent with _$MonthCalendarEvent  {
  const factory MonthCalendarEvent.started() = _Started;

  const factory MonthCalendarEvent.getEventsList({
    required String startDate,
    String? endDate,
  }) = _GetEventsList;
}
