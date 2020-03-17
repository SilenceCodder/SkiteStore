//
import 'package:flutter/material.dart';
import 'package:skitestore/screens/LoginScreen.dart';
import 'package:skitestore/screens/OnboardScreen.dart';
import 'package:skitestore/screens/ProductTAB/ListofProductsTabs.dart';
import 'package:skitestore/screens/RegisterScreen.dart';
import 'package:skitestore/screens/Tabs/MainDashboard.dart';
import 'package:skitestore/screens/WelcomeViewScreen.dart';
import 'package:skitestore/util/constants.dart';
import 'package:skitestore/widgets/MyKFmainWidget.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
  // case onboardRoute:
  //       return MaterialPageRoute(builder: (_) => OnboardScreen());

  //     case welcomeRoute:
  //       return MaterialPageRoute(builder: (_) => WelcomeView());

      //Onboard Page 
    case onboardRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow:  OnboardScreen(),
      );

      //Welcome Page 
    case welcomeRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: WelcomeView()
      );

      //Login Page 
    case loginRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginScreen()
      );

       //Register Page 
    case signUpRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RegisterScreen()
      );

      case dashboardRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MyKFmainWidget() //Must not be remove because this widget is handling MainDashboard Screen so instead of Navigating to
        //MainDasboard, You just need to use MyKFmainWidget
      );

        //Register Page 
    case productsTabs:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ListofProductsTabs()
      );
    



    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

