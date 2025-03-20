import 'package:calendar_app/domain/entities/event.dart';
import 'package:calendar_app/domain/usecases/get_events_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'month_calendar_bloc.freezed.dart';
part 'month_calendar_event.dart';
part 'month_calendar_state.dart';

class MonthCalendarBloc extends Bloc<MonthCalendarEvent, MonthCalendarState> {
  final GetEventsUseCase getEventsUseCase;
  MonthCalendarBloc({required this.getEventsUseCase})
    : super(const _Initial()) {
    on<_GetEventsList>((event, emit) async {
      emit(const Loading());
      final result = await getEventsUseCase.call(
        startDate: event.startDate,
        endDate: event.endDate,
      );

      result.fold(
        (failure) => emit(Error(failure.message)),
        (data) => emit(Success(data)),
      );
    });
  }
}
