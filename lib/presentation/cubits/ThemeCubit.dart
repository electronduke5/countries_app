import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  late ThemeMode themeMode = ThemeMode.system;

  void switchTheme() {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
      emit(themeMode);
    } else {
      themeMode = ThemeMode.dark;
      emit(themeMode);
    }
  }
  ThemeMode get getCurrentThemeMode => themeMode;
}
