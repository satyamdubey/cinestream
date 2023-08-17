import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final String assetImage;
  final double height;
  final double width;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
    required this.assetImage,
    this.height = 1000,
    this.width = 1000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              height: height,
              width: width,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Image.asset(
                  assetImage,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                );
              },
            )
          : Image.asset(
              assetImage,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
    );
  }
}
