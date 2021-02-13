import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/Controllers.dart';
import 'package:version1/screens/UserHome.dart';
import 'package:get/get.dart';
import 'package:version1/widgets.dart';
import 'package:version1/widgets.dart';
import 'package:version1/screens/DetailScreen.dart';
import 'tshirtsScreen.dart';

class CategoriesScreen extends StatelessWidget {
  //CategoriesScreenController controller = Get.put(CategoriesScreenController());
  TreeLevelController treeController = Get.put(TreeLevelController());
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  treeController.reset();
                  Get.back();
                },
              ),
              SizedBox(
                width: 230,
              ),
              Icon(Icons.search)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20,
                child: categoryNameBox(),
              ),
              SizedBox(),
            ],
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
