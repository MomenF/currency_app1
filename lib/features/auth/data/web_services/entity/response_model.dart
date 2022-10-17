import 'package:get/get_connect/http/src/response/response.dart';

class ResponseModel {
  bool success;
  String? errorCode;
  Response? res;
  ResponseModel({required this.success, this.errorCode, this.res});
}