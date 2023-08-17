import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cine_stream/models/Card.dart';
import 'package:cine_stream/models/ErrorMessage.dart';
import 'package:cine_stream/models/JsonResponse.dart';
import 'package:cine_stream/constants/api_constant.dart';
import 'package:cine_stream/services/server_request_service.dart';


class CardController extends GetxController {
  final List<CardDetail> _cardDetailList = [];

  List<CardDetail> get cardDetailList => _cardDetailList;

  bool _isCardDetailListAvailable = false;

  bool get isCardDetailListAvailable => _isCardDetailListAvailable;

  Future<dynamic> getCards({int page = 1, int limit = 10}) async {
    _isCardDetailListAvailable = false;
    var result = await ServerRequest.getData(ApiConstant.cardsUrl);
    if (result is http.Response && result.statusCode == 200) {
      JsonResponse jsonResponse = jsonResponseFromJson(result.body);
      if (jsonResponse.statusCode == 200 && jsonResponse.data != null) {
        _cardDetailList.assignAll(cardDetailListFromJson(jsonResponse.data));
        _isCardDetailListAvailable = true;
        update();
        return jsonResponse;
      } else {
        return ErrorResponse(
          statusCode: jsonResponse.statusCode,
          message: jsonResponse.message,
        );
      }
    } else if (result is http.Response && result.statusCode != 200) {
      return ErrorResponse(
        statusCode: result.statusCode,
        message: "API Error",
      );
    } else {
      return ErrorResponse(
        statusCode: 500,
        message: "Server Error",
      );
    }
  }
}
