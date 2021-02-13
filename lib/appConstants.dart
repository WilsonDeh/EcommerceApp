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

List<String> clothings = [
  "T-Shirts",
  "Sweaters",
  "Jackets",
  "Jeans",
  "Overalls",
  "Skirts",
  "Dresses"
];

List<String> clothingImages = [
  "images/clothes/tshirt.jpg",
  "images/clothes/sweater.jpg",
  "images/clothes/jacket.jpg",
  "images/clothes/jeans.jpg",
  "images/clothes/overall.jpg",
  "images/clothes/skirt.jpg",
  "images/clothes/dress.jpg",
];

List<List<String>> tshirtImages = [
  ["images/oip/pic1.jpg", "images/oip/pic2.jpg", "images/oip/pic3.jpg"],
  ["images/oip/pic4.jpg", "images/oip/pic5.jpg", "images/oip/pic6.jpg"],
  ["images/oip/pic7.jpg", "images/oip/pic8.jpg", "images/oip/pic9.jpg"],
  ["images/oip/pic10.jpg", "images/oip/pic11.jpg", "images/oip/pic12.jpg"],
  [
    "images/oip/pic13.jpg",
  ],
  [
    "images/oip/pic14.jpg",
  ],
  [
    "images/oip/pic15.jpg",
  ],
  [
    "images/oip/pic16.jpg",
  ],
];

List<String> tshirtNames = [
  "Crew Neck",
  "Slim Fit",
  "Round Neck",
  "Crews Neck",
  "Rounds Neck",
  "Turtle Necks",
  "Slim Fits",
  "Round Necks",
];

List<String> tshirtPrices = [
  "GHc20",
  "GHc50",
  "GHc48",
  "GHc35",
  "GHc25",
  "GHc75",
  "GHc55",
  "GHc20",
];
