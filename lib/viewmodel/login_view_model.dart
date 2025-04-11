import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/routes/app_routes.dart';
import '../repositories/auth_repository/auth_repository.dart';
import '../utils/utils.dart';

class LoginViewModel extends GetxController {
  final _api = AuthRepository();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  late SharedPreferences prefs;
  // bool isButtonEnabled = false;


  //
  // void checkFields() {
  //   setState(() {
  //     isButtonEnabled =
  //         emailController.value.text.isNotEmpty && passwordController.value.text.isNotEmpty;
  //   });
  // }


  @override
  void dispose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    emailFocusNode.value.dispose();
    passwordFocusNode.value.dispose();
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser(BuildContext context) async {
    loading.value = true;

    final data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    try {
      final response = await _api.loginUser(data);
      loading.value = false;

      if (response != null && response is Map<String, dynamic>) {
        final message = response['message'];

        if (message == 'Login successful') {
          final token = response['token'];
          final user = response['user'];

          if (user != null && token != null) {
            // Extract user details
            final userId = user['id'].toString();
            final fullName = user['fullName'];
            final email = user['email'];
            final phoneNumber = user['phonenumber'];
            final createdAt = user['createdAt'];
            final updatedAt = user['updatedAt'];

            // Save to SharedPreferences
            await prefs.setString('token', token);
            await prefs.setString('userId', userId);
            await prefs.setString('fullName', fullName);
            await prefs.setString('email', email);
            await prefs.setString('phonenumber', phoneNumber);
            await prefs.setString('createdAt', createdAt);
            await prefs.setString('updatedAt', updatedAt);

            // Optionally save password (if needed)
            await prefs.setString('password', passwordController.value.text);

            // Clear input fields
            emailController.value.clear();
            passwordController.value.clear();

            // Show success message
            Utils.snackbar(context, 'Login', 'Login successful');
            context.goNamed(NamedRoutes.navbarpage.name);
          } else {
            Utils.snackbar(context, 'Login', 'Failed to retrieve user or token');
          }
        } else {
          Utils.snackbar(context, 'Login Failed', 'Incorrect Email or Password');
        }
      } else {
        Utils.snackbar(context, 'Error', 'Invalid response from server');
      }
    } catch (e) {
      loading.value = false;
      debugPrint('Error During Login Catch: $e');
      Utils.snackbar(context, 'Login Failed', 'Incorrect Email or Password');
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    if (!Get.isRegistered<SharedPreferences>()) {
      prefs = await SharedPreferences.getInstance();
    }

    await prefs.remove('token');
    await prefs.remove('user');
    await prefs.remove('fullName');
    await prefs.remove('email');
    await prefs.remove('userId');
    // await prefs.clear(); // Clear all user session data

    context.goNamed(NamedRoutes.loginpage.name);
  }
}
