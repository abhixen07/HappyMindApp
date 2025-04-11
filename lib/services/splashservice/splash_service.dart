import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/routes/app_routes.dart';

class SplashService {
  /// Starts a timer before navigating to the next screen.
  void startTimer(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      if (context.mounted) {
        navigateToPage(context);
      }
    });
  }

  /// Navigates to the next page based on conditions
  Future<void> navigateToPage(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isOnboardingShown = prefs.getBool('onboardingShown') ?? false;

    if (!isOnboardingShown) {
      // Navigate to the onboarding screen
      if (context.mounted) {
        context.goNamed(NamedRoutes.onBoardPage.name);
      }
      prefs.setBool('onboardingShown', true); // Mark onboarding as shown
      return;
    }

    // Proceed with token checks
    String? token = prefs.getString('token');
    String? userId = prefs.getString('userId');

    if (token == null || token.isEmpty || isTokenExpired(token) || userId == null) {
      if (context.mounted) {
        context.goNamed(NamedRoutes.loginpage.name);
      }
    } else {
      if (context.mounted) {
        context.goNamed(NamedRoutes.navbarpage.name);
      }
    }





    // context.goNamed(NamedRoutes.onBoardPage.name);

    // });
  }
  /// Check if the token is expired
  bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }
}
