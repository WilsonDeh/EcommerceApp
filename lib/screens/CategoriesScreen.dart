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
    "https://images.unsplash.com/photo-1532179867542-0818a841bd1c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
    "https://img.freepik.com/free-photo/hand-holding-shopping-bags-plain-background_23-2148286215.jpg?size=626&ext=jpg&ga=GA1.2.746320220.1599350400",
    "https://images.unsplash.com/photo-1604947051230-fc2bc6f6c5c9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8d29tZW4lMjBmYXNoaW9ufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-fresh-and-simple-women-s-shoes-promotion-banner-image_145853.jpg"
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
                        fit: BoxFit.cover, image: NetworkImage(women[index]))),
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
    "https://wallpaperaccess.com/full/2489626.jpg",
    "https://images.unsplash.com/photo-1590526599411-42bcd63d50fe?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGFjY2Vzc29yaWVzJTIwZm9yJTIwbWVufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://www.teahub.io/photos/full/88-885573_polo-shirt.jpg",
    "https://images.unsplash.com/photo-1523212465813-857a9d1a19f4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1189&q=80",
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
                        fit: BoxFit.cover, image: NetworkImage(men[index]))),
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
