import 'package:flutter/material.dart';
import 'package:skitestore/core/services/navigation_service.dart';
import 'package:skitestore/locator.dart';
import 'package:skitestore/screens/Tabs/MainDashboard.dart';
import 'package:skitestore/util/constants.dart';
import 'package:skitestore/viewmodel/base_model.dart';

class SignUpViewModel extends BaseModel{
final NavigationService _navigationService = locator<NavigationService>(); 

  void initialize(){
    //When you load the page, what did you want me to do? // This is like inistate in flutter stateful widget

  }

  void facebookClicked(){
    //What to do when Facebook is clicked

  }

  void googleClicked(){
     //What to do when Google is clicked
    
  }

  void proceed({BuildContext context}){
    _navigationService.navigateTo(dashboardRoute);
  }

  void signIn(){
 _navigationService.navigateTo(loginRoute);
  }

}