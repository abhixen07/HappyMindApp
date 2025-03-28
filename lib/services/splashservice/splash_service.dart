import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    // WidgetsBinding.instance.addPostFrameCallback((_) {

        context.goNamed(NamedRoutes.onBoardPage.name);

    // });
  }
}
