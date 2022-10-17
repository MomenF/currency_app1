import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../print_log.dart';
import '../web_services_export.dart';

class ApiEngine {
  static void initDio() {
    myDio = Dio(
      BaseOptions(
        connectTimeout: 12000,
        receiveTimeout: 12000,
        sendTimeout: 12000,
        validateStatus: (code) {
          return (code ?? 500) <= 500;
        },
        headers: {
          "Accept": "*/*",
          "Connection": "keep-alive",
        },
        baseUrl: EndPoints.baseUrl,
        responseType: ResponseType.plain,
      ),
    );
    myDio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        responseHeader: true,
        requestHeader: true,
        request: true,
      ),
    );
  }

  static Future<MyCustomResponseEntity> request<T>(
      {required RequestMethod requestMethod,
      required path,
      String? pathVar,
      Map<String, dynamic>? queryParameters,
      var data,
      Options? options}) async {
    MyCustomResponseEntity myCustomResponseEntity;
    try {
      Response response = await sendRequest(
        requestMethod: requestMethod,
        path: path,
        queryParameters: queryParameters,
        options: options,
        data: data,
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        printLog(
            stateID: "050491",
            data: 'is Done ==> ${response.data.toString()}<==',
            isSuccess: false);
        myCustomResponseEntity = MyCustomResponseEntity(success: true, response: response);
      } else {
        /// Server Error
        printLog(
            stateID: "530235",
            data: 'Server Error ==> ${response.data}<==',
            isSuccess: false);

        ErrorData errorData = ErrorData.fromJson(jsonDecode(response.data));
        myCustomResponseEntity = MyCustomResponseEntity(success: false, errorCode: errorData.code ?? "8870");
      }
    } on DioError catch (error) {
      /// Dio Error
      printLog(
          stateID: "083195",
          data: 'Dio Error ==> ${error.toString()}<==',
          isSuccess: false);

      if (error.type == DioErrorType.response && error.response != null) {
        try {
          ErrorData errorData = ErrorData.fromJson(jsonDecode(error.response?.data));
          myCustomResponseEntity = MyCustomResponseEntity(success: false, errorCode: errorData.code ?? "");
        } catch (e) {
          myCustomResponseEntity = MyCustomResponseEntity(success: false, errorCode: "7787");
        }
      } else if (error.message == "XMLHttpRequest error." ||
          error.type == DioErrorType.connectTimeout ||
          error.error is SocketException ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        myCustomResponseEntity = MyCustomResponseEntity(success: false, errorCode: "7");
      } else {
        myCustomResponseEntity = MyCustomResponseEntity(success: false, errorCode: "8872");
      }
    } on FormatException {
      /// Format Exception
      printLog(stateID: '501041', data: 'Format Error', isSuccess: false);
      myCustomResponseEntity = MyCustomResponseEntity(success: false, errorCode: "02210");
    } catch (error) {
      /// Other Error
      printLog(
          stateID: "245234",
          data: 'Other Error ==> ${error.toString()}<==',
          isSuccess: false);
      myCustomResponseEntity = MyCustomResponseEntity(success: false, errorCode: "9976");
    }
    return myCustomResponseEntity;
  }
}
