import 'package:flutter/material.dart';
import 'package:sp_shop_app/components/bottom_navigation.dart';
import 'package:sp_shop_app/screens/Profile/components.dart/body.dart';
import 'package:sp_shop_app/utils/constants.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.PROFILE),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
      bottomNavigationBar: BottomNavigation()
    );
  }
}

