import 'package:get/get.dart';
import 'package:sp_shop_app/utils/constants.dart';

class BottomNavController extends GetxController {
  var currentTab = Constants.HOME_SCREEN.obs;

  setTab(newTab) {
    currentTab.value = newTab;
  }
}
