import 'package:leal_test_by_javier_melo/models/login_request_model.dart';
import 'package:leal_test_by_javier_melo/models/login_response_model.dart';

abstract class SecurityRepository {
  Future<LoginResponse> login(LoginRequest authenticationRequest);
}

abstract class SecurityUseCase {
  Future<LoginResponse> login(LoginRequest authenticationRequest);
}

class SecurityUseCaseImpl implements SecurityUseCase {
  final SecurityRepository? _repository;

  SecurityUseCaseImpl(this._repository);

  @override
  Future<LoginResponse> login(LoginRequest authenticationRequest) {
    return _repository!.login(authenticationRequest);
  }
}
