import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


class ThemeCubit extends Cubit<ThemeMode>{
  ThemeCubit() : super(ThemeMode.system);

  void changeDark() {
    if (state == ThemeMode.light || state == ThemeMode.system){
      return emit(ThemeMode.dark);
    }
  }
  void changeLight() {
    if (state == ThemeMode.dark || state == ThemeMode.system){
      return emit(ThemeMode.light);
    }
    }

  }
