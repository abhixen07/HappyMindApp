import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'app_exception.dart';
import 'base_api_service.dart';



class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOutException();
    }
    return responseJson;
  }


  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print('Request URL: $url');
      print('Request Data: $data');
    }
    final headers = {
      'x-api-key': '21343534534535434',
      "Content-Type": "application/json",

    };

    dynamic responseJson;



    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('No Internet connection');
    } on TimeoutException {
      throw RequestTimeOutException('Request timed out');
    } catch (e) {
      throw FetchDataException('An unexpected error occurred: $e');
    }

    return responseJson;
  }




  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'] ?? 'Bad request';
        throw BadRequestException(message);
      case 401:
      case 403:
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'] ?? 'Unauthorized or Forbidden';
        throw UnauthorizedException(message);
      case 404:
        final responseBody = jsonDecode(response.body);
        final message = responseBody['message'] ?? 'User not found';
        throw FetchDataException(message);
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            'Error occurred with status code: ${response.statusCode}');
    }
  }





}