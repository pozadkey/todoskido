import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoskido/screens/splash_screen.dart';
import 'package:todoskido/themes/dark_theme.dart';
import 'package:todoskido/themes/light_theme.dart';

import 'providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Init Hive
  await Hive.initFlutter();
  // Open a box
  await Hive.openBox('skidobox');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSwitch = ref.watch(themeModeProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeSwitch,
        home: const SplashScreen());
  }
}
