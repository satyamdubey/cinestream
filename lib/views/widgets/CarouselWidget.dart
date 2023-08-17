import 'package:carousel_slider/carousel_slider.dart';
import 'package:cine_stream/models/Card.dart';
import 'package:cine_stream/views/widgets/SkeletonWidget.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final double aspectRatio;
  final bool showIndicator;
  final List<Content>? carouselItems;

  const CarouselWidget({
    Key? key,
    required this.aspectRatio,
    this.showIndicator = true,
    this.carouselItems,
  }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    List<Content>? items = widget.carouselItems;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: (items != null && items.isNotEmpty)
              ? _carouselItems(items)
              : Skeleton(aspectRatio: widget.aspectRatio),
        ),
        Visibility(
          visible: widget.showIndicator,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _indicators(
              (items != null && items.isNotEmpty) ? items.length : 3,
              activePage,
            ),
          ),
        )
      ],
    );
  }

  Widget _carouselItems(List<Content> items) {
    return CarouselSlider(
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => {},
              child: Image.network(
                item.imageUrl,
                fit: BoxFit.cover,
                width: 1000,
                errorBuilder: (_, __, ___) {
                  return Skeleton(
                    aspectRatio: double.parse(item.aspectRatio),
                  );
                },
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: false,
        onPageChanged: (page, reason) {
          setState(() {
            activePage = page;
          });
        },
      ),
    );
  }

  List<Widget> _indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white30,
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }
}
