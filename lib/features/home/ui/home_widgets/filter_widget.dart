import 'package:ecommerce_app/config/routes/route_manager.dart';
import 'package:ecommerce_app/core/enum/enum_generation.dart';
import 'package:ecommerce_app/core/responsive_manager/spacing_facade.dart';
import 'package:ecommerce_app/core/shared_widget/buttons/button_widget.dart';
import 'package:ecommerce_app/core/shared_widget/custom_inkwell.dart';
import 'package:ecommerce_app/core/text_styling/extensions/app_text_theme.dart';
import 'package:ecommerce_app/core/theme_manager/service/app_colors.dart';
import 'package:ecommerce_app/my_app/app_reference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/home_bloc.dart';

class FilterBottomSheet {
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: Navigator.of(context),
      ),
      builder: (ctx) {
        // استخدم BlocProvider.of(context) بدل inject جديد
        final homeBloc = context.read<HomeBloc>();

        return BlocProvider.value(
          value: homeBloc,
          child: _FilterSheetContent(context),
        );
      },
    );
  }
}

class _FilterSheetContent extends StatefulWidget {
  final BuildContext contextGlob;
  const _FilterSheetContent(this.contextGlob);

  @override
  State<_FilterSheetContent> createState() => _FilterSheetContentState();
}

class _FilterSheetContentState extends State<_FilterSheetContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  final List<FilterSortTypes> sortOptions = [
    FilterSortTypes.relevance,
    FilterSortTypes.price_low_high,
    FilterSortTypes.price_high_low,
  ];

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // close with reverse animation
  Future<void> _closeSheet() async {
    await _controller.reverse();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // responsive constraints
    final maxHeight =
        (AppReference.isPortrait(context)
            ? AppReference.deviceHeight(context)
            : AppReference.deviceWidth(context)) *
        0.6; // bottom sheet max height
    final horizontalPadding = AppReference.deviceWidth(context) * 0.045;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          constraints: BoxConstraints(maxHeight: maxHeight),
          decoration: BoxDecoration(
            color: context.colors.primary0,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: horizontalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filter',
                            style: context.typography.headlineMedium,
                          ),
                          IconButton(
                            icon: Icon(Icons.close, size: Spacing.iconSizeS24),
                            onPressed: () {
                              _closeSheet();
                            },
                          ),
                        ],
                      ),
                    ),
                    Spacing.spaceHS5,
                    Divider(height: 1, color: context.colors.primary1),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,

                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sort by',
                          style: context.typography.titleMedium,
                        ),
                      ),
                    ),
                    Spacing.spaceHS5,
                    SizedBox(
                      height: constraints.maxHeight * 0.09,

                      child: _buildSortOptions(context),
                    ),
                    Spacing.spaceHS5,
                    Divider(height: 1, color: context.colors.primary1),
                    SizedBox(
                      height: constraints.maxHeight * 0.16,
                      child: _buildPriceSection(context),
                    ),
                    // Divider(height: 1, color: context.colors.primary1),
                    // SizedBox(
                    //   height: constraints.maxHeight * 0.1,
                    //   child: _buildSizeSection(context, constraints),
                    // ),
                    SizedBox(
                      height: constraints.maxHeight * 0.12,
                      child: _buildApplyButton(context),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.005),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSortOptions(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: sortOptions.length,
          itemBuilder: (context, index) {
            final isSelected = state.selectedSortType.index == index;
            return CustomInkWell(
              onTap: () =>
                  context.read<HomeBloc>()
                    ..add(SelectSortEvent(sortOptions[index])),
              child: AnimatedContainer(
                alignment: AlignmentGeometry.center,
                duration: const Duration(milliseconds: 220),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.colors.primary9
                      : context.colors.primary0,
                  borderRadius: BorderRadius.circular(10),
                  border: isSelected
                      ? Border.all(color: context.colors.primary9)
                      : Border.all(color: context.colors.primary1),
                ),
                child: Text(
                  sortOptions[index].name.replaceAll('_', ' '),
                  style: context.typography.bodyMedium.copyWith(
                    color: isSelected
                        ? context.colors.primary0
                        : context.colors.primary9,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPriceSection(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final min = state.rangeValues.start.round();
        final max = state.rangeValues.end.round();

        return Column(
          children: [
            Row(
              children: [
                Text('Price', style: context.typography.titleMedium),
                const Spacer(),
                Text(
                  '\$${min.toString()} - \$${max.toString()}',
                  style: context.typography.bodyMedium,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                // لون الدوائر (الـ thumbs)
                thumbColor: context.colors.primary0,

                // لون التراك المفعل (الجزء بين القيمتين)
                activeTrackColor: context.colors.primary9,

                // لون الجزء الغير مفعل من التراك
                inactiveTrackColor: context.colors.primary0,

                // لون حدود الدائرة (stroke)
                overlayColor: context.colors.primary9,

                // شكل الدوائر (الـ thumbs)
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 10, // حجم الدائرة
                  pressedElevation: 4, // تأثير الضغط
                ),

                // شكل القيم اللي بتظهر فوق الدوائر
                valueIndicatorShape: const PaddleSliderValueIndicatorShape(),

                // لون خلفية صندوق القيمة اللي فوق الدوائر
                valueIndicatorColor: context.colors.primary0,

                // لون النص اللي جواه
                valueIndicatorTextStyle: context.typography.bodySmall,
              ),
              child: RangeSlider(
                values: state.rangeValues,
                min: 10,
                max: 10000,
                divisions: 100,
                labels: RangeLabels('\$$min', '\$$max'),
                onChanged: (values) {
                  context.read<HomeBloc>().add(UpdateRangeEvent(values));
                },
              ),
            ),
            // small hint dots at ends (visual)
          ],
        );
      },
    );
  }

  Widget _buildApplyButton(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.filterProductsState) {
          case RequestStates.loading:
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: context.colors.primary5,
              ),
            );
          case RequestStates.error:
            return Center(
              child: Text(
                state.filterProductsMessage,
                style: context.typography.bodyMedium,
              ),
            );
          case RequestStates.initial || RequestStates.loaded:
            return DefaultButtonWidget(
              label: 'Apply filters',
              onPressed: () {
                widget.contextGlob.read<HomeBloc>().add(
                  const FilterProductsEvent(),
                );
                RouteManager.rPopRoute(context);
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  /* Widget _buildSizeSection(BuildContext context, BoxConstraints constraints) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Size', style: context.typography.titleMedium),
            SizedBox(
              height: constraints.maxHeight * 0.1,
              width: constraints.maxWidth * 0.2,
              child: Center(
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: state.selectedSize,
                  items: sizes
                      .map(
                        (s) => DropdownMenuItem(
                          value: s,
                          child: Text(
                            s,
                            style: context.typography.bodyMedium.copyWith(
                              color: context.colors.primary5,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    context.read<HomeBloc>().add(SelectSizeEvent(val));
                  },

                  // شكل النص الظاهر (القيمة المختارة)
                  style: context.typography.bodyMedium.copyWith(
                    color: context.colors.primary5,
                  ),

                  icon: Icon(
                    Icons.expand_more_rounded,
                    color: context.colors.primary5,
                    size: Spacing.s24.r,
                  ),

                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }*/
}
