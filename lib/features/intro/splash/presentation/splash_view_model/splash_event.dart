import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class CheckUserTokenEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}
