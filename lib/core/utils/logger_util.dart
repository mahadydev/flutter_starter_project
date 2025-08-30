import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

/// Logger utility class for centralized logging.
class LoggerUtil {
  /// Optional convenience factory so callers can do `LoggerUtil()`
  ///to get the singleton.
  factory LoggerUtil() => instance;

  LoggerUtil._internal()
    : _logger = Logger(
        filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
        output: ConsoleOutput(),
        printer: PrettyPrinter(
          dateTimeFormat: (final DateTime time) =>
              DateFormat('yyyy-MM-dd hh:mm:ss a').format(time),
        ),
      );

  final Logger _logger;

  /// Singleton instance of LoggerUtil.
  static final LoggerUtil instance = LoggerUtil._internal();

  /// Log a message at the debug level.
  void debug(final String message) => _logger.d(message);

  /// Log a message at the info level.
  void info(final String message) => _logger.i(message);

  /// Log a message at the warning level.
  void warning(final String message) => _logger.w(message);

  /// Log a message at the error level.
  void error(
    final String message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) => _logger.e(message, error: error, stackTrace: stackTrace);

  /// Log a message at the verbose level.
  void verbose(final String message) => _logger.t(message);
}
