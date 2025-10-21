import 'package:ecommerce_app/core/shared_models/user/user_entity/user_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/enum/enum_generation.dart';

class GetSocialDataState extends Equatable {
  final RequestStates getGoogleDataState;
  final RequestStates getAppleDataState;
  final bool isCompletedProfile;
  final UserEntity? user;
  final String loginMessage;

  const GetSocialDataState({
    this.getGoogleDataState = RequestStates.initial,
    this.getAppleDataState = RequestStates.initial,
    this.loginMessage = '',
    this.isCompletedProfile = false,
    this.user,
  });

  GetSocialDataState copyWith({
    RequestStates? getGoogleDataState,
    RequestStates? getAppleDataState,
    bool? isCompletedProfile,
    UserEntity? user,
    RequestStates? socialLoginStates,
    String? loginMessage,
  }) {
    return GetSocialDataState(
      getGoogleDataState: getGoogleDataState ?? this.getGoogleDataState,
      getAppleDataState: getAppleDataState ?? this.getAppleDataState,
      isCompletedProfile: isCompletedProfile ?? this.isCompletedProfile,
      loginMessage: loginMessage ?? this.loginMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    getGoogleDataState,
    getAppleDataState,
    isCompletedProfile,
    loginMessage,
    user,
  ];
}
