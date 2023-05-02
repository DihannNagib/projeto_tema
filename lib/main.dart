import 'package:app/models/app.dart';
import 'package:app/screen/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubit/app_cubit.dart';
import 'cubit/theme_cubit.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  final packageInfo = await PackageInfo.fromPlatform();

  final app = App(
    name: packageInfo.appName,
    version: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit(prefs: prefs)..init()),
        BlocProvider(create: (_) => AppCubit(app)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode =
        context.select<ThemeCubit, ThemeMode>((value) => value.state);

    return MaterialApp(
      title: 'APP Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: const InitialPage(),
    );
  }
}
