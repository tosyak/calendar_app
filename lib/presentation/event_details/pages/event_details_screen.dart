import 'package:auto_route/auto_route.dart';
import 'package:calendar_app/domain/entities/event.dart';
import 'package:calendar_app/presentation/event_details/views/event_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "EventDetailsRoute")
class EventDetailsScreen extends StatelessWidget {
  static const routeName = '/event-details-route';
  final Event event;
  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return EventDetailsView(event: event);
  }
}
