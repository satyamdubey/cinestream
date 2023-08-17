import 'package:cine_stream/controllers/BannerController.dart';
import 'package:get/get.dart';
import 'package:cine_stream/controllers/CardController.dart';


class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => BannerController());
    Get.lazyPut(fenix: true, () => CardController());
  }

}