import 'dart:convert';

import 'package:currency_app/features/auth/data/web_services/api_engine/api_engine.dart';
import 'package:currency_app/features/auth/data/web_services/api_engine/request_method.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../model/register_model.dart';
import '../model/sign_model.dart';
import 'endpoint.dart';
import 'entity/my_custom_response_entity.dart';
import 'entity/response_model.dart';

class AuthCore {
  static Future<MyCustomResponseEntity> signIn(SignInModel signInModel) async {
    MyCustomResponseEntity response = await ApiEngine.request(
        requestMethod: RequestMethod.post,
        path: EndPoints.login,
        data: signInModel.toJson());
    return response;
  }

  static Future<MyCustomResponseEntity> signUp(RegisterModel? registerModel
      ) async {
    MyCustomResponseEntity response = await ApiEngine.request(
        requestMethod: RequestMethod.post,
        path: EndPoints.register,
        data: registerModel);
    return response;
  }
}
enum authStatus {success,field}