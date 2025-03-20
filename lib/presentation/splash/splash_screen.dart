import 'package:auto_route/auto_route.dart';
import 'package:calendar_app/core/app_router/router.dart';
import 'package:calendar_app/core/app_router/router.gr.dart';
import 'package:calendar_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage(name: 'Splash')
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is SplashLoaded) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            router.pushAndPopUntil(
              const MonthCalendarRoute(),
              predicate: (route) => false,
            );
          });
        }

        return Scaffold(
          body: Center(child: Lottie.asset('assets/calendar.json')),
        );
      },
    );
  }
}
