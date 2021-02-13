import 'package:flutter/material.dart';
import 'package:version1/screens/OrderResultScreen.dart';
import 'package:version1/widgets.dart';
import 'package:version1/Controllers.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  TreeLevelController treeController = Get.put(TreeLevelController());
  CartContentController cartController = Get.put(CartContentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            isCartScreen: true,
                            treeController: treeController))),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.white,
                        thickness: 10,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    itemCount: cartController.list.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => CartObject(
                          image: cartController.list[index].image,
                          name: cartController.list[index].name,
                          size: cartController.list[index].size,
                          price: cartController.list[index].price,
                        ),
                      );

                      //cartController.list[index];
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text("Delivery",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("Standard Price",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(OrderResult());
                },
                child: LongButton(
                  color: Colors.black,
                  text: cartController.list.isEmpty
                      ? "ADD ITEMS"
                      : "BUY FOR GHC 105",
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
