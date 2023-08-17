
List<CardDetail> cardDetailListFromJson(dynamic data) => List<CardDetail>.from(data.map((x) => CardDetail.fromJson(x)));


class CardDetail {
  String cardName;
  int cardType;
  String aspectRatio;
  List<Content> contentList;

  CardDetail({
    required this.cardName,
    required this.cardType,
    required this.aspectRatio,
    required this.contentList,
  });

  factory CardDetail.fromJson(Map<String, dynamic> json) => CardDetail(
    cardName: json["card_name"],
    cardType: json["card_type"],
    aspectRatio: json["aspect_ratio"],
    contentList: List<Content>.from(json["content_list"].map((x) => Content.fromJson(x))),
  );
}

class Content {
  String id;
  String name;
  String imageUrl;
  String aspectRatio;
  bool isAvod;
  bool isTvod;
  bool isSvod;
  bool? isResume;
  String? duration;
  String? watchedDuration;

  Content({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.aspectRatio,
    required this.isAvod,
    required this.isTvod,
    required this.isSvod,
    this.isResume,
    this.duration,
    this.watchedDuration,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["content_id"],
    name: json["name"],
    imageUrl: json["image_url"],
    aspectRatio: json["aspect_ratio"],
    isAvod: json["is_avod"],
    isTvod: json["is_tvod"],
    isSvod: json["is_svod"],
    isResume: json["is_resume"],
    duration: json["duration"],
    watchedDuration: json["watched_duration"],
  );
}
