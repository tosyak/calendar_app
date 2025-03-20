import 'package:calendar_app/core/error/failures.dart';
import 'package:calendar_app/domain/entities/event.dart';
import 'package:dartz/dartz.dart';

abstract class EventRepository {
  Future<Either<Failure, List<Event>>> getEventsList({
    required String startDate,
    String? endDate,
  });
}
