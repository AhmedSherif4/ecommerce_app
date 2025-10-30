part of '../../account.dart';

class _ListTileModel {
  final String title;
  final String iconSvg;
  final VoidCallback onTap;
  _ListTileModel({
    required this.title,
    required this.iconSvg,
    required this.onTap,
  });
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  List<_ListTileModel> tiles(BuildContext context) => [
    _ListTileModel(
      title: 'My Orders',
      iconSvg: Assets.projectIconBox,
      onTap: () {
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rMyOrdersScreen,
        );
      },
    ),
    _ListTileModel(
      title: 'My Details',
      iconSvg: Assets.projectIconDetails,
      onTap: () {
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rProfileDetailsScreen,
        );
      },
    ),
    _ListTileModel(
      title: 'Address Book',
      iconSvg: Assets.projectIconAddress,
      onTap: () {
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rAddressScreen,
        );
      },
    ),
    _ListTileModel(
      title: 'Payment Methods',
      iconSvg: Assets.projectIconCard,
      onTap: () {
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rPaymentMethodsScreen,
        );
      },
    ),
    _ListTileModel(
      title: 'Notifications',
      iconSvg: Assets.projectIconBell,
      onTap: () {
        'notification'.log();
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rNotificationManagerScreen,
        );
      },
    ),
    _ListTileModel(
      title: 'FAQs',
      iconSvg: Assets.projectIconQuestion,
      onTap: () {
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rFaqsScreen,
        );
      },
    ),
    _ListTileModel(
      title: 'Help Center',
      iconSvg: Assets.projectIconHeadphones,
      onTap: () {
        RouteManager.rPushNamed(
          context: context,
          rName: AppRoutesNames.rHelpCenterScreen,
        );
      },
    ),
    _ListTileModel(
      title: 'Logout',
      iconSvg: Assets.projectIconLogout,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderForMore(title: 'Account'),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: tiles(context).length,

                separatorBuilder: (_, __) =>
                    Divider(thickness: 1, color: context.colors.primary1),
                itemBuilder: (context, index) {
                  return _ListTileWidget(
                    title: tiles(context)[index].title,
                    iconSvg: tiles(context)[index].iconSvg,
                    onTap: tiles(context)[index].onTap,
                    isLast: index == tiles(context).length - 1,
                  );
                },
              ),
            ],
          ),
        ),
      ).paddingBody(),
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String iconSvg;
  final String title;
  final bool isLast;

  const _ListTileWidget({
    required this.onTap,
    required this.iconSvg,
    required this.title,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: Spacing.s100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              height: Spacing.iconSizeS24,
              width: Spacing.iconSizeS24,
              child: SvgPicture.asset(
                iconSvg,
                height: Spacing.iconSizeS20,
                width: Spacing.iconSizeS20,
                colorFilter: isLast
                    ? ColorFilter.mode(context.colors.red, BlendMode.srcIn)
                    : null,
              ),
            ),
            Spacing.spaceSW10,

            Expanded(
              child: Text(
                title,
                style: context.typography.titleMedium.copyWith(
                  color: isLast ? context.colors.red : null,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!isLast)
              SvgPicture.asset(
                Assets.projectIconChevron,
                height: Spacing.iconSizeS24,
                width: Spacing.iconSizeS24,
              ),
          ],
        ),
      ),
    );
  }
}
