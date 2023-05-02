import 'package:app/cubit/app_cubit.dart';
import 'package:app/screen/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/app.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SettingScreen());
  }

  @override
  Widget build(BuildContext context) {
    final app = context.select<AppCubit, App>((value) => value.state);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child:
                    Text('Tema', textAlign: TextAlign.start,),
                    onPressed: () {
                      Navigator.push(context, ThemeScreen.route());
                    },
                  ),
                  const Divider(),
                  Column(
                    children: [
                      Text(
                        app.name.toUpperCase(),
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Versão: ${app.version} | Número de build: ${app.buildNumber}',
                        style: const TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
