import 'package:flutter/material.dart';

extension ThemeModeX on ThemeMode{
  String toViewString() {
    switch(this){
      case ThemeMode.system:
        return 'Sistema';
      case ThemeMode.light:
        return 'Claro';
      case ThemeMode.dark:
        return 'Escuro';
    }
  }
}