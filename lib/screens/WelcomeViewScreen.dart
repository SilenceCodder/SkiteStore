import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:skitestore/core/services/navigation_service.dart';
import 'package:skitestore/locator.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppTextStyle.dart';
import 'package:skitestore/util/constants.dart';
import 'package:skitestore/widgets/delayed_animation.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView>with SingleTickerProviderStateMixin {
  final NavigationService _navigationService = locator<NavigationService>(); 

  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColor().darkprimaryOpacity,
          body: Center(
            child: Column(
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: FlutterLogo(
                          size: 50.0,
                        ),
                        radius: 50.0,
                      )),
                ),
                DelayedAnimation(
                  child: Text(
                    "Hi User",
                    style: AppTextStyle.header3(context, Colors.white),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text(
                    "I'm SkiteStore",
                    style: AppTextStyle.header3(context, Colors.white),),
                  delay: delayedAmount + 2000,
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "Best worldwide store with fatest delivery",
                    style: AppTextStyle.subHeader1(context, Colors.white)
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),

                //SignUp Button Animation
                DelayedAnimation(
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  onTap: _signUp,
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonSignUp,
                  ),
                ),
                delay: delayedAmount + 4000,
              ),
              SizedBox(height: 50.0,),

              //Login Button Animation
               DelayedAnimation(
                child: GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  onTap: _loginTap,
                  child: Transform.scale(
                    scale: _scale,
                    child: _animatedButtonLogin,
                  ),
                ),
                delay: delayedAmount + 5000,
              ),
                SizedBox(
                  height: 100.0,
                ),
                DelayedAnimation(
                  child:  FadeAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        "Develop",
                        "Developed",
                        "Developed by SkiteTech"
                      ],
                      textStyle: AppTextStyle.subHeader2(context, Colors.white),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                  delay: delayedAmount + 6000,
                ),

              ],
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget get _animatedButtonSignUp => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'SignUp',
            style: AppTextStyle.header3(context, AppColor.black)
          ),
        ),
      );

       Widget get _animatedButtonLogin => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Login',
            style: AppTextStyle.header3(context, AppColor.black)
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

//Navigate to Login screen
  void _loginTap(){
_navigationService.navigateTo(loginRoute);
  }

//Navigate to signUp screen
   void _signUp(){
_navigationService.navigateTo(signUpRoute);
  }
}
