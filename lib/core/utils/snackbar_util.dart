import 'package:flutter/material.dart';
import 'package:flutter_starter_project/app/app.dart';

/// Utility for showing SnackBars using either a BuildContext or
/// the global scaffoldMessengerKey.
class SnackbarUtil {
  // Private constructor to prevent instantiation.
  const SnackbarUtil._();

  /// Shows a Snackbar with the given [message].
  static void showSnackbar({
    required final String message,
    final BuildContext? context, // Optional context
    final Color? backgroundColor, // Optional background color
    final Duration duration = const Duration(seconds: 3),
    final double elevation = 6.0,
    final EdgeInsets margin = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    final BorderRadius borderRadius = const BorderRadius.all(
      Radius.circular(8),
    ),
  }) {
    if (context != null) {
      // Use context to show Snackbar with theme's primary color
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
          duration: duration,
          showCloseIcon: true,
          behavior: SnackBarBehavior.floating,
          elevation: elevation,
          margin: margin,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      );
    } else {
      // Use scaffoldMessengerKey to show Snackbar with provided color
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
