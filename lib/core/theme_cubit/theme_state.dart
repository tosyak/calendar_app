part of 'theme_cubit.dart';

abstract class ThemeState {}

class InitialState extends ThemeState {}

class GetThemeState extends ThemeState {
  final ThemeMode theme;

  GetThemeState(this.theme);
}
