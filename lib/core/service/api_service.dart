import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constant/const_string.dart';

final class ApiService {
  final Dio _dio;
  static ApiService? _instance;
  const ApiService._(this._dio);
  static ApiService get instance => _instance ??= ApiService._(Dio());

  Future<Map<String, dynamic>> get({
    required int userId,
    required String endPoint,
    required String userToken,
  }) async {
    final Response response = await _dio.get(
      "${ConstApi.baseUrl}/$endPoint",
      options: Options(
        headers: {
          "user-id": userId,
          "user-token": userToken,
          "Authorization": ConstApi.secretKey,
        },
      ),
    );
    // print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final Response response = await _dio.post(
      "${ConstApi.baseUrl}/$endPoint",
      data: FormData.fromMap(data),
      options: Options(
        headers: {"Authorization": ConstApi.secretKey},
      ),
    );
    // print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> postWithHeader({
    required String endPoint,
    required int userId,
    required String userToken,
    required Map<String, dynamic> data,
  }) async {
    final Response response = await _dio.post(
      "${ConstApi.baseUrl}/$endPoint",
      data: FormData.fromMap(data),
      options: Options(
        headers: {
          "user-id": userId,
          "user-token": userToken,
          "Authorization": ConstApi.secretKey,
        },
      ),
    );
    // print(response.data);
    return response.data;
  }

  Future<Response<dynamic>> download(String url, String filePath) async {
    final Response response = await _dio.download(
      url,
      filePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          debugPrint(
              "Progress: ${(received / total * 100).toStringAsFixed(0)}%");
        }
      },
    );
    return response;
  }
}
