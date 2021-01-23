import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:version1/Controllers.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/main.dart';
import 'package:version1/screens/CategoriesScreen.dart';
import 'package:version1/screens/UserHome.dart';
import 'package:version1/widgets.dart';
import 'package:get/get.dart';

class GenderChoicePage extends StatelessWidget {
  CategoriesScreenController controller = Get.put(CategoriesScreenController());

  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1604942926673-48ee8a893c34?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=443&q=80"))),
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
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.70,
            ),
            Text(
              "Make your",
              style: buildABeeZee(30),
            ),
            Text(
              "purchases as",
              style: buildABeeZee(30),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.change(0);
                    controller.changeLabel("WOMEN");
                    Get.to(
                        Obx(() => CategoriesScreen(
                            gender: screens[controller.screen.value])),
                        transition: Transition.rightToLeftWithFade);
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
                      Get.to(
                          Obx(() => CategoriesScreen(
                              gender: screens[controller.screen.value])),
                          transition: Transition.rightToLeftWithFade);
                    },
                    child: LongButton(
                      text: "MEN",
                      short: true,
                      transparent: true,
                    )),
              ],
            )
          ],
        ),
      ),
    ]));
  }
}
