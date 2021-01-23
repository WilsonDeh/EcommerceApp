import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle buildABeeZee(double size) {
  return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
          color: Colors.white, fontSize: size, fontWeight: FontWeight.w900));
}

//images

String welcomeScreenImage =
    "https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHdvbWFufGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

List<String> categoryNames = ["New In", "Accessories", "Clothings", "Shoes"];
