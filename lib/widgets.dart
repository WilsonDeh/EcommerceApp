import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:version1/Controllers.dart';
import 'package:version1/screens/cartScreen.dart';

class NewsWidget extends StatelessWidget {
  AssetImage pic;
  String headline;
  String summary;

  NewsWidget({Key key, this.pic, this.headline, this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            height: 200,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: pic, fit: BoxFit.cover))),
        Text(
          headline,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        Text(summary,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black))
      ],
    ));
  }
}

class Profile_pic extends StatelessWidget {
  AssetImage image;
  Color color;
  Color shadowColor;
  Profile_pic({this.image, this.color, this.shadowColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: shadowColor, offset: Offset(2.0, 2.0), blurRadius: 5.0),
        ],
        border: Border.all(color: color),
        image: DecorationImage(image: image, fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );
  }
}

class TickCircle extends StatelessWidget {
  double height;
  double width;
  Color color;
  Color edgeColor;
  Color shadowColor;
  bool tickState;
  bool largeIcon;
  IconData icon;
  bool shade;
  Color iconColor;
  TickCircle(
      {this.icon,
      this.height = 40,
      this.width = 40,
      this.largeIcon = false,
      this.shade = false,
      this.color,
      this.edgeColor,
      this.shadowColor,
      this.iconColor = Colors.white,
      this.tickState});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: tickState == true
          ? Icon(
              icon,
              color: iconColor,
              size: largeIcon == true ? 70 : 20,
            )
          : null,
      decoration: BoxDecoration(
        gradient: shade == true
            ? LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black54, Colors.black87])
            : null,
        boxShadow: [
          BoxShadow(
              color: shadowColor, offset: Offset(2.0, 2.0), blurRadius: 5.0),
        ],
        border: Border.all(color: edgeColor, width: height * 0.05),
        color: color,
        //image: DecorationImage(image: image, fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );
  }
}

class PopCircle extends StatelessWidget {
  AnimationController controller;

  PopCircle({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow,
          image: DecorationImage(image: AssetImage("images/oracle.jpg")),
        ));
  }
}

class DS_Sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.1,
        maxChildSize: 1.0,
        builder: (context, scrollcontroller) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    controller: scrollcontroller,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Text("b");
                    },
                  ),
                ),
              ));
        });
  }
}

class LongButton extends StatelessWidget {
  Color color;
  String text;
  bool short;
  bool transparent;
  Color borderColor;

  LongButton(
      {this.color,
      this.text,
      this.short = false,
      this.transparent = false,
      this.borderColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height) * 0.07,
      width: short == true
          ? (MediaQuery.of(context).size.width) * 0.375
          : (MediaQuery.of(context).size.width) * 0.75,
      decoration: BoxDecoration(
        color: transparent == true ? null : color,
        borderRadius: BorderRadius.circular(30),
        border: transparent == true
            ? Border.all(color: borderColor, width: 2)
            : null,
      ),
      child: Center(
          child: Text(text,
              style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                      color:
                          color == Colors.white ? Colors.black : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900)))),
    );
  }
}

//animated categoryNameBox

class categoryNameBox extends StatelessWidget {
  //String label;

  TreeLevelController treeController = Get.put(TreeLevelController());
  CategoriesScreenController controller = Get.put(CategoriesScreenController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: [
          Obx(() => Text(
                controller.label.value,
                //label,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: treeController.level.value == 1
                        ? Colors.black
                        : Colors.grey),
              )),
          SizedBox(
            width: 20,
            // child: AnimatedOpacity(
            //   duration: Duration(milliseconds: 700),
            //   opacity: treeController.level.value == 1 ? 0 : 1,
            //   child: Icon(
            //     Icons.circle,
            //     size: 5,
            //     color: Colors.black,
            //   ),
            // ),
          ),
          Obx(
            () => AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: treeController.level.value == 1 ? 0 : 1,
                child: Row(
                  children: [
                    Text(
                      "CLOTHES",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: treeController.level.value == 2
                              ? Colors.black
                              : Colors.grey),
                    ),
                  ],
                )),
          ),
          SizedBox(
            width: 20,
            // child: AnimatedOpacity(
            //   duration: Duration(milliseconds: 700),
            //   opacity: treeController.level.value > 2 ? 1 : 0,
            //   child: Icon(
            //     Icons.circle,
            //     size: 5,
            //     color: Colors.black,
            //   ),
            // ),
          ),
          Obx(
            () => AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: treeController.level.value > 2 ? 1 : 0,
                child: Row(
                  children: [
                    Text(
                      "DRESSES",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  bool isCartScreen;

  CustomAppBar({
    @required this.treeController,
    this.isCartScreen = false,
  });

  final TreeLevelController treeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  treeController.reset();
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.to(CartScreen());
              },
              child: TickCircle(
                tickState: true,
                icon: Icons.shopping_cart,
                edgeColor: Colors.black,
                shadowColor: Colors.white,
                color: Colors.white,
                iconColor: Colors.black,
              ),
            ),
            // Profile_pic(
            //     color: Colors.white,
            //     shadowColor: Colors.grey,
            //     image: AssetImage(
            //       "images/oracle.jpg",
            //     )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
              child: isCartScreen == true
                  ? Text(
                      "SHOPPING CART",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: treeController.level.value == 1
                              ? Colors.black
                              : Colors.grey),
                    )
                  : categoryNameBox(),
            ),
            SizedBox(),
          ],
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 2,
          decoration: BoxDecoration(color: Colors.grey),
        )
      ],
    );
  }
}

class CartObject extends StatelessWidget {
  String image;
  String name;
  String size;
  String price;
  CartObject({this.image, this.name, this.size, this.price});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Container(
            height: 170,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          Spacer(flex: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("MEDIUM",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
              Text(price, style: TextStyle(fontSize: 15)),
            ],
          ),
          Spacer(flex: 5),
          GestureDetector(onTap: () {}, child: Icon(Icons.delete))
        ],
      ),
    );
    ;
  }
}
