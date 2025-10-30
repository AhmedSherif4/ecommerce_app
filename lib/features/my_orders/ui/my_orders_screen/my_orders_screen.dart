part of '../../my_orders.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
          builder: (context, state) {
            return Column(
              children: [
                const HeaderForMore(title: 'My Orders'),
                Spacing.spaceHS16,
                CustomTabs(
                  firstTabText: 'Ongoing',
                  secondTabText: 'Completed',
                  onTabChanged: (index) =>
                      context.read<MyOrdersCubit>().changeTab(index),
                ),
                Expanded(
                  child: IndexedStack(
                    index: state.currentIndex,
                    children: const [OngoingScreen(), CompletedScreen()],
                  ),
                ),
              ],
            );
          },
        ),
      ).paddingBody(),
    );
  }
}

class OngoingScreen extends StatelessWidget {
  const OngoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const _ProductCardCart(isCompleted: false),
      itemCount: 3,
    );
  }
}

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => const _ProductCardCart(isCompleted: true),
      itemCount: 3,
    );
  }
}
