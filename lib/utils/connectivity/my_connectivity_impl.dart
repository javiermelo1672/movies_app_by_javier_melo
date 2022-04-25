import 'package:connectivity/connectivity.dart';
import 'package:leal_test_by_javier_melo/utils/connectivity/my_connectivity.dart';

class MyConnectivityImpl implements MyConnectivity {
  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return Connectivity().checkConnectivity();
  }
}
