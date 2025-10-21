// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../login.dart';

@LazySingleton()
class LoginUseCase extends BaseUseCase<UserEntity, LoginParameter> {
  final LoginBaseRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(LoginParameter parameter) async {
    return await repository.login(
      email: parameter.email,
      password: parameter.password,
    );
  }
}

class LoginParameter extends Equatable {
  final String email;
  final String password;

  const LoginParameter({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
