part of '../.././sign_up.dart';

@LazySingleton()
class SendVerificationCodeUseCase
    extends BaseUseCase<String, SendVerificationCodeParameter> {
  final SignUpBaseRepository repository;

  SendVerificationCodeUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(
    SendVerificationCodeParameter parameter,
  ) async {
    return await repository.sendVerificationCode(
      sendVerificationCodeParameter: parameter,
    );
  }
}

class SendVerificationCodeParameter extends Equatable {
  final String email;

  const SendVerificationCodeParameter({required this.email});

  @override
  List<Object?> get props => [email];
}
