import 'package:dio/dio.dart';

class MyCustomResponseEntity {
  bool success;
  String? errorCode;
  Response? response;
  MyCustomResponseEntity({required this.success, this.errorCode, this.response});
}
