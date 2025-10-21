import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/config/base_repository/base_repository.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/features/home_layout/data/data_source/home_layout_remote_data_source/home_layout_remote_data_source.dart';
import 'package:ecommerce_app/features/home_layout/domain/entity/subscribe_child_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/home_layout_repository.dart';

@LazySingleton(as: HomeLayoutRepository)
class HomeLayoutRepositoryImpl implements HomeLayoutRepository {
  final BaseRepository baseRepository;
  final HomeLayoutRemoteDataSource homeLayoutRemoteDataSource;

  HomeLayoutRepositoryImpl({
    required this.baseRepository,
    required this.homeLayoutRemoteDataSource,
  });

  @override
  Future<Either<Failure, SubscribeChildWithTopicEntity>> checkChildIsSubscribe({
    required int childId,
  }) async {
    final subscribeChildWithTopic = await baseRepository
        .checkExceptionForRemoteData(
          homeLayoutRemoteDataSource.checkChildIsSubscribe(childId: childId),
        );

    return subscribeChildWithTopic.fold(
      (failure) => Left(failure),
      (data) => Right(data),
    );
  }
}
