import 'dart:ffi';
import 'package:flutter/material.dart';

import '../../data/app_url.dart';
import '../../data/network_api_service.dart';


class AuthRepository{
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginUser(Map<String, String> data) async {
    try {
      final response = await _apiServices.postApi(loginUrl, data);
      return response;
    } catch (e) {
      /// Log the error or handle it as needed
      debugPrint('Login error: $e');
      throw e;  /// Rethrow or handle the exception
    }
  }


  Future<dynamic> signUpUser(Map<String, String> data) async {
    try {
      final response = await _apiServices.postApi(
          signUpUrl,
          data);
      return response;
    } catch (e) {
      /// Log the error or handle it as needed
      debugPrint('Signup error: $e');
      throw e;   /// Rethrow or handle the exception
    }
  }

  //
  // Future<dynamic> forgetPassword(Map<String, String> data) async {
  //   try {
  //     final response = await _apiServices.postApi(
  //         forgetPasswordUrl,
  //         data);
  //     return response;
  //   } catch (e) {
  //     /// Log the error or handle it as needed
  //     debugPrint('Forget Password error: $e');
  //     throw e;   /// Rethrow or handle the exception
  //   }
  // }






}