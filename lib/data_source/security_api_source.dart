import 'package:leal_test_by_javier_melo/app/shared_preferences/shared_preferences/shared_preferences_data.dart';
import 'package:leal_test_by_javier_melo/data/security_repository.dart';
import 'package:leal_test_by_javier_melo/data_source/api_base_source.dart';
import 'package:leal_test_by_javier_melo/models/login_request_model.dart';
import 'package:leal_test_by_javier_melo/utils/connectivity/my_connectivity.dart';
import 'package:http/http.dart' as http;
import '../models/login_response_model.dart';

class SecurityApiSourceImpl extends ApiBaseSource implements SecurityApiSource {
  SecurityApiSourceImpl(
    String? baseUrl,
    MyConnectivity? connectivity, {
    http.Client? client,
  }) : super(
          baseUrl,
          client ?? http.Client(),
          connectivity,
        );

  final _preferenceData = SharedPreferenceData();
  @override
  Future<LoginResponse> login(LoginRequest authenticationRequest) {
    if (authenticationRequest.name == "maria" &&
        authenticationRequest.password == "password") {
      _preferenceData.setSharedPreferenceValueString(
          "name", authenticationRequest.name ?? "");
      return Future.value(LoginResponse(
        statusCode: "200",
        token: "123",
        message: "Login Successful",
      ));
    } else if (authenticationRequest.name == "pedro" &&
        authenticationRequest.password == "123456") {
      _preferenceData.setSharedPreferenceValueString(
          "name", authenticationRequest.name ?? "");
      return Future.value(LoginResponse(
        statusCode: "200",
        token: "123",
        message: "Login Successful",
      ));
    } else {
      return Future.value(LoginResponse(
        statusCode: "400",
        token: "-1",
        message: "Error with credentials",
      ));
    }
  }
}
