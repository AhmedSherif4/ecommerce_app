import 'package:dartz/dartz.dart';
import '../../../../../core/failure/failure.dart';
import '../entity/contact_us_entity.dart';

abstract class ContactUsBaseRepository {
  Future<Either<Failure, ContactUsEntity>> getContacts();
}
