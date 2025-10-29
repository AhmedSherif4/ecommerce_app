part of '../../verification.dart';

class VerificationScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;

  const VerificationScreen({super.key, required this.arguments});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late final SignUpParameter signUpParameter;
  late final SendVerificationCodeParameter sendVerificationCodeParams;

  String code = '';
  bool reSend = false;

  @override
  void initState() {
    super.initState();
    signUpParameter = widget.arguments['signUpParameter'];
    sendVerificationCodeParams =
        widget.arguments['sendVerificationCodeParameter'];
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _checkCodeIsValid(bool isValid) {
    if (isValid) {
      context.read<VerificationBloc>().add(
        SignedUp(signUpParameter: signUpParameter),
      );
    } else {
      Navigator.pop(context);
      showSnackBar(
        description: AppStrings.verificationCodeIsNotCorrect,
        state: ToastStates.error,
        context: context,
      );
    }
  }

  void _goToHome() {
    RouteManager.rPushNamedAndRemoveUntil(
      context: context,
      rName: AppRoutesNames.rHomeLayoutView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationBloc, VerificationState>(
      listener: (context, state) {
        switch (state.checkVerificationStates) {
          case RequestStates.loading:
            showLoadingDialog(context);
          case RequestStates.loaded:
            _checkCodeIsValid(state.isCodeVerified);
          case RequestStates.error:
            Navigator.of(context).pop();
            showSnackBar(
              description: state.checkVerificationErrorMessage,
              state: ToastStates.error,
              context: context,
            );
          default:
        }

        switch (state.resendVerificationCodeStates) {
          case RequestStates.loading:
            showLoadingDialog(context);
          case RequestStates.loaded:
            Navigator.of(context).pop();
            showSnackBar(
              description: state.resendVerificationCodeMessage,
              state: ToastStates.info,
              context: context,
            );
          case RequestStates.error:
            Navigator.of(context).pop();
            showSnackBar(
              description: state.resendVerificationCodeMessage,
              state: ToastStates.error,
              context: context,
            );
          default:
        }

        switch (state.signUpStates) {
          case RequestStates.loaded:
            Navigator.pop(context);
            // AppAnalytics.signUpLogEvent(); //todo: analytics
            showSnackBar(
              description: state.signUpMessage,
              state: ToastStates.info,
              context: context,
            );
            _goToHome();
          case RequestStates.error:
            Navigator.pop(context);
            showSnackBar(
              description: state.signUpMessage,
              state: ToastStates.error,
              context: context,
            );
          default:
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppSize.s10.sizedBoxHeight,
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: BackButtonWidget(),
                ),
                Spacing.spaceHS24,
                Text(
                  AppStrings.verificationTitle,
                  style: context.typography.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Spacing.spaceHS16,
                Text(
                  AppStrings.verificationDescription,
                  style: context.typography.bodySmall,
                  textAlign: TextAlign.center,
                ),
                Spacing.spaceHS32,
                PinCodeFieldWidget(
                  onComplete: (value) {
                    code = value;
                  },
                ),
                Spacing.spaceHS16,

                StatefulBuilder(
                  builder: (context, setBuilderState) {
                    return Row(
                      children: [
                        _ResendCodeWidget(
                          onPressed: (reSend)
                              ? () {
                                  context.read<VerificationBloc>().add(
                                    VerificationCodeResent(
                                      sendVerificationCodeParams:
                                          sendVerificationCodeParams,
                                    ),
                                  );
                                  setBuilderState(() {
                                    reSend = false;
                                  });
                                }
                              : null,
                        ),
                        if (!reSend)
                          TimerToResend(
                            canSend: (canSend) {
                              setBuilderState(() {
                                reSend = canSend;
                              });
                            },
                          ),
                      ],
                    );
                  },
                ),

                Spacing.spaceHS24,

                DefaultButtonWidget(
                  label: AppStrings.verification,
                  onPressed: () async {
                    getIt<BaseAppSecurityData>().deleteToken().then((value) {
                      if (context.mounted) {
                        context.read<VerificationBloc>().add(
                          VerificationCodeChecked(
                            code: code,
                            email: signUpParameter.email,
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ).paddingBody(),
      ),
    );
  }
}

class _ResendCodeWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const _ResendCodeWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.didNotReceiveCodeYet,
            style: context.typography.bodySmall,
          ),
          TextSpan(
            text: onPressed != null
                ? AppStrings.resendCode
                : AppStrings.resendCodeAfter,
            style: onPressed != null
                ? context.typography.bodyMedium.copyWith(
                    decoration: TextDecoration.underline,
                  )
                : context.typography.bodySmall,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
          ),
        ],
      ),
    );
  }
}

class TimerToResend extends StatefulWidget {
  final Function(bool) canSend;

  const TimerToResend({super.key, required this.canSend});

  @override
  State<TimerToResend> createState() => _TimerToResendState();
}

class _TimerToResendState extends State<TimerToResend> {
  int _secondsRemaining = 180;

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 1); // Change the duration as needed
    _timer = Timer.periodic(duration, (timer) {
      if (_secondsRemaining == 0) {
        _timer!.cancel();
        setState(() {
          widget.canSend(true);
        });
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      ' $_secondsRemaining  ${AppStrings.second} ',
      style: context.typography.bodySmall,
    );
  }
}
