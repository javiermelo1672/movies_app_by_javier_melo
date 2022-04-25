import 'dart:async';
import 'package:leal_test_by_javier_melo/blocs/providers/bloc.dart';
import 'package:leal_test_by_javier_melo/domain/security_use_case.dart';
import 'package:leal_test_by_javier_melo/models/login_request_model.dart';
import 'package:rxdart/rxdart.dart';
import '../models/login_response_model.dart';

class LoginBloc extends Bloc {
  //Atributtes
  String _name = '';
  String _password = '';
  final SecurityUseCase _securityUseCase;
  final _loadingSubject = BehaviorSubject<bool>();
  final _emptyFieldsSubject = BehaviorSubject<bool>();
  final _userController = StreamController<String>();
  final _passwordController = StreamController<String>();

  ValueStream<bool> get emptyFields => _emptyFieldsSubject.stream;
  Sink<String> get nameSink => _userController.sink;
  Sink<String> get passwordSink => _passwordController.sink;
  ValueStream<bool> get loading => _loadingSubject.stream;
  //Constructor
  LoginBloc(this._securityUseCase) {
    _userController.stream.listen((user) {
      _name = user;
      validateEmptyFields(_name, _password);
    });
    _passwordController.stream.listen((password) {
      _password = password;
      validateEmptyFields(_name, _password);
    });
  }
  //Body Methods

  Future<LoginResponse> login() {
    _loadingSubject.add(true);

    return _securityUseCase
        .login(LoginRequest(name: _name, password: _password))
        .then((response) {
      _loadingSubject.add(false);
      return response;
    }).catchError((error) {
      _loadingSubject.add(false);
      return LoginResponse(
        statusCode: "501",
        token: "-1",
        message: "Error in server",
      );
    });
  }

  void validateEmptyFields(String name, String password) {
    if (name.trim().isEmpty || password.trim().isEmpty) {
      _emptyFieldsSubject.add(true);
    } else {
      _emptyFieldsSubject.add(false);
    }
  }

  //Dosposed Methods

  @override
  void dispose() {
    _loadingSubject.close();
    _userController.close();
    _passwordController.close();
  }
}
