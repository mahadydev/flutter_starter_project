import 'dart:developer';

import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log the error
    log(
      'DioError: ${err.message}',
      error: err.error,
      stackTrace: err.stackTrace,
    );

    String errorMessage;

    // Handle specific error types
    if (err.type == DioExceptionType.connectionTimeout) {
      errorMessage =
          'Connection timeout. Please check your internet connection.';
    } else if (err.type == DioExceptionType.sendTimeout) {
      errorMessage = 'Request timeout. Please try again.';
    } else if (err.type == DioExceptionType.receiveTimeout) {
      errorMessage = 'Server took too long to respond. Please try again later.';
    } else if (err.type == DioExceptionType.badResponse) {
      final statusCode = err.response?.statusCode;
      if (statusCode == 401) {
        errorMessage = 'Unauthorized. Please log in again.';
      } else if (statusCode == 404) {
        errorMessage =
            'Not found. The requested resource was not found. $statusCode';
      } else if (statusCode == 500) {
        errorMessage = 'Server error. Please try again later.';
      } else {
        errorMessage = 'Unexpected server error: $statusCode.';
      }
    } else if (err.type == DioExceptionType.cancel) {
      errorMessage = 'Request was cancelled. Please try again.';
    } else if (err.type == DioExceptionType.unknown) {
      errorMessage = 'An unexpected error occurred. Please try again.';
    } else {
      errorMessage =
          'An unknown error occurred. Status code: ${err.response?.statusCode}';
    }

    // Create a new DioException with the updated error message
    final updatedError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: errorMessage,
      stackTrace: err.stackTrace,
      message: errorMessage,
    );

    // Pass the updated error to the next handler
    super.onError(updatedError, handler);
  }
}
