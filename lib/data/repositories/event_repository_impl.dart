// lib/data/repositories/product_repository_impl.dart

import 'package:calendar_app/core/error/exceptions.dart';
import 'package:calendar_app/core/error/failures.dart';
import 'package:calendar_app/data/datasources/remote/events_datasuorce.dart';
import 'package:calendar_app/data/mapper/event_mapper.dart';
import 'package:calendar_app/data/models/event_model.dart';
import 'package:calendar_app/domain/entities/event.dart';
import 'package:calendar_app/domain/repositories/event_repository.dart';
import 'package:dartz/dartz.dart';

class EventRepositoryImpl implements EventRepository {
  final EventApi eventApi;

  EventRepositoryImpl(this.eventApi);

  @override
  Future<Either<Failure, List<Event>>> getEventsList({
    required String startDate,
    String? endDate,
  }) async {
    try {
      final List<EventModel> eventsModels = await eventApi.getEventsList(
        startDate: startDate,
        endDate: endDate,
      );

      final List<Event> events =
          eventsModels.map((model) => EventMapper.toEntity(model)).toList();

      return Right(events);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.statusCode));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
