import 'custom_error_model.dart';

enum Status {
  success,
  loading,
  error,
}

class ResultResponse<T> {
  Status? status;
  T? data;
  CustomError? error;
  Map<String, String>? errors;

  ResultResponse.loading(this.data) {
    status = Status.loading;
  }

  ResultResponse.success(this.data) {
    status = Status.success;
  }

  ResultResponse.error({String? message, String? code, CustomError? error}) {
    status = Status.error;
    this.error = error ??
        CustomError(
          message: message,
          code: code,
        );
    errors = {};
  }

  ResultResponse.errors(this.errors) {
    status = Status.error;
  }
}
