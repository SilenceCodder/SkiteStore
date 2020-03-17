//********** THIS FILE CONTAIN TEXT Style*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skitestore/styles/AppFontSize.dart';

class AppTextStyle{

  static TextStyle header1(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.largest,
     textStyle: 
    TextStyle(
        color: color));
  }

  static TextStyle header2(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.larger,
     textStyle: 
    TextStyle(
        color: color));
  }
        static TextStyle header3(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.large,
       fontWeight: FontWeight.bold,
     textStyle: 
    TextStyle(
        color: color));
  }


   static TextStyle header4(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.large2,
     textStyle: 
    TextStyle(
        color: color));
   }
        static TextStyle subHeader1(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.medium,
     textStyle: 
    TextStyle(
        color: color));
  }

static TextStyle subHeader2(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.small,
     textStyle: 
    TextStyle(
        color: color));
  }

static TextStyle subheader3(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.smallest,
     textStyle: 
    TextStyle(
        color: color));
  }
  static TextStyle subheader3Bold(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: AppFontSizes.smallest,
     textStyle: 
    TextStyle(
      fontWeight: FontWeight.bold,
        color: color));
  }


}