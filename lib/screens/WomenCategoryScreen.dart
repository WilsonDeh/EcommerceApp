import 'package:flutter/material.dart';
import 'package:version1/Controllers.dart';
import 'package:get/get.dart';
import 'package:version1/widgets.dart';
import 'package:version1/appConstants.dart';
import 'ClothesMenu.dart';

class WomenCategories extends StatelessWidget {
  List<String> women = [
    "images/women/newin.jpg",
    "images/women/accessories.jpg",
    "images/women/clothings.jpg",
    "images/women/shoes.jpg"
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
                child: Hero(
                  tag: "xxx",
                  child: CustomAppBar(
                    treeController: treeController,
                  ),
                ),
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
                                    image: AssetImage(women[index]))),
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
  }
}
