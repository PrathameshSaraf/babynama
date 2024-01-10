import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalStorageService {
  Future<bool> init() => GetStorage.init();

  Future<void> writeRes(String key, List value) =>
      GetStorage().write(key, value);

  Future<void> write(String key, dynamic value) =>
      GetStorage().write(key, value);

  List? readRes(String key) => GetStorage().read<List>(key);

  T? read<T>(String key) => GetStorage().read<T>(key);

  Future<void> delete(String key) => GetStorage().remove(key);

  Future<void> clear() => GetStorage().erase();

    List<String> getAllKeys() => GetStorage().getKeys().toList();


  final String appLockKey = 'app_lock';
  bool isAppLock() => GetStorage().read<bool>(appLockKey) ?? false;

  Future<void> setAppLock(bool value) => GetStorage().write(appLockKey, value);
}
