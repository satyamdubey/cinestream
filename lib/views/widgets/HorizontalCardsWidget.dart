import 'package:cine_stream/constants/image_constant.dart';
import 'package:cine_stream/models/Card.dart';
import 'package:cine_stream/views/screens/video_play_screen.dart';
import 'package:cine_stream/views/widgets/ImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HorizontalCardsWidget extends StatelessWidget {
  final CardDetail cardDetail;

  const HorizontalCardsWidget({Key? key, required this.cardDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> aspectRatios = cardDetail.aspectRatio.split("/");
    Size size = MediaQuery.of(context).size;

    return AspectRatio(
      aspectRatio: int.parse(aspectRatios[0]) / int.parse(aspectRatios[1]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardDetail.cardName,
                  style: const TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                const Text(
                  "See more",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => const SizedBox(width: 15),
              padding: const EdgeInsets.only(right: 12, bottom: 12),
              itemCount: cardDetail.contentList.length,
              itemBuilder: (BuildContext context, int index) {
                return AspectRatio(
                  aspectRatio:
                      int.parse(aspectRatios[0]) / int.parse(aspectRatios[1]),
                  child: Column(
                    crossAxisAlignment: cardDetail.cardName != "Circle Content"
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap:()=>Get.to(()=>VideoPlayScreen()),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    cardDetail.cardName == "Circle Content"
                                        ? BorderRadius.circular(300)
                                        : BorderRadius.circular(0),
                                child: GestureDetector(
                                  onTap:(){},
                                  child: ImageWidget(
                                    imageUrl: cardDetail.contentList[index].imageUrl,
                                    assetImage: ImageConstant.noImage,
                                  ),
                                ),
                              ),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        cardDetail.contentList[index].name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
