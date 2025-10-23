part of '../../checkout.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
                    HeaderForMore(title: 'Checkout'),
                    Divider(thickness: 1, color: context.colors.primary1),
                    DeliveryAddress(),
                    Spacing.spaceHS10,
                    Divider(thickness: 1, color: context.colors.primary1),
                    Spacing.spaceHS10,
                    PaymentMethod(),
                    Spacing.spaceHS10,
                    Divider(thickness: 1, color: context.colors.primary1),
                    Spacing.spaceHS10,
                    SubTotal(),
                    DiscountWidget(),
                  ],
                ),
              ),
            ),
            DefaultButtonWidget(label: 'Place Order', onPressed: () {}),
          ],
        ),
      ).paddingBody(),
    );
  }
}

class DeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery Address', style: context.typography.titleMedium),
            TextButton(
              onPressed: () {
                RouteManager.rPushNamed(
                  context: context,
                  rName: AppRoutesNames.rAddressScreen,
                );
              },
              child: Text(
                'Change',
                textAlign: TextAlign.right,
                style: context.typography.bodyMedium.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        Spacing.spaceHS5,

        Row(
          children: [
            SvgPicture.asset(
              Assets.projectIconLocation,
              height: Spacing.iconSizeS24,
              width: Spacing.iconSizeS24,
            ),
            Spacing.spaceSW5,

            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text('Home', style: context.typography.bodyMedium),
                Text(
                  '925 S Chugach St #APT 10, Alaska 99645',
                  style: context.typography.bodyMedium.copyWith(
                    color: context.colors.primary5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Method', style: context.typography.titleMedium),
        Spacing.spaceHS16,
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: context.colors.primary9, // context.colors.primary0
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: context.colors.primary1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 6,
                children: [
                  SvgPicture.asset(
                    Assets.projectIconCard,
                    width: Spacing.iconSizeS24,
                    height: Spacing.iconSizeS24,
                    clipBehavior: Clip.antiAlias,
                    colorFilter: ColorFilter.mode(
                      context.colors.primary0, //context.colors.primary9
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'Card',
                    style: context.typography.bodyMedium.copyWith(
                      color: context.colors.primary0, //context.colors.primary9
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: context.colors.primary0, //context.colors.primary9
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: context.colors.primary1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 6,
                children: [
                  SvgPicture.asset(
                    Assets.projectIconCash,
                    width: Spacing.iconSizeS24,
                    height: Spacing.iconSizeS24,
                    clipBehavior: Clip.antiAlias,
                    colorFilter: ColorFilter.mode(
                      context.colors.primary9, // context.colors.primary0
                      BlendMode.srcIn,
                    ),
                  ),
                  Text(
                    'Cash',
                    style: context.typography.bodyMedium.copyWith(
                      color: context.colors.primary9, // context.colors.primary0
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: context.colors.primary0, // context.colors.primary9
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: context.colors.primary1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 6,
                children: [
                  SvgPicture.asset(
                    Assets.projectIconLogosApplePay,
                    width: Spacing.iconSizeS24,
                    height: Spacing.iconSizeS24,
                    clipBehavior: Clip.antiAlias,
                    colorFilter: ColorFilter.mode(
                      context.colors.primary9, //context.colors.primary0
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Spacing.spaceHS16,

        Center(
          child: Container(
            width: Spacing.buttonWidth,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: context.colors.primary1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 9,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      SvgPicture.asset(
                        Assets.projectIconBxlVisa,
                        width: 44,
                        height: 14,
                        clipBehavior: Clip.antiAlias,
                      ),
                      Flexible(
                        child: Text(
                          '**** **** **** 2512',
                          style: TextStyle(
                            color: const Color(0xFF191919),
                            fontSize: 16,
                            fontFamily: 'General Sans',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  Assets.projectIconEdit,
                  width: 24,
                  height: 24,
                  clipBehavior: Clip.antiAlias,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SubTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub-total',
              style: context.typography.titleMedium.copyWith(
                color: context.colors.primary5,
              ),
            ),
            Text(
              '\$ 5,870',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'VAT (%)',
              style: context.typography.titleMedium.copyWith(
                color: context.colors.primary5,
              ),
            ),
            Text(
              '\$ 0.00',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping fee',
              style: context.typography.titleMedium.copyWith(
                color: context.colors.primary5,
              ),
            ),
            Text(
              '\$ 80',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
        Divider(thickness: 1, color: context.colors.primary1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total', style: context.typography.titleMedium),
            Text(
              '\$ 5,950',
              textAlign: TextAlign.right,
              style: context.typography.titleLarge,
            ),
          ],
        ),
      ],
    );
  }
}

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TextField takes remaining width
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter promo code",
              prefixIcon: SvgPicture.asset(
                Assets.projectIconDiscount,
                height: Spacing.iconSizeS24,
                width: Spacing.iconSizeS24,
                colorFilter: ColorFilter.mode(
                  context.colors.primary3,
                  BlendMode.srcIn,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.colors.primary1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.colors.primary1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: context.colors.primary9),
              ),
            ),
          ),
        ),
        Spacing.spaceSW5,
        DefaultButtonWidget(label: 'Apply', onPressed: () {}),
      ],
    );
  }
}
