import 'package:flutter/material.dart';
import 'package:sp_shop_app/utils/constants.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> list= [1,2,3,4,5,6,7,8];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            Constants.RECEIVE_ADDRESS,
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
            // child: AnimatedList(
            //   itemBuilder: (context, index, animation){
                

            //   },
            //   initialItemCount: ,
            // )
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){

        }) ,
        );
  }
}
