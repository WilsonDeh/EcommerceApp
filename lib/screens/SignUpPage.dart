import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:version1/AuthenticationService.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Text("Back",
                            style: TextStyle(fontSize: 15, color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Create your",
                      style: buildABeeZee(30),
                    ),
                    Text(
                      "account",
                      style: buildABeeZee(30),
                    ),
                  ],
                ),
              ),
              height: (MediaQuery.of(context).size.height) * 0.3,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0),
                      colors: [Colors.black54, Colors.black87])),
            ),
            Padding(
              padding: EdgeInsets.all(32.0),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.6,
                child: ListView(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(labelText: "Enter name"),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Email';
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Enter Email"),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(labelText: "Enter Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          AuthenticationService().signUp(
                              emailController.text, passwordController.text);
                        },
                        child:
                            LongButton(color: Colors.black, text: "SIGN UP")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("OR")),
                    ),
                    GestureDetector(
                        onTap: () {
                          AuthenticationService().signUp(
                              emailController.text, passwordController.text);
                        },
                        child: LongButton(
                            color: Colors.blue[700],
                            text: "SIGN UP WITH FACEBOOK")),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],

          //submit button
        ),
      ),
    );
  }
}
