part of '../../sign_up.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class VerificationCodeSentEvent extends SignUpEvent {
  final SendVerificationCodeParameter sendVerificationCodeParams;

  const VerificationCodeSentEvent({required this.sendVerificationCodeParams});

  @override
  List<Object> get props => [sendVerificationCodeParams];
}
