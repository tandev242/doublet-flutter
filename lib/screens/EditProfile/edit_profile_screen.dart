import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/components/rounded_input_field.dart';
import 'package:sp_shop_app/controllers/auth_controller.dart';
import 'package:sp_shop_app/screens/Profile/components.dart/profile_pic.dart';
import 'package:sp_shop_app/utils/constants.dart';

class EditProfileScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String newName = authController.user.value.name;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          Constants.PROFILE,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: GetX<AuthController>(
        builder: (_) {
          print(authController.name.value);
          return Container(
            width: double.infinity,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    ProfilePic(img: authController.user.value.photo),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedInputField(
                      isReadOnly: true,
                      initialText: authController.user.value.email,
                      // hintText: user['email'],
                      icon: Icon(Icons.mail),
                    ),
                    RoundedInputField(
                      initialText: authController.user.value.name,
                      labelText: Constants.FULL_NAME,
                      hintText: Constants.FULL_NAME,
                      icon: Icon(Icons.people),
                      onChanged: (value) {
                        newName = value;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RoundedButton(
                        press: () {
                          authController.updateInfo(newName);
                        },
                        text: Constants.SAVE)
                  ]),
            ),
          );
        },
      ),
    );
  }
}
