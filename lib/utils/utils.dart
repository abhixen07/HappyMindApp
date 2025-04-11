import 'package:flutter/material.dart';

import '../app/style/style.dart';

class Utils {
  /// Snackbar method using ScaffoldMessenger
  static void snackbar(BuildContext context, String title, String message) {
    final snackBar = SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            message,
            style: const TextStyle(color: lightGreyColor),
          ),
        ],
      ),
      backgroundColor: darkGreenColor, /// Customize background color
      elevation: 0,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(10), /// Optional margin for floating snackbar
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar() /// Optional: Hides the current snackbar if already displayed
      ..showSnackBar(snackBar);
  }
}
