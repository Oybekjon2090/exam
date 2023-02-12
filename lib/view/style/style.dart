import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  // ---------- Color   ---------- //

  static const primaryColor = Color.fromARGB(255, 134, 173, 245);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const redColor = Colors.red;
  static const darkBgcolorOfApp = Color(0xff0D0D0D);

  // ---------- Gradient   ---------- //

  static const linearGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xff2972FE),
        Color(0xff6499FF),
      ]);

  static const primaryDisabledColor = Color.fromARGB(244, 50, 96, 224);

  

  static textStyleRegular(
          {double size = 18,
            Color textColor = blackColor,
          
         }) =>
      GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w600,
         color: textColor,
         
       
        fontSize: size
      );


        static textStyleRegular2(
          {double size = 16,
          Color textColor = blackColor,
          
         }) =>
      GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w600,
        color: textColor,
        fontSize: size
      );
  
}
