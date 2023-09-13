import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../infra.dart';

class CustomShimmer extends StatelessWidget {
  final double width;

  final double height;

  final EdgeInsets margin;

  final Widget? child;

  final BoxShape shape;

  final Color? baseColor;

  final Color? highlightColor;

  final double borderRadius;

  const CustomShimmer({
    Key? key,
    required this.width,
    required this.height,
    this.margin = const EdgeInsets.all(0),
    this.child,
    this.shape = BoxShape.rectangle,
    this.baseColor,
    this.highlightColor,
    this.borderRadius = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.silverMist,
      highlightColor:
          highlightColor ?? AppColors.textQuartiary.withOpacity(0.5),
      child: child == null
          ? Container(
              width: width,
              height: height,
              margin: margin,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: shape == BoxShape.rectangle
                    ? BorderRadius.circular(borderRadius)
                    : null,
                shape: shape,
              ),
            )
          : child!,
    );
  }
}
