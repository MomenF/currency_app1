import 'package:get/get.dart';


class BaseRepository extends GetConnect{

    Future<Response>  fetch(String uri) async {
      final response =
          await get(uri);
      return response;
    }

    Future<Response> setPostRequest(String uri,Map<String,dynamic> request) async {
      final response = await post(uri,request);
      return response;
    }

}