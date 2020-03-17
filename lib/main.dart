import 'package:flutter/material.dart';
import 'package:skitestore/core/services/dialog_service.dart';
import 'package:skitestore/core/services/navigation_service.dart';
import 'package:skitestore/locator.dart';
import 'package:skitestore/managers/dialog_manager.dart';
import 'package:skitestore/router.dart';
import 'package:skitestore/screens/OnboardScreen.dart';
import 'package:skitestore/screens/ProductTAB/ListofProductsTabs.dart';
import 'package:skitestore/screens/RegisterScreen.dart';
import 'package:skitestore/screens/SingleProduct.dart';
import 'package:skitestore/styles/AppText.dart';
import 'package:skitestore/widgets/MyKFmainWidget.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: AppText.appName,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: MyKFmainWidget(), //
      onGenerateRoute: generateRoute,
    );
}
}
