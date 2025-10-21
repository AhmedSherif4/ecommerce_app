part of '../home_layout.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});
  final Map<String, String> appIcons = {
    AppStrings.home: Assets.homeHomeNavBar,
    AppStrings.search: Assets.homeSearch,
    AppStrings.saved: Assets.homeFavourite,
    AppStrings.cart: Assets.homeShopNavBar,
    AppStrings.account: Assets.homeAccount,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: Spacing.s5),
      height: Spacing.navBarH,
      child: BlocBuilder<HomeLayoutBloc, HomeLayoutState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(appIcons.length, (index) {
              return _ItemWidget(
                iconSvg: appIcons.values.elementAt(index),
                title: appIcons.keys.elementAt(index),
                isSelected: context.read<HomeLayoutBloc>().state.index == index,
                onTap: () {
                  context.read<HomeLayoutBloc>().add(
                    ChangeBottomNavBarIndexEvent(index),
                  );
                },
              );
            }),
          );
        },
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String title;
  final String iconSvg;
  final bool isSelected;
  final void Function()? onTap;

  const _ItemWidget({
    required this.title,
    required this.iconSvg,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: constraints.maxHeight * 0.4,
                child: SvgPicture.asset(
                  iconSvg,
                  width: Spacing.iconSizeS24,
                  height: Spacing.iconSizeS24,
                  fit: BoxFit.contain,
                  colorFilter: isSelected
                      ? ColorFilter.mode(
                          context.colors.primary9,
                          BlendMode.srcIn,
                        )
                      : ColorFilter.mode(
                          context.colors.primary4,
                          BlendMode.srcIn,
                        ),
                ),
              ),
              Flexible(
                child: Text(
                  title,
                  style: context.typography.caption.copyWith(
                    color: isSelected
                        ? context.colors.primary9
                        : context.colors.primary4,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
