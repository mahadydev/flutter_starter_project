import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides a contract for simple key-value storage.
abstract class SimpleStorageService {
  /// Stores a string value.
  Future<void> setString(final String key, final String value);

  /// Retrieves a string value.
  Future<String?> getString(final String key);

  /// Stores an integer value.
  Future<void> setInt(final String key, final int value);

  /// Retrieves an integer value.
  Future<int?> getInt(final String key);

  /// Stores a boolean value.
  Future<void> setBool(final String key, {required final bool value});

  /// Retrieves a boolean value.
  Future<bool?> getBool(final String key);

  /// Stores a double value.
  Future<void> setDouble(final String key, final double value);

  /// Retrieves a double value.
  Future<double?> getDouble(final String key);

  /// Stores a list of strings.
  Future<void> setStringList(final String key, final List<String> value);

  /// Retrieves a list of strings.
  Future<List<String>?> getStringList(final String key);

  /// Stores an object as a map.
  Future<void> setObject(final String key, final Map<String, dynamic> value);

  /// Retrieves an object as a map.
  Future<Map<String, dynamic>?> getObject(final String key);

  /// Removes a value by key.
  Future<void> remove(final String key);

  /// Clears all stored values.
  Future<void> clear();

  /// Checks if a key exists.
  Future<bool> containsKey(final String key);
}

class SimpleStorageServiceImpl implements SimpleStorageService {
  SimpleStorageServiceImpl._();

  late final SharedPreferences _prefs;
  bool _initialized = false;

  static Future<SimpleStorageServiceImpl> create() async {
    final SimpleStorageServiceImpl instance = SimpleStorageServiceImpl._();
    await instance.init();
    return instance;
  }

  Future<void> init() async {
    if (!_initialized) {
      _prefs = await SharedPreferences.getInstance();
      _initialized = true;
    }
  }

  void _ensureInitialized() {
    if (!_initialized) {
      throw Exception('StorageService not initialized. Call init() first.');
    }
  }

  @override
  Future<void> setString(final String key, final String value) async {
    _ensureInitialized();
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> getString(final String key) async {
    _ensureInitialized();
    return _prefs.getString(key);
  }

  @override
  Future<void> setInt(final String key, final int value) async {
    _ensureInitialized();
    await _prefs.setInt(key, value);
  }

  @override
  Future<int?> getInt(final String key) async {
    _ensureInitialized();
    return _prefs.getInt(key);
  }

  @override
  Future<void> setBool(final String key, {required final bool value}) async {
    _ensureInitialized();
    await _prefs.setBool(key, value);
  }

  @override
  Future<bool?> getBool(final String key) async {
    _ensureInitialized();
    return _prefs.getBool(key);
  }

  @override
  Future<void> setDouble(final String key, final double value) async {
    _ensureInitialized();
    await _prefs.setDouble(key, value);
  }

  @override
  Future<double?> getDouble(final String key) async {
    _ensureInitialized();
    return _prefs.getDouble(key);
  }

  @override
  Future<void> setStringList(final String key, final List<String> value) async {
    _ensureInitialized();
    await _prefs.setStringList(key, value);
  }

  @override
  Future<List<String>?> getStringList(final String key) async {
    _ensureInitialized();
    return _prefs.getStringList(key);
  }

  @override
  Future<void> setObject(
    final String key,
    final Map<String, dynamic> value,
  ) async {
    _ensureInitialized();
    final String jsonString = jsonEncode(value);
    await _prefs.setString(key, jsonString);
  }

  @override
  Future<Map<String, dynamic>?> getObject(final String key) async {
    _ensureInitialized();
    final String? jsonString = _prefs.getString(key);
    if (jsonString == null) {
      return null;
    }

    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<void> remove(final String key) async {
    _ensureInitialized();
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    _ensureInitialized();
    await _prefs.clear();
  }

  @override
  Future<bool> containsKey(final String key) async {
    _ensureInitialized();
    return _prefs.containsKey(key);
  }
}
