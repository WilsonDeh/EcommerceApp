import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/Controllers.dart';
import 'package:version1/screens/UserHome.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreenController controller = Get.put(CategoriesScreenController());
  FirebaseFirestore db = FirebaseFirestore.instance;
  Widget gender;
  CategoriesScreen({this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 20.0, right: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
              Obx(() => Text(controller.label.value)),
              SizedBox(
                width: 230,
              ),
              Icon(Icons.search)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            // height: MediaQuery.of(context).size.height,
            child: gender,
          )
        ],
      ),
    ));
  }
}

class WomenCategories extends StatelessWidget {
  List<String> women = [
    "images/women/newin.jpg",
    "images/women/accessories.jpg",
    "images/women/clothings.jpg",
    "images/women/shoes.jpg"
  ];
  CategoriesScreenController controller = Get.put(CategoriesScreenController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.white,
            thickness: 20,
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Stack(children: [
            GestureDetector(
              onTap: () {
                controller.change(1);
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(women[index]))),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Text(
                categoryNames[index],
                style: buildABeeZee(20),
              ),
            )
          ]);
        });
  }
}

class MenCategories extends StatelessWidget {
  List<String> men = [
    "images/men/newin.jpg",
    "images/men/accessories.jpg",
    "images/men/clothings.jpg",
    "images/men/shoes.jpg",
  ];
  CategoriesScreenController controller = Get.put(CategoriesScreenController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.white,
            thickness: 20,
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Stack(children: [
            GestureDetector(
              onTap: () {
                controller.change(1);
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(men[index]))),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Text(
                categoryNames[index],
                style: buildABeeZee(20),
              ),
            )
          ]);
        });

    // StreamBuilder<QuerySnapshot>(
    //     stream: FirebaseFirestore.instance
    //         .collection("store")
    //         .doc("categoriesImages")
    //         .collection("menImages")
    //         .snapshots(),
    //     builder: (context, snapshot) {
    //       if (!snapshot.hasData) return CircularProgressIndicator();
    //       return ListView.separated(
    //           separatorBuilder: (context, index) {
    //             return Divider(
    //               color: Colors.white,
    //               thickness: 20,
    //             );
    //           },
    //           scrollDirection: Axis.vertical,
    //           itemCount: 4,
    //           itemBuilder: (context, index) {
    //             return Stack(children: [
    //               GestureDetector(
    //                 onTap: () {
    //                   controller.change(1);
    //                 },
    //                 child: Container(
    //                   height: 150,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(15),
    //                       image: DecorationImage(
    //                           fit: BoxFit.cover,
    //                           image: NetworkImage(
    //                               snapshot.data.docs[index]["ImageUrl"]))),
    //                 ),
    //               ),
    //               Positioned(
    //                 left: 20,
    //                 bottom: 20,
    //                 child: Text(
    //                   snapshot.data.docs[index]["name"],
    //                   style: buildABeeZee(20),
    //                 ),
    //               )
    //             ]);
    //           });
    //     });
  }
}
