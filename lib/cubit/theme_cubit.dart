import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences _prefs;

  @visibleForTesting
  static const String themeKey = '__theme_key__';

  ThemeCubit({required SharedPreferences prefs})
      : _prefs = prefs,
        super(ThemeMode.system);

  void init(){
    final index = _prefs.getInt(themeKey);
    return emit(ThemeMode.values[index ?? 0]);
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    await _prefs.setInt(themeKey, themeMode.index);

    return emit(themeMode);
  }
}
