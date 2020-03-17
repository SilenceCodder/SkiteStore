import 'package:skitestore/core/services/navigation_service.dart';
import 'package:skitestore/locator.dart';
import 'package:skitestore/util/constants.dart';
import 'package:skitestore/viewmodel/base_model.dart';

class OnboardViewModel extends BaseModel{
  
final NavigationService _navigationService = locator<NavigationService>(); 


void initialize(){
  //When you load the page, what did you want me to do? // This is like inistate in flutter stateful widget
}

void proceed(){
  //Move to welcome Screen
  _navigationService.navigateTo(welcomeRoute);
}
}