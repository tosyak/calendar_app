part of 'month_calendar_bloc.dart';

@freezed
class MonthCalendarState with _$MonthCalendarState {
  const factory MonthCalendarState.initial() = _Initial;
  const factory MonthCalendarState.loading() = Loading;
  const factory MonthCalendarState.success(List<Event> events) = Success;
  const factory MonthCalendarState.error(String message) = Error;
}
