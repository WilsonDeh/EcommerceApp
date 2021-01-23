import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:version1/screens/CategoriesScreen.dart';
import 'package:version1/screens/UserHome.dart';

class Controller extends GetxController {
  var height = 10.obs;
  var width = 50.obs;

  void increment() => height += 1;
  void decrease() => height += -1;
}

class RadiusController extends GetxController {
  var radius = 0.obs;

  void change(newValue) => radius = newValue.obs;
}

class DragController extends Scrollable {
  var x = 0.obs;

  void increment() => x += 1;
}

class CategoriesScreenController extends GetxController {
  var label = "".obs;
  var screen = 2.obs;
  void change(int newValue) => screen.value = newValue;
  void changeLabel(String newLabel) => label.value = newLabel;
}

List<Widget> screens = [
  WomenCategories(),
  MenCategories(),
];
