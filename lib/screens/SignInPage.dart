import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:version1/screens/WelcomeUser.dart';
import 'package:get/get.dart';
import 'package:version1/AuthenticationService.dart';
import 'package:version1/appConstants.dart';
import 'package:version1/screens/genderChoicePage.dart';
import 'package:version1/widgets.dart';

class SignInPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Hero(
              tag: "home",
              child: Material(
                child: Container(
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
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Log into",
                            style: buildABeeZee(30),
                          ),
                          Text(
                            "Your account",
                            style: buildABeeZee(30),
                          ),
                        ],
                      ),
                    ),
                    height: (MediaQuery.of(context).size.height) * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/oip/pic16a.jpg"),
                            fit: BoxFit.cover))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height) * 0.6,
                child: ListView(
                  children: [
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
                          AuthenticationService().signIn(
                              emailController.text, passwordController.text);

                          Get.to(GenderChoicePage(),
                              transition: Transition.rightToLeft);

                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      child: Column(
                                        children: [
                                          Image(
                                            image:
                                                AssetImage("images/oracle.jpg"),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                              "Enjoy 20% discount on all product in "),
                                          Text("our shop for your first order"),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          LongButton(
                                            color: Colors.blue,
                                            text: "Shop Now",
                                            short: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child:
                            LongButton(color: Colors.black, text: "SIGN IN")),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("OR")),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: LongButton(
                          color: Colors.blue[600],
                          text: "SIGN IN WITH FACEBOOK"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
