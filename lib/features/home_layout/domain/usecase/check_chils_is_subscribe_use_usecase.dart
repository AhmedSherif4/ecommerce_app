import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failure/failure.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:ecommerce_app/features/home_layout/domain/repository/home_layout_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/subscribe_child_entity.dart';

@LazySingleton()
class CheckChildIsSubscribeUseCase
    extends BaseUseCase<SubscribeChildWithTopicEntity, int> {
  final HomeLayoutRepository homeLayoutRepository;

  CheckChildIsSubscribeUseCase({required this.homeLayoutRepository});

  @override
  Future<Either<Failure, SubscribeChildWithTopicEntity>> call(
    int parameter,
  ) async {
    return await homeLayoutRepository.checkChildIsSubscribe(childId: parameter);
  }
}
