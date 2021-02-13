import 'package:flutter/material.dart';
import 'package:version1/Controllers.dart';
import 'package:get/get.dart';
import 'package:version1/widgets.dart';
import 'package:version1/appConstants.dart';
import 'DetailScreen.dart';

class Tshirts extends StatelessWidget {
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
                  child: CustomAppBar(
                    treeController: treeController,
                  ),
                )),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 5.0),
                    itemCount: tshirtImages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                    DetailScreen(
                                      price: tshirtPrices[index],
                                      name: tshirtNames[index],
                                      image: AssetImage(tshirtImages[index][0]),
                                      list: tshirtImages[index],
                                    ),
                                    transition: Transition.rightToLeftWithFade);
                              },
                              child: Hero(
                                tag: "tshirtdetail${tshirtNames[index]}",
                                child: Container(
                                  height: 400,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              tshirtImages[index][0]))),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            tshirtNames[index],
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            tshirtPrices[index],
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
