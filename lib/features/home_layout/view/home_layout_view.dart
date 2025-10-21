part of '../home_layout.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  @override
  void initState() {
    super.initState();
    //todo: open it when you active the analytics
    // AppAnalytics.viewHomeScreenLogEvent();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutBloc, HomeLayoutState>(
      listener: (context, bState) async {
        if (bState.checkChildIsSubscribedState == RequestStates.loaded) {
          await getIt<INotificationService>().subscribeToTopic(
            bState.subscribeChildWithTopicEntity.topic,
          );
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: AppReference.userIsGuest() ? true : false,
          onPopInvokedWithResult: (value, _) async {
            if (!AppReference.userIsGuest()) {
              showDialog(
                context: context,
                builder: (context) => ExitAndUpdateDialog(
                  withImage: false,
                  title: AppStrings.exist,
                  message: AppStrings.wantToExist,
                  confirm: (bool wantExit) {},
                ),
              );
            }
          },
          child: Scaffold(
            body: context.read<HomeLayoutBloc>().appFlow[state.index],
            bottomNavigationBar: CustomBottomNavBar(),
          ),
        );
      },
    );
  }
}
