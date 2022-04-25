import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/movie_app.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_settings.dart';
import 'package:leal_test_by_javier_melo/app/settings/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var appSettings = AppSettings(
      securityUrl: 'https://api.themoviedb.org/3',
      apiUrl: 'https://api.themoviedb.org/3',
      token: '46d228a869a6818d82703544252c3de1');
  Application().appSettings = appSettings;

  runApp(MovieApp());
}
