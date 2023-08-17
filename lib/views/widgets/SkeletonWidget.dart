import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final double aspectRatio;
  final BoxShape shape;

  const Skeleton({
    Key? key,
    required this.aspectRatio,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey.withOpacity(0.2),
      highlightColor: Colors.grey.shade100,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: shape,
          ),
        ),
      ),
    );
  }
}
