import 'package:calendar_app/core/error/failures.dart';
import 'package:calendar_app/domain/entities/event.dart';
import 'package:calendar_app/domain/repositories/event_repository.dart';
import 'package:dartz/dartz.dart';

class GetEventsUseCase {
  final EventRepository repository;

  GetEventsUseCase(this.repository);

  Future<Either<Failure, List<Event>>> call({
    required String startDate,
    String? endDate,
  }) async {
    return await repository.getEventsList(
      startDate: startDate,
      endDate: endDate,
    );
  }
}
