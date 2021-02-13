import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:version1/Controllers.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/main.dart';
import 'package:version1/screens/CategoriesScreen.dart';
import 'package:version1/screens/UserHome.dart';
import 'package:version1/widgets.dart';
import 'package:get/get.dart';
import 'MenCategoryScreen.dart';
import 'WomenCategoryScreen.dart';

class GenderChoicePage extends StatelessWidget {
  TreeLevelController treeController = Get.put(TreeLevelController());
  CategoriesScreenController controller = Get.put(CategoriesScreenController());

  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("images/oip/pic2.jpg"))),
      ),

      // StreamBuilder<QuerySnapshot>(
      //     stream: db
      //         .collection("store")
      //         .doc("unspecified")
      //         .collection("images")
      //         .snapshots(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData) return CircularProgressIndicator();
      //       return Container(
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //                 fit: BoxFit.cover,
      //                 image: NetworkImage(snapshot.data.docs[0]["imageUrl"]))),
      //       );
      //     }),

      Center(
        child: Column(
          children: [
            Spacer(flex: 3),
            // SizedBox(
            //   height: (MediaQuery.of(context).size.height) * 0.50,
            // ),
            Text(
              "Make your",
              style: buildABeeZee(30),
            ),
            Text(
              "purchases as",
              style: buildABeeZee(30),
            ),
            Spacer(
              flex: 2,
            ),
            // SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.change(0);
                    controller.changeLabel("WOMEN");
                    treeController.reset();
                    Get.to(WomenCategories(),
                        transition: Transition.rightToLeftWithFade);
                    // Get.to(
                    //     Obx(() => CategoriesScreen(
                    //         gender: screens[controller.screen.value])),
                    //     transition: Transition.rightToLeftWithFade);
                  },
                  child: LongButton(
                      text: "WOMEN", color: Colors.white, short: true),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                    onTap: () {
                      controller.change(1);
                      controller.changeLabel("MEN");
                      Get.to(MenCategories(),
                          transition: Transition.rightToLeftWithFade);
                      // Get.to(
                      //     Obx(() => CategoriesScreen(
                      //         gender: screens[controller.screen.value])),
                      //     transition: Transition.rightToLeftWithFade);
                    },
                    child: LongButton(
                      text: "MEN",
                      short: true,
                      transparent: true,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    ]));
  }
}
