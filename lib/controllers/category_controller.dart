import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/apis/category_api.dart';
import 'package:sp_shop_app/utils/constants.dart';

class CategoryController extends GetxController {
  var categories = [].obs;

  getCategories() async {
    try {
      EasyLoading.show(status: Constants.WAIT);
      categories.value = await CategoryApi.getCategories();
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
      Get.defaultDialog(
        title: Constants.WARNING_TITLE,
        titleStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        middleText: "Đã có lỗi xảy ra",
        textCancel: Constants.I_KNOW,
      );
    } finally {
      EasyLoading.dismiss();
    }
  }
}
