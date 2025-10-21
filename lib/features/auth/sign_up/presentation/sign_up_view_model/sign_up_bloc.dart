part of '../../sign_up.dart';

@Injectable()
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SendVerificationCodeUseCase sendVerificationCodeUseCase;

  SignUpBloc(this.sendVerificationCodeUseCase) : super(const SignUpState()) {
    on<VerificationCodeSentEvent>(_sendVerificationCode);
  }

  void _sendVerificationCode(VerificationCodeSentEvent event, emit) async {
    emit(
      state.copyWith(
        sendVerificationCodeStates: RequestStates.loading,
        getGoogleIdAndUserDataByGoogleAccountState: RequestStates.initial,
        pickImageState: PickImageState.init,
      ),
    );
    final result = await sendVerificationCodeUseCase(
      event.sendVerificationCodeParams,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          sendVerificationCodeStates: RequestStates.error,
          sendVerificationCodeMessage: failure.message,
        ),
      ),
      (success) {
        return emit(
          state.copyWith(
            sendVerificationCodeStates: RequestStates.loaded,
            sendVerificationCodeMessage: success,
          ),
        );
      },
    );
  }
}
