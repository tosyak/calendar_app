import 'package:auto_route/auto_route.dart';
import 'package:calendar_app/core/app_router/router.gr.dart';
import 'package:calendar_app/core/service_locator/service_locator.dart';
import 'package:calendar_app/presentation/event_details/pages/event_details_screen.dart';
import 'package:calendar_app/presentation/filtered_dates/pages/events_list_screen.dart';
import 'package:calendar_app/presentation/month_calendar/pages/month_calendar_screen.dart';
import 'package:calendar_app/presentation/settings/pages/settings_screen.dart';
import 'package:calendar_app/presentation/splash/splash_screen.dart';

AppRouter get router => getIt<AppRouter>();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Splash.page, path: SplashScreen.routeName, initial: true),
    AutoRoute(
      page: MonthCalendarRoute.page,
      path: MonthCalendarScreen.routeName,
    ),
    AutoRoute(page: EventDetailsRoute.page, path: EventDetailsScreen.routeName),
    AutoRoute(page: EventsListRoute.page, path: EventsListScreen.routeName),
    AutoRoute(page: SettingsRoute.page, path: SettingsScreen.routeName),
  ];
}
