import 'package:flutter/material.dart';
import 'package:version1/widgets.dart';

class OrderResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Spacer(flex: 3),
          TickCircle(
            shade: true,
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.height * 0.25,
            tickState: true,
            largeIcon: true,
            color: Colors.black,
            shadowColor: Colors.grey,
            edgeColor: Colors.white,
            icon: Icons.shopping_bag_sharp,
          ),
          Spacer(
            flex: 1,
          ),
          Text("Order Success",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text("Your order has been placed successfully."),
                Text("For more details go to My Orders")
              ],
            ),
          ),
          Spacer(flex: 3),
          LongButton(
            borderColor: Colors.black,
            transparent: true,
            color: Colors.white,
            text: "MY ORDERS",
          ),
          SizedBox(height: 5),
          LongButton(
            color: Colors.black,
            text: "CONTINUE SHOPPING",
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    ));
  }
}
