import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:skitestore/styles/AppImage.dart';
import 'package:skitestore/styles/AppText.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:skitestore/viewmodel/OnboardViewModel.dart';

class OnboardScreen extends StatefulWidget {
  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
 final pages = [
   //*****SCREEN 1 */
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: Color(0xFF8151FA),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(AppText.splashtitle1, style: GoogleFonts.alef()),
          SizedBox(height: 5.0,),
          Text(
            AppText.sp1,
              style: GoogleFonts.alef(textStyle: TextStyle(
                  color:  Colors.black54),
                  fontSize: 16.0)
          ),
        ],
      ),
      mainImage: Image.asset(
       AppImage.splash1,
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    
      //*****SCREEN 2 */
    PageViewModel(
      pageColor: Color(0xFfffff),
      iconColor: null,
      bubbleBackgroundColor: Color(0xFF8151FA),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(AppText.splashtitle2, style: GoogleFonts.alef(fontSize: 20)),
          SizedBox(height: 5.0,),
          Text(
            AppText.sp2,
            style: GoogleFonts.alef(textStyle: TextStyle(
  color:  Colors.black54),
  fontSize: 16.0)
          ),
        ],
      ),
     mainImage: Image.asset(
       AppImage.splash2,
        width:  1000.0,
         height: 1000,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
   
     //*****SCREEN 3 */
    PageViewModel(
      pageColor: Color(0xF6FFFF),
      iconColor: null,
      bubbleBackgroundColor: Color(0xFF8151FA),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(AppText.splashtitle3, style: GoogleFonts.alef(fontSize: 20)),
          SizedBox(height: 5.0,),
          Text(
            AppText.sp3,
            style: GoogleFonts.alef(textStyle: TextStyle(
              color:  Colors.black54
            ),
                fontSize: 16.0)
          ),
        ],
      ),
      mainImage: Image.asset(
        AppImage.splash3,
        width:  1000.0,
         height: 1000,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

@override
  Widget build(BuildContext context) {
    return ViewModelProvider<OnboardViewModel>.withConsumer(
      viewModel: OnboardViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) =>
       Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: (){
                model.proceed();
              },
              showSkipButton: false,
              doneText: Text("Get Started",),
              pageButtonsColor: Color(0xFF8151FA),
              pageButtonTextStyles: new TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
            // Positioned(
            //     top: 20.0,
            //     left: MediaQuery.of(context).size.width/2 - 50,
            //     child: Image.asset(AppImage.logo, width: 100,)
            // )
          ],
        ),
      ),
    ));
  }
}