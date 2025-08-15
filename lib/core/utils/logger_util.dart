import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

/// This utility class provides a simple interface for logging messages at different levels
/// (debug, info, warning, error, verbose) using the Logger package.
/// It uses a PrettyPrinter to format the log messages, including a human-readable date format with am/pm.
/// Example usage:
/// LoggerUtil.debug('This is a debug message');
/// LoggerUtil.info('This is an info message');
/// LoggerUtil.warning('This is a warning message');
/// LoggerUtil.error('This is an error message', error, stackTrace);
/// LoggerUtil.verbose('This is a verbose message');
class LoggerUtil {
  static final Logger _logger = Logger(
    filter: kDebugMode ? DevelopmentFilter() : ProductionFilter(),
    output: ConsoleOutput(),
    printer: PrettyPrinter(
      dateTimeFormat: (time) =>
          DateFormat('yyyy-MM-dd hh:mm:ss a').format(time),
    ),
  );

  static void debug(String message) => _logger.d(message);
  static void info(String message) => _logger.i(message);
  static void warning(String message) => _logger.w(message);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
  static void verbose(String message) => _logger.t(message);
}
