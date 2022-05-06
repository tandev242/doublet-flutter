import 'package:get/get.dart';
import 'package:sp_shop_app/screens/DeliveryInfo/delivery_info_screen.dart';
import 'package:sp_shop_app/screens/EditProfile/edit_profile_screen.dart';
import 'package:sp_shop_app/screens/MyOrders/my_orders_screen.dart';
import 'package:sp_shop_app/screens/Profile/components.dart/profile_menu.dart';
import 'package:sp_shop_app/screens/Profile/components.dart/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:sp_shop_app/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: Constants.INFO,
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Get.to(EditProfileScreen())
            },
          ),
          ProfileMenu(
            text: "Địa chỉ nhận hàng",
            icon: "assets/icons/User Icon.svg",
            press: () => {
             Get.to(DeliveryInfoScreen())
            },
          ),
          ProfileMenu(
            text: "Thay đổi mật khẩu",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditProfileScreen();
                        }))
            },
          ),
          ProfileMenu(
            text: "Đơn hàng đã mua",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyOrdersScreen();
                        }));
            },
          ), 
          ProfileMenu(
            text: "Đăng xuất",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ])
        );
  }
}
