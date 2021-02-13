import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:version1/screens/CategoriesScreen.dart';
//import 'package:version1/screens/UserHome.dart';
import 'package:version1/screens/WomenCategoryScreen.dart';
import 'package:version1/screens/MenCategoryScreen.dart';
import 'package:version1/screens/ClothesMenu.dart';
import 'package:version1/widgets.dart';

class Controller extends GetxController {
  var height = 10.obs;
  var width = 50.obs;

  void increment() => height += 1;
  void decrease() => height += -1;
}

class CategoriesScreenController extends GetxController {
  var label = "".obs;
  var screen = 2.obs;
  void change(int newValue) => screen.value = newValue;
  void changeLabel(String newLabel) {
    label.value = newLabel;
    update();
  }
}

List<Widget> screens = [WomenCategories(), MenCategories(), Clothes()];

class TreeLevelController extends GetxController {
  var level = 1.obs;

  void reset() {
    level = 1.obs;
    update();
  }

  void increment() {
    level = level + 1;
    update();
  }
}

class CartContentController extends GetxController {
  List list = [].obs;

  void append(CartObject newItem) {
    list.add(newItem);
    update();
    print(list);
  }
}
