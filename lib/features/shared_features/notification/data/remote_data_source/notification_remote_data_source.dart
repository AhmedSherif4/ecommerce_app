import 'package:ecommerce_app/config/base_remote_data_source/base_remote_data_source.dart';
import 'package:ecommerce_app/core/api/api_consumer.dart';
import 'package:ecommerce_app/features/shared_features/notification/data/model/notification_model.dart';
import 'package:ecommerce_app/features/shared_features/notification/domain/entity/notification_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/end_points.dart';
import '../../domain/repository/notification_repository.dart';
import '../model/pagination_model.dart';

abstract class NotificationRemoteDataSource {
  Future<NotificationEntity> getNotification({required int pageNumber});

  Future<String> readAllNotification();

  Future<String> updateNotification({
    required NotificationManagerParameters notificationManagerParameters,
  });
}

@LazySingleton(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl extends NotificationRemoteDataSource {
  final BaseRemoteDataSource remoteDataSource;
  final ApiConsumer apiConsumer;

  NotificationRemoteDataSourceImpl({
    required this.remoteDataSource,
    required this.apiConsumer,
  });

  @override
  Future<NotificationEntity> getNotification({required int pageNumber}) async {
    final response = await remoteDataSource.postData(
      url: '${EndPoints.childNotification}?page=$pageNumber',
      body: {},
    );
    if (response['data'] == null) {
      return NotificationEntity(
        paginationEntity: PaginationModel.fromJson(response['pagination']),
        notifications: const [],
        unReadNotificationCount: 0,
      );
    } else {
      return NotificationModel.fromJson(response['data']);
    }
  }

  @override
  Future<String> readAllNotification() async {
    final response = await remoteDataSource.postData(
      url: EndPoints.childReadAllNotification,
      body: {},
    );
    return response['message'] ?? '';
  }

  @override
  Future<String> updateNotification({
    required NotificationManagerParameters notificationManagerParameters,
  }) async {
    final response = await remoteDataSource.postData(
      url: EndPoints.institutionUpdateNotification,
      body: {
        'noti_mark_exam': notificationManagerParameters.markExam,
        'noti_reupload_exam': notificationManagerParameters.reUploadExam,
        'noti_lesson_finish': notificationManagerParameters.lessonFinish,
        'noti_login': notificationManagerParameters.login,
        'noti_session_time': notificationManagerParameters.sessionTime,
      },
    );

    return response['message'] ?? '';
  }
}
