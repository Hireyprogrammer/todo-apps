import 'package:get_storage/get_storage.dart';
import 'package:todo_app/core/services/logger_service.dart';

class StorageService {
  final _box = GetStorage();
  static const _tokenKey = 'auth_token';

  Future<void> init() async {
    await GetStorage.init();
  }

  Future<void> saveToken(String token) async {
    AppLogger.storageOperation('Saving auth token');
    try {
      await _box.write(_tokenKey, token);
      AppLogger.storageOperation('Token saved successfully');
    } catch (e) {
      AppLogger.storageError('saveToken', e);
      rethrow;
    }
  }

  String? getToken() {
    return _box.read(_tokenKey);
  }

  Future<void> removeToken() async {
    await _box.remove(_tokenKey);
  }

  bool get isLoggedIn => getToken() != null;
} 