
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../config/base_local_data_source/base_local_data_source.dart';
import '../../../config/storages/keys.dart';

abstract class OnBoardingLocalData {
  Future<void> saveOnBoardingValue({required bool isShowed});

  Future<bool> getOnBoardingValue();
}

@LazySingleton(as: OnBoardingLocalData)
class OnBoardingLocalDataImpl extends OnBoardingLocalData {
  final BaseLocalDataSource baseLocalDataSource;

  OnBoardingLocalDataImpl({required this.baseLocalDataSource});

  @override
  Future<bool> getOnBoardingValue() async {
    await Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.onBoardingViewed));
    await Hive.openBox<bool>(AppKeys.onBoardingViewed);
    final isShow = await baseLocalDataSource.getDataFromLocal<bool>(
      labelKey: AppKeys.onBoardingViewed,
    );
    // isShow.log();
    if (isShow == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<void> saveOnBoardingValue({required bool isShowed}) async {
    await Hive.openBox<String>(AppKeys.getExpirationKey(AppKeys.onBoardingViewed));
    await Hive.openBox<bool>(AppKeys.onBoardingViewed);
    await baseLocalDataSource.saveDataInLocal<bool>(
      labelKey: AppKeys.onBoardingViewed,
      data: isShowed,
        expirationDuration: const Duration(days: 365),
    );
  }
}
