part of '../../checkout.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HeaderForMore(title: 'Payment Methods'),
                    Divider(thickness: 1, color: context.colors.primary1),
                    const PaymentMethodListScreen(),
                    DefaultButtonWidget(
                      label: 'Add New Card',
                      buttonColor: context.colors.primary0,
                      borderColor: context.colors.primary2,
                      textColor: context.colors.primary9,
                      icon: Assets.projectIconPlus,
                      iconSize: Spacing.iconSizeS24,
                      onPressed: () {
                        final newPaymentMethod = PaymentMethodModel(
                          expireDate: '07/23',
                          cardNumber: '**** **** **** 2512',
                          securityCode: '133',
                          isSelected: false,
                          isDefault: false,
                        );
                        context.read<CheckoutCubit>().addPaymentMethod(
                          newPaymentMethod,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            DefaultButtonWidget(
              label: 'Apply',
              onPressed: () {
                context.read<CheckoutCubit>().setDefaultPaymentMethod(
                  context.read<CheckoutCubit>().state.cards.indexWhere(
                    (address) => address.isSelected,
                  ),
                );
              },
            ),
          ],
        ),
      ).paddingBody(),
    );
  }
}

class PaymentMethodListScreen extends StatelessWidget {
  const PaymentMethodListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: state.cards.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final address = state.cards[index];
            return PaymentMethodCard(
              address: address,
              onTap: () =>
                  context.read<CheckoutCubit>().selectPaymentMethod(index),
            );
          },
        );
      },
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodModel address;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        height: Spacing.s100,
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: address.isSelected
              ? context.colors.primary1.withOpacity(0.05)
              : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: context.colors.primary1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ✅ Circle icon to indicate selected

            // 📍 Location Icon + Texts
            SvgPicture.asset(
              Assets.projectIconBxlVisa,
              height: Spacing.iconSizeS24,
              width: Spacing.iconSizeS24,
            ),
            Spacing.spaceSW5,

            Expanded(
              child: Row(
                children: [
                  Text(
                    address.cardNumber,
                    style: context.typography.bodyMedium,
                  ),
                  if (address.isDefault) ...[
                    Spacing.spaceSW5,
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.primary5.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "Default",
                        style: context.typography.bodySmall.copyWith(
                          color: context.colors.primary9,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Spacing.spaceSW10,
            Icon(
              address.isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: address.isSelected
                  ? context.colors.primary9
                  : context.colors.primary5,
            ),
          ],
        ),
      ),
    );
  }
}
