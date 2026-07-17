
import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/utils/app_constatn.dart';

class ApiService {
  final Dio _dio;
  //
  ApiService({required this._dio}) {
    _dio.options = BaseOptions(
      baseUrl: AppConstant.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    _dio.interceptors.addAll([LogInterceptor()]);
  }
  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
  }) async {
    var response = await _dio.post(endPoint, data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    Response response = await _dio.get(endPoint);
    return response.data;
  }
}
