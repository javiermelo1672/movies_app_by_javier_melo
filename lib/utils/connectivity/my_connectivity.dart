import 'package:connectivity/connectivity.dart';

abstract class MyConnectivity {
  Future<ConnectivityResult> checkConnectivity();
}
