import 'package:e_commerece_app/core/utils/app_constatn.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheHelper {
  static late Box _box;

  //! Initialize Hive cache
  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(AppConstant.isVisitedOnboarding);
  }

  //! Get String data
  static String? getDataString({required String key}) {
    return _box.get(key) as String?;
  }

  //! Save data (supports all types)
  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    await _box.put(key, value);
  }

  //! Get any data
  static dynamic getData({required String key}) {
    return _box.get(key);
  }

  //! Remove data using specific key
  static Future<void> removeData({required String key}) async {
    await _box.delete(key);
  }

  //! Check if local database contains {key}
  static bool containsKey({required String key}) {
    return _box.containsKey(key);
  }

  //! Clear all data in the local database
  static Future<void> clearData() async {
    await _box.clear();
  }

  //! Put data (generic)
  static Future<void> put({required String key, required dynamic value}) async {
    await _box.put(key, value);
  }

  //! Get all keys
  static List<dynamic> getKeys() {
    return _box.keys.toList();
  }

  //! Get all values
  static List<dynamic> getValues() {
    return _box.values.toList();
  }

  //! Get all data as Map
  static Map<dynamic, dynamic> getAll() {
    return _box.toMap();
  }

  //! Get List of Strings
  static List<String>? getDataStringList({required String key}) {
    final data = _box.get(key);
    return data != null ? List<String>.from(data) : null;
  }

  //! Get List of Integers
  static List<int>? getDataIntList({required String key}) {
    final data = _box.get(key);
    return data != null ? List<int>.from(data) : null;
  }

  //! Get Boolean data
  static bool? getDataBool({required String key}) {
    return _box.get(key) as bool?;
  }

  //! Get Integer data
  static int? getDataInt({required String key}) {
    return _box.get(key) as int?;
  }

  //! Get Double data
  static double? getDataDouble({required String key}) {
    return _box.get(key) as double?;
  }

  //! Save List of Strings
  static Future<void> saveStringList({
    required String key,
    required List<String> value,
  }) async {
    await _box.put(key, value);
  }

  //! Save List of Integers
  static Future<void> saveIntList({
    required String key,
    required List<int> value,
  }) async {
    await _box.put(key, value);
  }

  //! Save Map data
  static Future<void> saveMap({required String key, required Map value}) async {
    await _box.put(key, value);
  }

  //! Get Map data
  static Map? getDataMap({required String key}) {
    return _box.get(key) as Map?;
  }

  //! Check if box is empty
  static bool isEmpty() {
    return _box.isEmpty;
  }

  //! Get box length
  static int getLength() {
    return _box.length;
  }

  //! Close box (optional)
  static Future<void> close() async {
    await _box.close();
  }

  //! Delete box completely
  static Future<void> deleteBox() async {
    await _box.deleteFromDisk();
  }

  //! Check if Hive is initialized
  static bool isInitialized() {
    return Hive.isBoxOpen('app_cache');
  }
}
