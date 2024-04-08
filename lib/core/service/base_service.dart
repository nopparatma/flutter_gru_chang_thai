import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gru_chang_thai/app/app_config.dart';

abstract class BaseService {
  var appConfig = AppConfig.instance;

  var dio = Dio(
    BaseOptions(
      headers: {
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    ),
  )..interceptors.add(LogInterceptor());

  Future post(String url, dynamic data, Function(dynamic data) returnCallback) async {
    Response response;

    try {
      debugPrint('Request : $data');
      response = await dio.post(url, data: data);
      debugPrint('Response : ${response.data}');
    } catch (error) {
      debugPrint('Error Response : $error');
      rethrow;
    }

    return returnCallback(response.data);
  }

  String getApiUrl(String controllerName, String actionName) {
    return '${appConfig.gruChangThaiApiServerUrl}/$controllerName/$actionName';
  }
}
