import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/components/rounded_button.dart';
import 'package:sp_shop_app/components/rounded_input_field.dart';
import 'package:sp_shop_app/controllers/auth_controller.dart';
import 'package:sp_shop_app/screens/Profile/components.dart/profile_pic.dart';
import 'package:sp_shop_app/utils/constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final user = authController.user.value;
    Size size = MediaQuery.of(context).size;

    void updateInfo() {
      authController.updateInfo();
    }

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
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                ProfilePic(img: user.photo),
                SizedBox(
                  height: 20,
                ),
                RoundedInputField(
                  isReadOnly: true,
                  initialText: user.email,
                  // hintText: user['email'],
                  icon: Icon(Icons.mail),
                ),
                Obx(()=>RoundedInputField(
                  initialText: user.name ,
                  labelText: Constants.FULL_NAME,
                  hintText: Constants.FULL_NAME,
                  icon: Icon(Icons.people),
                  onChanged: (value) {
                    authController.newName.value = value;
                  },
                ),
                ),
                
                SizedBox(
                  height: 40,
                ),
                RoundedButton(
                    press: updateInfo,
                    text: Constants.SAVE)
              ]),
        ),
      ),
    );
  }
}
