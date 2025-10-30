part of '../../cart.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final Function(int quantity) onQuantityChanged;
  final int minQuantity;
  final int maxQuantity;
  final Color? activeColor;
  final Color? inactiveColor;

  const QuantitySelector({
    super.key,
    required this.onQuantityChanged,
    this.initialQuantity = 1,
    this.minQuantity = 1,
    this.maxQuantity = 99,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late ValueNotifier<int> _quantityNotifier;

  @override
  void initState() {
    super.initState();
    _quantityNotifier = ValueNotifier<int>(widget.initialQuantity);

    _quantityNotifier.addListener(() {
      widget.onQuantityChanged(_quantityNotifier.value);
    });
  }

  void _incrementQuantity() {
    if (_quantityNotifier.value < widget.maxQuantity) {
      _quantityNotifier.value++;
    }
  }

  void _decrementQuantity() {
    if (_quantityNotifier.value > widget.minQuantity) {
      _quantityNotifier.value--;
    }
  }

  @override
  void dispose() {
    _quantityNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _quantityNotifier,
      builder: (context, quantity, child) {
        final bool canDecrement = quantity > widget.minQuantity;
        final bool canIncrement = quantity < widget.maxQuantity;

        return Container(
          decoration: ShapeDecoration(
            color: context.colors.primary0,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: context.colors.primary1),
              borderRadius: BorderRadius.circular(
                AppConstants.appBorderRadiusR10,
              ),
            ),
            shadows: const [AppShadow.outerShadow],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildButton(
                icon: Icons.remove,
                onPressed: canDecrement ? _decrementQuantity : null,
                isActive: canDecrement,
              ),
              Text(quantity.toString(), style: context.typography.bodySmall),
              _buildButton(
                icon: Icons.add,
                onPressed: canIncrement ? _incrementQuantity : null,
                isActive: canIncrement,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton({
    required IconData icon,
    required dynamic Function()? onPressed,
    required bool isActive,
  }) {
    return CustomInkWell(
      onTap: onPressed ?? () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: Spacing.iconSizeS20,
          color: isActive
              ? (widget.activeColor ?? context.colors.primary9)
              : (widget.inactiveColor ?? context.colors.primary2),
        ),
      ),
    );
  }
}

class _DeliveryAddress extends StatelessWidget {
  const _DeliveryAddress();

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
