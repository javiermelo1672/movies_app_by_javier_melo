import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_localizations.dart';
import 'package:leal_test_by_javier_melo/ui/pages/auth/splash_screen_ui.dart';

class MovieApp extends StatelessWidget {
  static const MaterialColor _primarySwatch = MaterialColor(
    _primarySwatchValue,
    <int, Color>{
      50: Color(0xFFFFFAE7),
      100: Color(0xFFFFF2C2),
      200: Color(0xFFFFE999),
      300: Color(0xFFFFE070),
      400: Color(0xFFFFD952),
      500: Color(_primarySwatchValue),
      600: Color(0xFFFFCD2E),
      700: Color(0xFFFFC727),
      800: Color(0xFFFFC120),
      900: Color(0xFFFFB614),
    },
  );
  static const int _primarySwatchValue = 0xFFFFD233;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [AppLocalizationsDelegate()],
      theme: ThemeData(
          cupertinoOverrideTheme: const CupertinoThemeData(
            brightness: Brightness.light,
          ),
          fontFamily: 'Gilroy',
          brightness: Brightness.light,
          primarySwatch: _primarySwatch),
      home: SplashScreenUI(),
      supportedLocales: const [
        Locale("en"),
      ],
    );
  }
}
