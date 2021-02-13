import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/widgets.dart';
import 'package:version1/appConstants.dart';
import 'package:get/get.dart';
import 'package:version1/Controllers.dart';

class DetailScreen extends StatelessWidget {
  CartContentController cartController = Get.put(CartContentController());
  final pageController = PageController();
  AssetImage image;
  String name;
  String price;
  List list;

  DetailScreen({this.image, this.name, this.price, this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretchTriggerOffset: 10,
            expandedHeight: 400,
            stretch: true,
            elevation: 10,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              background: Hero(
                tag: "tshirtdetail$name",
                child: PageView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15))),
                        child: Image(
                          image: AssetImage(list[index]),
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(price,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Profile_pic(
                      color: Colors.white,
                      shadowColor: Colors.grey,
                      image: AssetImage("images/shatta.jpg"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text("Original Suite",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        //add to cart
                        CartObject newItem = CartObject(
                          image: list[0],
                          name: name,
                          size: "size",
                          price: price,
                        );
                        cartController.append(newItem);

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              content: Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Column(
                              children: [
                                Spacer(),
                                TickCircle(
                                  shade: true,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width:
                                      MediaQuery.of(context).size.height * 0.25,
                                  tickState: true,
                                  largeIcon: true,
                                  color: Colors.black,
                                  shadowColor: Colors.grey,
                                  edgeColor: Colors.white,
                                  icon: Icons.shopping_bag_sharp,
                                ),
                                Spacer(
                                  flex: 2,
                                ),
                                Text("Success",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                Text("1 product has been"),
                                Text("added to your cart"),
                                Spacer(),
                                LongButton(
                                  color: Colors.black,
                                  text: "Checkout",
                                  short: true,
                                )
                              ],
                            ),
                          )),
                        );
                      },
                      child: Text("ADD TO CART",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TickCircle(
                      color: Colors.blue,
                      tickState: false,
                      edgeColor: Colors.white,
                      shadowColor: Colors.grey,
                    ),
                    Spacer(),
                    TickCircle(
                      color: Colors.red,
                      tickState: false,
                      edgeColor: Colors.white,
                      shadowColor: Colors.grey,
                    ),
                    Spacer(),
                    TickCircle(
                      color: Colors.yellow,
                      tickState: false,
                      edgeColor: Colors.white,
                      shadowColor: Colors.grey,
                    ),
                    Spacer(),
                    TickCircle(
                        color: Colors.black,
                        tickState: true,
                        edgeColor: Colors.white,
                        shadowColor: Colors.grey,
                        icon: Icons.check),
                    Spacer(flex: 4),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  LongButton(
                    color: Colors.black,
                    text: "SMALL",
                    short: true,
                  ),
                  Spacer(),
                  LongButton(
                    color: Colors.black,
                    text: "LARGE",
                    short: true,
                    //transparent: true,
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    Text(
                        "asdf kjlj kalsj lkjce lakjsaldfkj lkasj lasdl lkajsl lakjsdlkj lwe flakdj lkasj lasdl lkajsl lakjsdlkj lwe flakdj"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "asdf kjlj kalsj lkjce lakjsaldfkj lkasj lasdl lkajsl lakjsdlkj lwe flakdj lkasj lasdl lkajsl lakjsdlkj lwe flakdj"),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "asdf kjlj kalsj lkjce lakjsaldfkj lkasj lasdl lkajsl lakjsdlkj lwe flakdj lkasj lasdl lkajsl lakjsdlkj lwe flakdj")
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
