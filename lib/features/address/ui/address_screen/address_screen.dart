part of '../../address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
                    const HeaderForMore(title: 'Address'),
                    Divider(thickness: 1, color: context.colors.primary1),
                    const AddressListScreen(),
                    DefaultButtonWidget(
                      label: 'Add New Address',
                      buttonColor: context.colors.primary0,
                      borderColor: context.colors.primary2,
                      textColor: context.colors.primary9,
                      icon: Assets.projectIconPlus,
                      iconSize: Spacing.iconSizeS24,
                      onPressed: () {
                        final newAddress = AddressModel(
                          title: "New Address",
                          details: "Street Example ${DateTime.now().second}",
                        );
                        context.read<AddressCubit>().addAddress(newAddress);
                      },
                    ),
                  ],
                ),
              ),
            ),
            DefaultButtonWidget(
              label: 'Apply',
              onPressed: () {
                final newAddress = AddressModel(
                  title: "New Address",
                  details: "Street Example ${DateTime.now().second}",
                );
                context.read<AddressCubit>().setDefaultAddress(
                  context.read<AddressCubit>().state.addresses.indexWhere(
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

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: state.addresses.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final address = state.addresses[index];
            return AddressCard(
              address: address,
              onTap: () => context.read<AddressCubit>().selectAddress(index),
            );
          },
        );
      },
    );
  }
}

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onTap;

  const AddressCard({super.key, required this.address, required this.onTap});

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
              Assets.projectIconLocation,
              height: Spacing.iconSizeS24,
              width: Spacing.iconSizeS24,
            ),
            Spacing.spaceSW5,

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Row(
                    children: [
                      Text(address.title, style: context.typography.bodyMedium),
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
                  Text(
                    address.details,
                    style: context.typography.bodyMedium.copyWith(
                      color: context.colors.primary5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
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
