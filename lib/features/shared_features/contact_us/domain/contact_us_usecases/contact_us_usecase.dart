import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/failure/failure.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../contact_us_base_repository/contact_us_base_repository.dart';
import '../entity/contact_us_entity.dart';

@LazySingleton()
class GetContactUsUseCase extends BaseUseCase<ContactUsEntity, NoParameter> {
  final ContactUsBaseRepository repository;

  GetContactUsUseCase({required this.repository});

  @override
  Future<Either<Failure, ContactUsEntity>> call(NoParameter parameter) async {
    return await repository.getContacts();
  }
}
