import 'dart:async';

import 'app_settings.dart';

class Application {
  static Application? _singleton;

  AppSettings? appSettings;
  String? token;
  String? appVersion;
  String? environment;
  String? engineUserId;

  late StreamController<bool> logoutController;
  Stream<bool>? logoutStream;
  final StreamController<String> _notificationsStreamController =
      StreamController<String>.broadcast();

  Function(String) get notificationsSink =>
      _notificationsStreamController.sink.add;
  Stream<String> get notificationsStream =>
      _notificationsStreamController.stream;

  factory Application() {
    _singleton ??= Application._();
    return _singleton!;
  }

  Application._() {
    logoutController = StreamController.broadcast();
    logoutStream = logoutController.stream;
  }
}
