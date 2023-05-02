import 'package:app/cubit/theme_cubit.dart';
import 'package:app/utils/theme_mode_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ThemeScreen());
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select<ThemeCubit, ThemeMode>(
      (value) => value.state,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Tema')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return RadioListTile<ThemeMode>(
            title: Text(ThemeMode.values[index].toViewString()),
            value: ThemeMode.values[index],
            groupValue: themeMode,
            onChanged: (value) {
              if (value == null) return;

              context.read<ThemeCubit>().changeTheme(value);
            },
          );
        },
        itemCount: ThemeMode.values.length,
      ),
    );
  }
}
