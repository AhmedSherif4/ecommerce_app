import 'package:flutter/material.dart';

import '../base_widgets/loading_shimmer_widget.dart';
import '../responsive_manager/spacing_facade.dart';

class LoadingShimmerList extends StatelessWidget {
  final int count;
  final double height;

  const LoadingShimmerList({
    super.key,
    this.count = 4,
    this.height = 45,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => LoadingShimmerStructure(
        width: double.infinity,
        height: height,
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: Spacing.s5,
      ),
      itemCount: count,
    );
  }
}

