part of '../../login.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoggedIn extends LoginEvent {
  final String email;
  final String password;

  const LoggedIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SocialLoginEvent extends LoginEvent {
  final String socialId;
  const SocialLoginEvent({required this.socialId});

  @override
  List<Object?> get props => [socialId];
}
