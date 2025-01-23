import '../constant/const_string.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../feature/auth/data/model/login_data_model.dart';

final class LocalService {
  const LocalService._();
  static LocalService? _instance;
  static LocalService get instance => _instance ??= const LocalService._();

  // Initialize Hive and open the default box
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(LoginDataModelAdapter());
    await Hive.openBox(ConstHive.defaultBox);
    // await Hive.box(ConstHive.defaultBox).clear();
  }

  // Save a value to Hive
  Future<void> save<T>({required String key, required T value}) async {
    final box = Hive.box(ConstHive.defaultBox);
    await box.put(key, value);
  }

  // Get a value from Hive
  T? get<T>(String key) {
    final box = Hive.box(ConstHive.defaultBox);
    return box.get(key) as T?;
  }

  //Delete a value from Hive
  Future<void> delete(String key) async {
    final box = Hive.box(ConstHive.defaultBox);
    await box.delete(key);
  }

  // Check if a key exists
  bool containsKey(String key) {
    final box = Hive.box(ConstHive.defaultBox);
    return box.containsKey(key);
  }

  // Clear all data in the box
  Future<void> clear() async {
    final box = Hive.box(ConstHive.defaultBox);
    await box.clear();
  }
}
