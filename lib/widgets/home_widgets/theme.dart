// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightthemeData(BuildContext context) => ThemeData(
      primarySwatch: Colors.blueGrey,
      // primarySwatch: Colors.deepPurple,
      //     .deepPurple, //swatch means collection of color which atumatically adjust
      //brightness: Brightness.dark, //dark mode property
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: const Color.fromARGB(255, 50, 55, 126),
      accentColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
        // color: creamCo.blueGlor,
        elevation: 0.0,
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(color: Colors.black),

        textTheme: Theme.of(context).textTheme,
      ));
  static ThemeData darkthemeData(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      // buttonColor: lightBluishColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white),
        elevation: 0.0,
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(color: Colors.white),

        textTheme: Theme.of(context).textTheme,
      ));
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color.fromARGB(255, 50, 55, 126);
  static Color lightBluishColor = Vx.indigo500;
}
