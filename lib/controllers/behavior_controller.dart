import 'package:get/get.dart';
import 'package:sp_shop_app/apis/recommend_api.dart';

class BehaviorController extends GetxController {
  Future<void> addBehavior(product, type) async {
    try {
      var payload = {"product": product, "type": type};
      await RecommendApi.addBehavior(payload);
    } catch (error) {
      print(error);
    }
  }
}
