import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/routes/app_routes.dart';
import '../repositories/auth_repository/auth_repository.dart';
import '../utils/utils.dart';

class SignUpViewModel extends GetxController {
  final _api = AuthRepository();
  RxBool loading = false.obs;

  final fullNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final phonenumberController = TextEditingController().obs;

  final fullNameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;
  final phoneFocusNode = FocusNode().obs;

  late SharedPreferences prefs;

  @override
  void dispose() {
    fullNameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    phonenumberController.value.dispose();
    fullNameFocusNode.value.dispose();
    emailFocusNode.value.dispose();
    passwordFocusNode.value.dispose();
    confirmPasswordFocusNode.value.dispose();
    phoneFocusNode.value.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    initSharedPrefs();
  }

  Future<void> initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> signUpUser(BuildContext context) async {
    loading.value = true;

    final data = {
      'fullName': fullNameController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'phonenumber': phonenumberController.value.text,
    };

    try {
      final response = await _api.signUpUser(data);
      loading.value = false;

      if (response != null && response['id'] != null) {
        final userId = response['id'].toString();
        final fullName = response['fullName'];
        final email = response['email'];
        final phonenumber = response['phonenumber'];

        await prefs.setString('userId', userId);
        await prefs.setString('fullName', fullName ?? '');
        await prefs.setString('email', email ?? '');
        await prefs.setString('phonenumber', phonenumber ?? '');
        await prefs.setString('password', passwordController.value.text);

        Utils.snackbar(context, 'Success', 'User signed up successfully');
        context.goNamed(NamedRoutes.loginpage.name);

        // Clear input fields
        fullNameController.value.clear();
        emailController.value.clear();
        passwordController.value.clear();
        confirmPasswordController.value.clear();
        phonenumberController.value.clear();
      } else {
        Utils.snackbar(context, 'Error', 'Sign up failed. Please try again.');
      }
    } catch (error) {
      loading.value = false;
      Utils.snackbar(context, 'Error', 'Account Already Exists');
    }
  }
}
