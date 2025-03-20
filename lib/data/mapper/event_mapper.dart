import 'package:calendar_app/data/models/event_model.dart';
import 'package:calendar_app/domain/entities/event.dart';

class EventMapper {
  static Event toEntity(EventModel model) {
    return Event(
      eventName: model.eventName,
      description: model.description,
      date: model.date,
    );
  }

  static EventModel toModel(Event entity) {
    return EventModel(
      eventName: entity.eventName,
      description: entity.description,
      date: entity.date,
    );
  }
}
