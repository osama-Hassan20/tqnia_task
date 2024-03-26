import 'package:chat_gpt/core/controllers/const/api_key.dart';
import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;
  static init()
  {
    dio =Dio(
      BaseOptions(
        baseUrl:baseUrl ,
        receiveDataWhenStatusError: true,

      ),
    );
  }


  static Future<Response> getData({
    required String url,
  })async
  {
    dio!.options.headers =
    {
      'Content-TypType':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
      'Authorization':'Bearer $apiKey',
    };
    return await dio!.get(
      url,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
  }) async
  {

    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
      'Authorization':'Bearer $apiKey',
    };

    return await dio!.post(
      url,
      data: data,
    );
  }


  static Future<Response?> putData({
    required String url,
    required Map<String,dynamic> data,
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
      'Authorization':'Bearer $apiKey',
    };
    return dio!.put(
      url,
      data: data,

    );
  }


  static Future<Response?> deleteData({
    required String url,
    required Map<String,dynamic> data,
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'Accept':'*/*',
      'Connection':'keep-alive',
      'Authorization':'Bearer $apiKey',
    };
    return dio!.delete(
      url,
      data: data,

    );
  }

}