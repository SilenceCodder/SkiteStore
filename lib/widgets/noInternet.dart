import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skitestore/styles/AppColor.dart';

class NoInternetWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Color(0xFFB26FB7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('No Internet Connection',
              style: GoogleFonts.alef( fontSize: 17.0, textStyle: TextStyle(
                  color: Colors.yellowAccent
              )),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TypewriterAnimatedTextKit(
                      text: ['Please turn on your Internet',],
                      textStyle: GoogleFonts.alef(fontSize: 20.0, textStyle: TextStyle(color: Colors.white
              ),),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
