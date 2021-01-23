import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:version1/AuthenticationService.dart';
import 'package:version1/screens/UserHome.dart';
import 'package:get/get.dart';

class WelcomeUser extends StatelessWidget {
  //String userId = FirebaseAuth.instance.currentUser.email;
  User currentUser;

  WelcomeUser({this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Text("Welcome Back" + currentUser.email),
          RaisedButton(
              child: Text("SignOut"),
              onPressed: () {
                AuthenticationService().signOut();
                Get.to(UserHome());
              })
        ],
      )),
    );
  }
}
