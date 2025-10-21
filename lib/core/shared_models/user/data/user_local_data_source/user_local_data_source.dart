import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../../../config/storages/keys.dart';
import '../../user_entity/user_entity.dart';


abstract class UserLocalDataSource {
  Future<void> saveUserData({required UserEntity userModel});

  UserEntity? getUserData();
}

@LazySingleton(
  as: UserLocalDataSource,
)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  final BaseLocalDataSource baseLocalDataSource;

  UserLocalDataSourceImpl({required this.baseLocalDataSource});

  @override
  UserEntity? getUserData() {
    try {
      final dataBox = Hive.box<UserEntity>(AppKeys.userData);

      final data = dataBox.get(AppKeys.userData);

      return data;
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> saveUserData({required UserEntity userModel}) async {
    try {
      final dataBox = Hive.box<UserEntity>(
        AppKeys.userData,
      );

      dataBox.put(AppKeys.userData, userModel);
    } on HiveError {
      rethrow;
    }
  }
}
