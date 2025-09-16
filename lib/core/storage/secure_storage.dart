import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageService {
  Future<void> setString(final String key, final String value);
  Future<String?> getString(final String key);
  Future<void> setBool(final String key, {required final bool value});
  Future<bool?> getBool(final String key);
  Future<void> setInt(final String key, final int value);
  Future<int?> getInt(final String key);
  Future<void> setDouble(final String key, final double value);
  Future<double?> getDouble(final String key);
  Future<void> setStringList(final String key, final List<String> value);
  Future<List<String>?> getStringList(final String key);
  Future<void> setObject(final String key, final Map<String, dynamic> value);
  Future<Map<String, dynamic>?> getObject(final String key);
  Future<void> remove(final String key);
  Future<void> clear();
  Future<bool> containsKey(final String key);
}

class SecureStorageServiceImpl implements SecureStorageService {
  // Public factory constructor
  factory SecureStorageServiceImpl() {
    return SecureStorageServiceImpl._();
  }
  SecureStorageServiceImpl._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> setString(final String key, final String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> getString(final String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> setBool(final String key, {required final bool value}) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<bool?> getBool(final String key) async {
    final String? value = await _storage.read(key: key);
    if (value == null) {
      return null;
    }
    return value.toLowerCase() == 'true';
  }

  @override
  Future<void> setInt(final String key, final int value) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<int?> getInt(final String key) async {
    final String? value = await _storage.read(key: key);
    if (value == null) {
      return null;
    }
    return int.tryParse(value);
  }

  @override
  Future<void> setDouble(final String key, final double value) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<double?> getDouble(final String key) async {
    final String? value = await _storage.read(key: key);
    if (value == null) {
      return null;
    }
    return double.tryParse(value);
  }

  @override
  Future<void> setStringList(final String key, final List<String> value) async {
    final String jsonString = jsonEncode(value);
    await _storage.write(key: key, value: jsonString);
  }

  @override
  Future<List<String>?> getStringList(final String key) async {
    final String? jsonString = await _storage.read(key: key);
    if (jsonString == null) {
      return null;
    }
    try {
      final List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;
      return List<String>.from(decoded);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> setObject(
    final String key,
    final Map<String, dynamic> value,
  ) async {
    final String jsonString = jsonEncode(value);
    await _storage.write(key: key, value: jsonString);
  }

  @override
  Future<Map<String, dynamic>?> getObject(final String key) async {
    final String? jsonString = await _storage.read(key: key);
    if (jsonString == null) {
      return null;
    }
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> remove(final String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> containsKey(final String key) {
    return _storage.containsKey(key: key);
  }
}
