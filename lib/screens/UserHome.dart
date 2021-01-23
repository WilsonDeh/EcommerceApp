import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:version1/screens/SignUpPage.dart';
import 'package:get/get.dart';
import 'SignInPage.dart';
import 'package:version1/AuthenticationService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/widgets.dart';

class UserHome extends StatelessWidget {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHdvbWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"))),
      ),
      // StreamBuilder<QuerySnapshot>(
      //     stream: db
      //         .collection("store")
      //         .doc("unspecified")
      //         .collection("images")
      //         .snapshots(),
      //     builder: (context, snapshot) {
      //       if (!snapshot.hasData)
      //         return Center(child: CircularProgressIndicator());
      //       return Container(
      //         decoration: BoxDecoration(
      //             image: DecorationImage(
      //                 fit: BoxFit.cover,
      //                 image: NetworkImage(snapshot.data.docs[1]["imageUrl"]))),
      //       );
      //     }),
      Positioned(
          right: (MediaQuery.of(context).size.width) * 0.04,
          top: (MediaQuery.of(context).size.height) * 0.10,
          child: GestureDetector(
            onTap: () {
              Get.to(SignInPage(), transition: Transition.cupertino);
            },
            child: Text(
              "SIGN IN",
              style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
            ),
          )),
      Center(
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height) * 0.60,
            ),
            Text(
              "Ideal Store for",
              style: buildABeeZee(30),
            ),
            Text(
              "your shopping",
              style: buildABeeZee(30),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Get.to(SignUpPage(), transition: Transition.rightToLeft);
              },
              child:
                  LongButton(text: "SIGN UP WITH EMAIL", color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {},
                child: LongButton(
                  text: "CONTINUE WITH FACEBOOK",
                  transparent: true,
                )),
          ],
        ),
      ),
    ]));
  }
}
