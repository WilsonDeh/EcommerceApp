import 'package:flutter/material.dart';
import 'package:version1/Controllers.dart';
import 'package:get/get.dart';
import 'package:version1/widgets.dart';
import 'package:version1/appConstants.dart';
import 'tshirtsScreen.dart';

class Clothes extends StatelessWidget {
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
                        color: Colors.grey[200],
                        thickness: 3,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: clothings.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.00),
                        child: GestureDetector(
                          onTap: () {
                            treeController.increment();
                            Get.to(Tshirts(),
                                transition: Transition.rightToLeftWithFade);
                          },
                          child: Row(
                            children: [
                              Profile_pic(
                                image: AssetImage(
                                  clothingImages[index],
                                ),
                                color: Colors.white,
                                shadowColor: Colors.grey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(clothings[index],
                                  style:
                                      TextStyle(fontWeight: FontWeight.w800)),
                              Spacer(
                                flex: 1,
                              ),
                              IconButton(
                                  icon: Icon(Icons.arrow_forward_ios),
                                  onPressed: null)
                            ],
                          ),
                        ),
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
