import 'package:flutter/material.dart';
import 'package:version1/Controllers.dart';
import 'package:get/get.dart';
import 'package:version1/widgets.dart';
import 'package:version1/appConstants.dart';
import 'ClothesMenu.dart';

class MenCategories extends StatelessWidget {
  List<String> men = [
    "images/men/newin.jpg",
    "images/men/accessories.jpg",
    "images/men/clothings.jpg",
    "images/men/shoes.jpg",
  ];
  TreeLevelController treeController = Get.put(TreeLevelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(120),
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //           child: CustomAppBar(
      //         treeController: treeController,
      //       )),
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: Hero(
                        tag: "xxx",
                        child: CustomAppBar(treeController: treeController))),
              ),
              Expanded(
                child: ListView.separated(
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
                            treeController.increment();
                            Get.to(Clothes(),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(men[index]))),
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
                    }),
              ),
            ],
          ),
        ),
      ),
    );

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
