part of '../../un_link.dart';

class UnLinkButton extends StatefulWidget {
  final int userId;

  const UnLinkButton({super.key, required this.userId});

  @override
  State<UnLinkButton> createState() => _UnLinkButtonState();
}

class _UnLinkButtonState extends State<UnLinkButton> {
  bool confirmUnlink = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UnLinkBloc, UnLinkState>(
      listener: (context, state) {
        switch (state.unLinkState) {
          case RequestStates.loading:
            showLoadingDialog(context);
          case RequestStates.loaded:
            Navigator.pop(context);
            showSnackBar(
              description: state.unLinkMessage,
              state: ToastStates.warning,
              context: context,
            );
          case RequestStates.error:
            showSnackBar(
              description: state.unLinkMessage,
              state: ToastStates.error,
              context: context,
            );
          default:
        }
      },
      child: CustomTileWithArrowWidget(
        isUnlink: true,
        title: 'الغاء الارتباط بالطالب؟',
        asset: Assets.homeDeleteRed,
        onTap: () {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => DefaultAlertDialog(
              message: 'الغاء الارتباط بالطالب؟',
              confirm: (value) {
                confirmUnlink = value;
              },
            ),
          ).then((value) {
            if (confirmUnlink) {
              if (!context.mounted) return;
              BlocProvider.of<UnLinkBloc>(
                context,
              ).add(UserUnLinkEvent(userId: widget.userId));
            }
          });
        },
      ),
    );
  }
}
