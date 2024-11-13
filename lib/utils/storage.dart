import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

///
///本地存储
///
class StorageUtil {
  static final StorageUtil _instance = StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences? _prefs;

  StorageUtil._() {
    init();
  }

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<bool?> setJSON(String key, dynamic jsonVal) async {
    String jsonString = jsonEncode(jsonVal);
    return await setValue(key, jsonString);
  }

  Future<bool?> setValue(String key, dynamic value) async {
    if (value is String) {
      return await _prefs?.setString(key, value);
    } else if (value is int) {
      return await _prefs?.setInt(key, value);
    } else if (value is bool) {
      return await _prefs?.setBool(key, value);
    } else if (value is double) {
      return await _prefs?.setDouble(key, value);
    } else {
      return await _prefs?.setStringList(key, value);
    }
  }

  dynamic getJSON(String key) {
    String? jsonString = _prefs?.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  List<String>? getStringList(String key) {
    return _prefs?.getStringList(key);
  }

  Future<bool>? remove(String key) {
    return _prefs?.remove(key);
  }
}
