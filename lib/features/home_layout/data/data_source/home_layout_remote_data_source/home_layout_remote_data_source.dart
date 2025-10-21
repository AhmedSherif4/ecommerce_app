import 'package:ecommerce_app/config/base_remote_data_source/base_remote_data_source.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/features/home_layout/data/data_source/model/subscribe_child_with_topic_model.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entity/subscribe_child_entity.dart';

abstract class HomeLayoutRemoteDataSource {
  Future<SubscribeChildWithTopicEntity> checkChildIsSubscribe({
    required int childId,
  });
}

@LazySingleton(as: HomeLayoutRemoteDataSource)
class HomeLayoutRemoteDataSourceImpl implements HomeLayoutRemoteDataSource {
  final BaseRemoteDataSource baseRemoteDataSource;

  HomeLayoutRemoteDataSourceImpl(this.baseRemoteDataSource);

  @override
  Future<SubscribeChildWithTopicEntity> checkChildIsSubscribe({
    required int childId,
  }) async {
    final response = await baseRemoteDataSource.postData(
      url: EndPoints.checkChildIsSubscribe,
      body: {'child_id': childId},
    );
    return SubscribeChildWithTopicModel.fromJson(response['data']);
  }
}
