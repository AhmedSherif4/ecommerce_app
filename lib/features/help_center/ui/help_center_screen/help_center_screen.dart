part of '../../help_center.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderForMore(title: 'Help Center'),
              Spacing.spaceHS32,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _TileWidget(),
                separatorBuilder: (context, index) =>
                    Divider(thickness: 1, color: context.colors.primary1),
                itemCount: 3,
              ),
            ],
          ),
        ),
      ).paddingBody(),
    );
  }
}

class _TileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Spacing.s50,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: context.colors.primary1),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Row(
        spacing: 15.w,
        children: [
          SvgPicture.asset(
            Assets.projectIconHeadphones,
            width: Spacing.iconSizeS24,
            height: Spacing.iconSizeS24,
          ),
          Flexible(
            child: Text(
              'Custom Service',
              style: context.typography.titleMedium,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
