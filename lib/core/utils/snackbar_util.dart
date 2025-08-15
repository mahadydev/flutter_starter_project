import 'package:flutter/material.dart';
import 'package:flutter_starter_project/app/app.dart';

class SnackbarUtil {
  static void showSnackbar({
    required String message,
    BuildContext? context, // Optional context
    Color? backgroundColor, // Optional background color
    Duration duration = const Duration(seconds: 3),
    double elevation = 6.0,
    EdgeInsets margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
  }) {
    if (context != null) {
      // Use context to show Snackbar with theme's primary color
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          duration: duration,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          elevation: elevation,
          margin: margin,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      );
    } else {
      // Use scaffoldMessengerKey to show Snackbar with provided background color
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          showCloseIcon: true,
          elevation: elevation,
          margin: margin,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      );
    }
  }
}
