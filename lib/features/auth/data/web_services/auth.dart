import 'dart:convert';

import 'package:currency_app/features/auth/data/web_services/api_engine/api_engine.dart';
import 'package:currency_app/features/auth/data/web_services/api_engine/request_method.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../model/register_model.dart';
import 'entity/response_model.dart';


class AuthCore {
  static Future<ResponseModel> signUp({})async{
  ResponseModel response = await ApiEngine.request(
      requestMethod: RequestMethod.post,
      path: EndPoints)
  }
}
enum authStatus {success,field}