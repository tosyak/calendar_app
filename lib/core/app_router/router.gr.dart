// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:calendar_app/domain/entities/event.dart' as _i8;
import 'package:calendar_app/presentation/event_details/pages/event_details_screen.dart'
    as _i1;
import 'package:calendar_app/presentation/filtered_dates/pages/events_list_screen.dart'
    as _i2;
import 'package:calendar_app/presentation/month_calendar/pages/month_calendar_screen.dart'
    as _i3;
import 'package:calendar_app/presentation/settings/pages/settings_screen.dart'
    as _i4;
import 'package:calendar_app/presentation/splash/splash_screen.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.EventDetailsScreen]
class EventDetailsRoute extends _i6.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i7.Key? key,
    required _i8.Event event,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         EventDetailsRoute.name,
         args: EventDetailsRouteArgs(key: key, event: event),
         initialChildren: children,
       );

  static const String name = 'EventDetailsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return _i1.EventDetailsScreen(key: args.key, event: args.event);
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({this.key, required this.event});

  final _i7.Key? key;

  final _i8.Event event;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, event: $event}';
  }
}

/// generated route for
/// [_i2.EventsListScreen]
class EventsListRoute extends _i6.PageRouteInfo<EventsListRouteArgs> {
  EventsListRoute({
    _i9.Key? key,
    required String startDate,
    String? endDate,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         EventsListRoute.name,
         args: EventsListRouteArgs(
           key: key,
           startDate: startDate,
           endDate: endDate,
         ),
         initialChildren: children,
       );

  static const String name = 'EventsListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventsListRouteArgs>();
      return _i2.EventsListScreen(
        key: args.key,
        startDate: args.startDate,
        endDate: args.endDate,
      );
    },
  );
}

class EventsListRouteArgs {
  const EventsListRouteArgs({this.key, required this.startDate, this.endDate});

  final _i9.Key? key;

  final String startDate;

  final String? endDate;

  @override
  String toString() {
    return 'EventsListRouteArgs{key: $key, startDate: $startDate, endDate: $endDate}';
  }
}

/// generated route for
/// [_i3.MonthCalendarScreen]
class MonthCalendarRoute extends _i6.PageRouteInfo<void> {
  const MonthCalendarRoute({List<_i6.PageRouteInfo>? children})
    : super(MonthCalendarRoute.name, initialChildren: children);

  static const String name = 'MonthCalendarRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.MonthCalendarScreen();
    },
  );
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class Splash extends _i6.PageRouteInfo<void> {
  const Splash({List<_i6.PageRouteInfo>? children})
    : super(Splash.name, initialChildren: children);

  static const String name = 'Splash';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
