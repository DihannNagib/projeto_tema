import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/cubit/theme_cubit.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mudança de tema'),
      ),
      body: const ThemeSelector(),
    );
  }
}


class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10, bottom: 70),
        children: [
          // BlocBuilder<ThemeCubit, ThemeMode>(
          //     builder: (context, state) {
          //       return SwitchListTile(value: true, onChanged:(value) {
          //         BlocProvider.of<ThemeCubit>(context).toggleTheme();
          //       },);
          //     }
          // )
          Padding(
            padding: const EdgeInsets.all(12),
            child:RadioListTile(
            title: const Text('Light'),
            value: ThemeMode,
            groupValue: BlocProvider.of<ThemeCubit>(context).state,
            onChanged: (value) {
              BlocProvider.of<ThemeCubit>(context).changeLight();
            },
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: RadioListTile(
              title: const Text('Dark'),
              value: ThemeMode,
              groupValue: BlocProvider.of<ThemeCubit>(context).state,
              onChanged: (value) {
                BlocProvider.of<ThemeCubit>(context).changeDark();
              },
            ),
          )
        ],
    );
  }
}
