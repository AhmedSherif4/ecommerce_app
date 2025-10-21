import 'package:flutter/material.dart';



class LoadingShimmerStructure extends StatefulWidget {
  final double? height, width, marginStart, marginEnd, marginTop, marginBottom;

  const LoadingShimmerStructure({
    super.key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.marginStart = 16,
    this.marginBottom = 4,
    this.marginEnd = 16,
    this.marginTop = 4,
  });

  @override
  State<LoadingShimmerStructure> createState() =>
      _LoadingShimmerStructureState();
}

class _LoadingShimmerStructureState extends State<LoadingShimmerStructure>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animationOne;
  late Animation animationTwo;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animationOne = ColorTween(begin: Colors.white10, end: Colors.black12)
        .animate(animationController);
    animationTwo = ColorTween(begin: Colors.black12, end: Colors.white10)
        .animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      if (animationController.status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (animationController.status == AnimationStatus.dismissed) {
        animationController.forward();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsetsDirectional.only(
        bottom: widget.marginBottom!,
        end: widget.marginEnd!,
        start: widget.marginStart!,
        top: widget.marginTop!,
      ),
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [animationOne.value, animationTwo.value]),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}

class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingShimmerStructure(
      height: 150,
    );
  }
}

class TitleShimmer extends StatelessWidget {
  const TitleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      //  AppSize.s8,
        LoadingShimmerStructure(
          height: 10.0,
        ),
        LoadingShimmerStructure(
          height: 10.0,
        ),
        // AppSize.s8,
      ],
    );
  }
}

class ContentShimmer extends StatelessWidget {
  const ContentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoadingShimmerStructure(
          width: 70,
          height: 70,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingShimmerStructure(
                width: double.infinity,
                height: 10.0,
                marginStart: 0,
              ),
              LoadingShimmerStructure(
                width: double.infinity,
                height: 10.0,
                marginStart: 0,
              ),
              LoadingShimmerStructure(
                width: 100.0,
                height: 10.0,
                marginStart: 0,
              )
            ],
          ),
        )
      ],
    );
  }
}
