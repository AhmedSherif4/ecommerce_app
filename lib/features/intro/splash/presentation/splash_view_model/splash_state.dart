import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final bool isValidToken;
  final RequestStates checkTokenEventIsFinish;
  // final PhysicalDeviceState checkIsRealDevice;
  final String checkTokenErrorMessage;

  const SplashState({
    this.isValidToken = false,
    this.checkTokenEventIsFinish = RequestStates.initial,
    this.checkTokenErrorMessage = '',
  });

  SplashState copyWith({
    bool? isValidToken,
    RequestStates? checkTokenEventIsFinish,
    String? checkTokenErrorMessage,
  }) {
    return SplashState(
      isValidToken: isValidToken ?? this.isValidToken,
      checkTokenEventIsFinish:
          checkTokenEventIsFinish ?? this.checkTokenEventIsFinish,
      checkTokenErrorMessage:
          checkTokenErrorMessage ?? this.checkTokenErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    isValidToken,
    checkTokenEventIsFinish,
    checkTokenErrorMessage,
  ];
}
