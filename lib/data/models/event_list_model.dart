import 'package:calendar_app/data/models/event_model.dart';

class EventsListModel {
  final List<EventModel> events;

  EventsListModel({required this.events});

  factory EventsListModel.fromJson(List<dynamic> json) {
    return EventsListModel(
      events: json.map((event) => EventModel.fromJson(event)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'events': events.map((event) => event.toJson()).toList()};
  }
}
