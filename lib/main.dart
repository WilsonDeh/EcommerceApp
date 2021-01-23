import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:version1/CustomDrawer.dart';
import 'package:version1/FlipScaffold.dart';
import 'package:version1/screens/UserHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:version1/screens/SignUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: UserHome())),
    );
  }
}

class screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(Icons.access_alarm),
      ),
    );
  }
}
