import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../resources/app_constants.dart';
import '../storages/keys.dart';

abstract class BaseLocalDataSource {
  /// حفظ قائمة من البيانات في التخزين المحلي مع وقت انتهاء صلاحية
  Future<void> saveListOfDataInLocal<T>({
    required String labelKey,
    required List<T> data,
    Duration expirationDuration = const Duration(
      hours: AppConstants.appLocalDurationInHours,
    ),
  });

  /// استرجاع قائمة من البيانات من التخزين المحلي
  Future<List<T>?> getListOfDataFromLocal<T>({required String labelKey});

  /// حفظ عنصر واحد في التخزين المحلي مع وقت انتهاء صلاحية
  Future<void> saveDataInLocal<T>({
    required String labelKey,
    required T data,
    Duration expirationDuration = const Duration(
      hours: AppConstants.appLocalDurationInHours,
    ),
  });

  /// استرجاع عنصر واحد من التخزين المحلي
  Future<T?> getDataFromLocal<T>({required String labelKey});

  /// تحديث عنصر في قائمة بناءً على الـ index
  Future<void> updateListDataInLocal<T>({
    required int index,
    required String labelKey,
    required T updatedData,
    Duration expirationDuration = const Duration(
      hours: AppConstants.appLocalDurationInHours,
    ),
  });

  /// حذف كل البيانات المرتبطة بالـ labelKey
  Future<void> deleteDataAt<T>(String labelKey);

  /// حذف عنصر معين من قائمة بناءً على الـ index
  Future<void> deleteItemInKey<T>({
    required String labelKey,
    required int index,
  });

  /// التحقق من أن البيانات لم تنتهِ صلاحيتها
  Future<bool> isDataExpired(String labelKey);
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImpl implements BaseLocalDataSource {
  /// الحصول على صندوق البيانات
  Box<T> _getDataBox<T>(String labelKey) => Hive.box<T>(labelKey);

  /// الحصول على صندوق انتهاء الصلاحية
  Box<String> _getExpirationBox(String labelKey) =>
      Hive.box<String>(AppKeys.getExpirationKey(labelKey));

  /// حفظ وقت انتهاء الصلاحية
  Future<void> _saveExpirationTime(
    String labelKey,
    Duration expirationDuration,
  ) async {
    final expirationBox = _getExpirationBox(labelKey);
    final expirationTime = DateTime.now()
        .add(expirationDuration)
        .toIso8601String();
    await expirationBox.put(AppKeys.getExpirationKey(labelKey), expirationTime);
  }

  /// التحقق من أن البيانات انتهت صلاحيتها
  @override
  Future<bool> isDataExpired(String labelKey) async {
    try {
      final expirationBox = _getExpirationBox(labelKey);
      final expirationTimeString = expirationBox.get(
        AppKeys.getExpirationKey(labelKey),
      );

      if (expirationTimeString == null) return true;

      final expirationTime = DateTime.parse(expirationTimeString);
      return expirationTime.isBefore(DateTime.now());
    } catch (e) {
      return true;
    }
  }

  @override
  Future<void> saveListOfDataInLocal<T>({
    required String labelKey,
    required List<T> data,
    Duration expirationDuration = const Duration(
      hours: AppConstants.appLocalDurationInHours,
    ),
  }) async {
    try {
      // await _saveExpirationTime(labelKey, expirationDuration);

      final dataBox = _getDataBox<T>(labelKey);
      await dataBox.clear(); // تنظيف البيانات القديمة قبل الحفظ
      await dataBox.addAll(data);
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<List<T>?> getListOfDataFromLocal<T>({required String labelKey}) async {
    try {
      final box = _getDataBox<T>(labelKey);

      if (box.isEmpty) return null;

      // // التحقق من انتهاء الصلاحية
      // if (await isDataExpired(labelKey)) {
      //   await deleteDataAt<T>(labelKey);
      //   return null;
      // }

      return box.values.toList();
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> saveDataInLocal<T>({
    required String labelKey,
    required T data,
    Duration expirationDuration = const Duration(
      hours: AppConstants.appLocalDurationInHours,
    ),
  }) async {
    try {
      await _saveExpirationTime(labelKey, expirationDuration);

      final dataBox = _getDataBox<T>(labelKey);
      await dataBox.put(labelKey, data);
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<T?> getDataFromLocal<T>({required String labelKey}) async {
    try {
      final dataBox = _getDataBox<T>(labelKey);
      final data = dataBox.get(labelKey);

      if (data == null) return null;

      // التحقق من انتهاء الصلاحية
      if (await isDataExpired(labelKey)) {
        await dataBox.delete(labelKey);
        return null;
      }

      return data;
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> updateListDataInLocal<T>({
    required int index,
    required String labelKey,
    required T updatedData,
    Duration expirationDuration = const Duration(
      hours: AppConstants.appLocalDurationInHours,
    ),
  }) async {
    try {
      final dataBox = _getDataBox<T>(labelKey);

      if (index < 0 || index >= dataBox.length) {
        throw RangeError('Index out of range');
      }

      await _saveExpirationTime(labelKey, expirationDuration);
      await dataBox.putAt(index, updatedData);
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> deleteDataAt<T>(String labelKey) async {
    try {
      final expirationBox = _getExpirationBox(labelKey);
      final dataBox = _getDataBox<T>(labelKey);

      await expirationBox.clear();
      await dataBox.clear();
    } on HiveError {
      rethrow;
    }
  }

  @override
  Future<void> deleteItemInKey<T>({
    required String labelKey,
    required int index,
  }) async {
    try {
      final dataBox = _getDataBox<T>(labelKey);
      final dataList = dataBox.values.toList();

      if (index < 0 || index >= dataList.length) {
        throw RangeError('Index out of range');
      }

      dataList.removeAt(index);

      await dataBox.clear();
      await dataBox.addAll(dataList);
    } on HiveError {
      rethrow;
    }
  }
}
