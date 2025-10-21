import 'package:equatable/equatable.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class StartTimeSet extends GlobalEvent {
  const StartTimeSet();

  @override
  List<Object?> get props => [];
}

class GetGuestDataEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class GetInfoDataEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class CheckAppVersionEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}

class CheckMobileIdEvent extends GlobalEvent {
  final String mobileId;

  const CheckMobileIdEvent(this.mobileId);

  @override
  List<Object?> get props => [mobileId];
}

class EditUserDataEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}
