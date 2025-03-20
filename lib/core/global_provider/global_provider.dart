import 'package:calendar_app/core/locale_cubit/cubit/locale_cubit.dart';
import 'package:calendar_app/core/locale_cubit/data/locale_datasource.dart';
import 'package:calendar_app/core/locale_cubit/data/locale_repository.dart';
import 'package:calendar_app/core/theme_cubit/theme_cubit.dart';
import 'package:calendar_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    super.key,
    required this.child,
    required this.userLocale,
  });

  final Widget child;
  final String userLocale;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<LanguageRepository>(
      create:
          (context) => LanguageRepositoryImpl(
            remoteDataSource: LanguageDataSourceImpl(),
          ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit()..getTheme(),
          ),
          BlocProvider<LocaleCubit>(
            create:
                (context) => LocaleCubit(
                  langRepository: context.read<LanguageRepository>(),
                  locale: userLocale,
                )..initialize(),
          ),
          BlocProvider(
            create: (context) => SplashBloc()..add(SplashEventStarted()),
          ),
        ],
        child: child,
      ),
    );
  }
}
