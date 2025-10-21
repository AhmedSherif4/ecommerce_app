import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';

import '../entity/subscribe_child_entity.dart';

abstract class HomeLayoutRepository {
  Future<Either<Failure, SubscribeChildWithTopicEntity>> checkChildIsSubscribe({
    required int childId,
  });
}
