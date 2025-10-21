import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../api/end_points.dart';
import '../base_widgets/loading_shimmer_widget.dart';
import '../responsive_manager/app_borders.dart';

class NullableNetworkImage extends StatelessWidget {
  final String? imagePath;
  final bool notHaveImage;
  final double? width;
  final double? height;
  final BoxFit fit;

  const NullableNetworkImage({
    super.key,
    required this.imagePath,
    required this.notHaveImage,
    this.width,
    this.height,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return notHaveImage
        ? SizedBox(
            width: width,
            height: height,
            child: const FittedBox(
              fit: BoxFit.contain,
              child: Icon(Icons.error_outline_outlined),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppBorders.appBorderWidthR7),
              topRight: Radius.circular(AppBorders.appBorderWidthR7),
            ),
            child: _BaseCachedNetworkImage(
              imgUrl: imagePath!.contains('http')
                  ? imagePath!
                  : EndPoints.imagePath(imagePath!),
              height: height,
              width: width,
              fit: fit,
            ),
          );
  }
}

class _BaseCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imgUrl;
  final BoxFit fit;

  const _BaseCachedNetworkImage({
    super.key,
    this.height,
    this.width,
    required this.imgUrl,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => const LoadingShimmerStructure(),
      errorWidget: (context, url, error) => SizedBox(
        width: width,
        height: height,
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Icon(Icons.error_outline_outlined),
        ),
      ),
    );
  }
}
