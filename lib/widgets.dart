import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsWidget extends StatelessWidget {
  AssetImage pic;
  String headline;
  String summary;

  NewsWidget({Key key, this.pic, this.headline, this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
            height: 200,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: pic, fit: BoxFit.cover))),
        Text(
          headline,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        Text(summary,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black))
      ],
    ));
  }
}

class Profile_pic extends StatelessWidget {
  AssetImage image;
  Color color;
  Color shadowColor;
  Profile_pic({this.image, this.color, this.shadowColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: shadowColor, offset: Offset(2.0, 2.0), blurRadius: 5.0),
        ],
        border: Border.all(color: color),
        image: DecorationImage(image: image, fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );
  }
}

class PopCircle extends StatelessWidget {
  AnimationController controller;

  PopCircle({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow,
          image: DecorationImage(image: AssetImage("images/oracle.jpg")),
        ));
  }
}

class DS_Sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.1,
        maxChildSize: 1.0,
        builder: (context, scrollcontroller) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    controller: scrollcontroller,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Text("b");
                    },
                  ),
                ),
              ));
        });
  }
}

class LongButton extends StatelessWidget {
  Color color;
  String text;
  bool short;
  bool transparent;

  LongButton(
      {this.color, this.text, this.short = false, this.transparent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height) * 0.07,
      width: short == true
          ? (MediaQuery.of(context).size.width) * 0.375
          : (MediaQuery.of(context).size.width) * 0.75,
      decoration: BoxDecoration(
        color: transparent == true ? null : color,
        borderRadius: BorderRadius.circular(30),
        border: transparent == true
            ? Border.all(color: Colors.white, width: 2)
            : null,
      ),
      child: Center(
          child: Text(text,
              style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                      color:
                          color == Colors.white ? Colors.black : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900)))),
    );
  }
}
