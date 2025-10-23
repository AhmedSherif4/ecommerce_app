part of '../../faqs.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderForMore(title: 'FAQs'),
              Spacing.spaceHS32,
              CustomSearchField(onSearchTap: (text) {}),
              Spacing.spaceHS32,
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CustomExpansionTile(),
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

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE6E6E6)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        title: Text(
          'How do I make a purchase?',
          style: context.typography.titleMedium,
        ),
        trailing: SvgPicture.asset(
          Assets.projectIconChevron,
          width: 24,
          height: 24,
        ),
        children: [
          const SizedBox(height: 8),
          Text(
            'When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the "Add to Cart" button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information.',
            style: context.typography.caption.copyWith(
              color: context.colors.primary5,
            ),
          ),
        ],
      ),
    );
  }
}
