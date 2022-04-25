import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:leal_test_by_javier_melo/localizations/l_error_constants.dart';
import 'package:leal_test_by_javier_melo/models/result_response_model.dart';
import 'package:leal_test_by_javier_melo/utils/connectivity/my_connectivity.dart';

class ApiBaseSource {
  final String? baseUrl;
  final http.Client client;
  final MyConnectivity? connectivity;

  final Duration timeout = const Duration(seconds: 60);

  ApiBaseSource(this.baseUrl, this.client, this.connectivity);

  Future<ResultResponse<T>> get<T>(
      String url, T Function(dynamic value) mapperFunction,
      {Map<String, String>? headers}) async {
    try {
      var connectivityResult = await connectivity!.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return ResultResponse<T>.error(
            message: LErrorConstants.internetNotAvailable);
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      log("Method: GET  , Headers: ${headers.toString()} ",
          name: "method_$url");

      var response =
          await client.get(Uri.parse(url), headers: headers).timeout(timeout);
      return await _manageResponse("GET", url, response, mapperFunction);
    } catch (ex) {
      log("${ex}_url", name: 'error');
      return ResultResponse<T>.error(message: LErrorConstants.defaultError);
    }
  }

  Future<ResultResponse<T>> _manageResponse<T>(String method, String url,
      http.Response response, T Function(dynamic value) mapperFunction) async {
    if (response.statusCode == 200) {
      var responseStringUtf8 = utf8.decode(response.bodyBytes);
      try {
        return ResultResponse<T>.success(
            mapperFunction(_getBody(responseStringUtf8)));
      } catch (e) {
        return ResultResponse<T>.success(
            mapperFunction(responseStringUtf8.toString()));
      }
    } else {
      return _manageError<T>(response);
    }
  }

  ResultResponse<T> _manageError<T>(http.Response response) {
    if (response.statusCode >= 500) {
      return ResultResponse<T>.error(message: LErrorConstants.defaultError);
    } else if (response.statusCode == 401) {
      return ResultResponse<T>.error(message: LErrorConstants.defaultError);
    } else if (response.statusCode == 400) {
      var responseError = utf8.decode(response.bodyBytes);
      try {
        var body = _getBody(responseError);
        return ResultResponse<T>.error(
            message: body['message'], code: body['code']);
      } catch (e) {
        return ResultResponse<T>.error(
            message: LErrorConstants.errorGlobal, code: "400");
      }
    } else if (response.statusCode == 500) {
      try {
        var responseError = jsonDecode(response.body);
        return ResultResponse<T>.error(
            message: responseError['message'], code: "500");
      } catch (e) {
        return ResultResponse<T>.error(
            message: LErrorConstants.serverError, code: "500");
      }
    } else {
      return _errorFromMap(response);
    }
  }

  ResultResponse<T> _errorFromMap<T>(http.Response response) {
    try {
      Map<String, dynamic> body = jsonDecode(response.body);
      String? description = body['description'];
      description = description ?? LErrorConstants.defaultError;
      String? code = body['code'];
      return ResultResponse<T>.error(message: description, code: code);
    } catch (ex) {
      return ResultResponse<T>.error(message: LErrorConstants.defaultError);
    }
  }

  Future<Map<String, String>> getHeaders(Map<String, String>? headers) async {
    headers = headers ?? {};

    return headers;
  }

  dynamic _getBody(body) {
    String bodyString;
    if (body is String) {
      bodyString = body;
    } else {
      bodyString = utf8.decode(body);
    }
    try {
      return json.decode(bodyString);
    } catch (ex) {
      return bodyString;
    }
  }
}
