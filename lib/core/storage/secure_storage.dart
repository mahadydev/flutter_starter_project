import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageService {
  Future<void> setString(String key, String value);
  Future<String?> getString(String key);
  Future<void> setBool(String key, {required bool value});
  Future<bool?> getBool(String key);
  Future<void> setInt(String key, int value);
  Future<int?> getInt(String key);
  Future<void> setDouble(String key, double value);
  Future<double?> getDouble(String key);
  Future<void> setStringList(String key, List<String> value);
  Future<List<String>?> getStringList(String key);
  Future<void> setObject(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>?> getObject(String key);
  Future<void> remove(String key);
  Future<void> clear();
  Future<bool> containsKey(String key);
}

class SecureStorageServiceImpl implements SecureStorageService {
  // Public factory constructor
  factory SecureStorageServiceImpl() {
    return SecureStorageServiceImpl._();
  }
  SecureStorageServiceImpl._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> setString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> getString(String key) async {
    return _storage.read(key: key);
  }

  @override
  Future<void> setBool(String key, {required bool value}) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<bool?> getBool(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) {
      return null;
    }
    return value.toLowerCase() == 'true';
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<int?> getInt(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) {
      return null;
    }
    return int.tryParse(value);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<double?> getDouble(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) {
      return null;
    }
    return double.tryParse(value);
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    final jsonString = jsonEncode(value);
    await _storage.write(key: key, value: jsonString);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    final jsonString = await _storage.read(key: key);
    if (jsonString == null) {
      return null;
    }
    try {
      final decoded = jsonDecode(jsonString) as List<dynamic>;
      return List<String>.from(decoded);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> setObject(String key, Map<String, dynamic> value) async {
    final jsonString = jsonEncode(value);
    await _storage.write(key: key, value: jsonString);
  }

  @override
  Future<Map<String, dynamic>?> getObject(String key) async {
    final jsonString = await _storage.read(key: key);
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
  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> containsKey(String key) async {
    return _storage.containsKey(key: key);
  }
}
