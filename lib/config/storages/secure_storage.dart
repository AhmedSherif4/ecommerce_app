import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import 'keys.dart';

abstract class BaseAppSecurityData {
  Future<void> saveToken({required String token});

  Future<void> deleteToken();

  Future<String> getToken();
}

@LazySingleton(as: BaseAppSecurityData)
class AppSecurityData implements BaseAppSecurityData {
  final FlutterSecureStorage secureStorage;

  AppSecurityData({required this.secureStorage});

  @override
  Future<String> getToken() async {
    try {
      final token = await secureStorage.read(key: AppKeys.accessToken);
      print('token is $token');
      return token ?? 'not';
    } catch (e) {
      // Handle error
      return '';
    }
  }

  @override
  Future<void> saveToken({required String token}) async {
    try {
      await secureStorage.write(key: AppKeys.accessToken, value: token);
    } catch (e) {
      // Handle error
      throw Exception('Failed to save token $e');
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await secureStorage.delete(key: AppKeys.accessToken);
    } catch (e) {
      // Handle error
      throw Exception('Failed to delete token');
    }
  }
}
