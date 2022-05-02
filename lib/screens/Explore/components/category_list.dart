import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_shop_app/utils/constants.dart';
import 'package:sp_shop_app/screens/Collection/collection_screen.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key, required this.categories}) : super(key: key);
  List categories;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350,
            mainAxisExtent: 240,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: categories.length > 8 ? 8 : categories.length,
        itemBuilder: (BuildContext ctx, index) {
          return InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CollectionScreen(
                        slug: categories[index].slug,
                        name: categories[index].name);
                  },
                ),
              );
            },
            child: Container(
              height: 189,
              width: 175,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    cExploreBackgroundColorLists[index][0],
                    cExploreBackgroundColorLists[index][1],
                    cExploreBackgroundColorLists[index][2],
                  ],
                ),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: cExploreBackgroundColorLists[index][3],
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(categories[index].img,
                          height: 200, fit: BoxFit.cover),
                    ),
                    Text(
                      categories[index].name,
                      style: cExploreListHeadStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
