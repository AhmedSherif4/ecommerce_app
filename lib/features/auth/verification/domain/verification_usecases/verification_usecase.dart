part of '../../verification.dart';

@LazySingleton()
class CheckVerificationCodeUseCase
    extends BaseUseCase<bool, CheckVerificationCodeParameter> {
  final VerificationBaseRepository repository;

  CheckVerificationCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(CheckVerificationCodeParameter parameter) {
    return repository.checkVerificationCode(
      code: parameter.code,
      email: parameter.emailOrPhone,
    );
  }
}

class CheckVerificationCodeParameter extends Equatable {
  final String code;
  final String emailOrPhone;

  const CheckVerificationCodeParameter({
    required this.code,
    required this.emailOrPhone,
  });

  @override
  List<Object?> get props => [code, emailOrPhone];
}

@LazySingleton()
class ResendVerificationCodeUseCase
    extends BaseUseCase<String, SendVerificationCodeParameter> {
  final VerificationBaseRepository repository;

  ResendVerificationCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(
    SendVerificationCodeParameter parameter,
  ) {
    return repository.resendVerificationCode(
      sendVerificationCodeParameter: parameter,
    );
  }
}

@LazySingleton()
class SignUpUseCase extends BaseUseCase<UserEntity, SignUpParameter> {
  final VerificationBaseRepository repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParameter parameter) {
    return repository.signUp(signUpParameter: parameter);
  }
}

class SignUpParameter extends Equatable {
  final String name;
  final String phone;
  final String email;
  final String gender;
  final String img;
  final String password;

  final String address;

  const SignUpParameter({
    required this.password,
    required this.name,
    required this.phone,
    this.email = '',
    required this.gender,
    this.img = '',
    this.address = '',
  });

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    gender,
    img,
    password,
    address,
  ];
}
