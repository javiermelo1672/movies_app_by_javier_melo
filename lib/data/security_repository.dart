import 'package:leal_test_by_javier_melo/domain/security_use_case.dart';
import 'package:leal_test_by_javier_melo/models/login_request_model.dart';
import 'package:leal_test_by_javier_melo/models/login_response_model.dart';

abstract class SecurityApiSource {
  Future<LoginResponse> login(LoginRequest authenticationRequest);
}

abstract class SecurityDBSource {
  Future<LoginResponse> login(LoginRequest authenticationRequest);
}

class SecurityRepositoryImpl implements SecurityRepository {
  final SecurityApiSource? _apiSource;

  SecurityRepositoryImpl(this._apiSource);

  @override
  Future<LoginResponse> login(LoginRequest authenticationRequest) {
    return _apiSource!.login(authenticationRequest);
  }
}
