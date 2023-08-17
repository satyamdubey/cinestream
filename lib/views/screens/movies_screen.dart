import 'package:cine_stream/controllers/BannerController.dart';
import 'package:cine_stream/controllers/CardController.dart';
import 'package:cine_stream/views/widgets/CarouselWidget.dart';
import 'package:cine_stream/views/widgets/HorizontalCardsWidget.dart';
import 'package:cine_stream/views/widgets/SkeletonWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final _bannerController = Get.find<BannerController>();
  final _cardController = Get.find<CardController>();

  @override
  void initState() {
    super.initState();
    _bannerController.getBanners();
    _cardController.getCards();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GetBuilder<BannerController>(
            builder: (_) {
              return CarouselWidget(
                aspectRatio: 16 / 9,
                carouselItems: !_bannerController.isBannerListAvailable
                    ? []
                    : _bannerController.bannerList[0].contentList,
              );
            },
          ),
          GetBuilder<CardController>(
            builder: (_) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 12, top: 12),
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemCount: _cardController.isCardDetailListAvailable
                    ? _cardController.cardDetailList.length
                    : _cardController.cardDetailList.length + 3,
                itemBuilder: (BuildContext context, int index) {
                  if (index >= _cardController.cardDetailList.length) {
                    return const Skeleton(aspectRatio: 16 / 9);
                  }
                  return HorizontalCardsWidget(
                    cardDetail: _cardController.cardDetailList[index],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
