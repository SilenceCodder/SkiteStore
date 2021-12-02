import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skitestore/screens/Tabs/CartListScreen.dart';
import 'package:skitestore/screens/Tabs/WishList.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppTextStyle.dart';

class TestDashboard extends StatefulWidget {
  @override
  _TestDashboardState createState() => _TestDashboardState();
}

class _TestDashboardState extends State<TestDashboard> with TickerProviderStateMixin  {

     var _scaffoldKey = new GlobalKey<ScaffoldState>();
      int _selectedIndex = 0;

  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     key:_scaffoldKey,
     appBar: AppBar(
          backgroundColor: AppColor.darkrimary,
          title:Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ScaleAnimatedTextKit(
                  text: [
                    "Hi User,",
                    "Welcome to SkiteStore",
                  ],
                  textStyle: AppTextStyle.subHeader1(context, Colors.white),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
           
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: (){
                  //TODO SEARCH PRODUCT
                },
              ),
            ),
          ],
        ),
     body: switchBody(),
      // Bottom Bar
        bottomNavigationBar: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 20.3,
            fixedColor: Colors.white,
            backgroundColor: AppColor.darkrimary,
             onTap: (index) => _onItemTapped(index),
            items: <BottomNavigationBarItem>[  
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                  color: Colors.white,),
                title: new Text("Home",
                  style: AppTextStyle.subHeader2(context, Colors.white)
                 
                ),
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.category,
                  color: Colors.white,),
                title: new Text("Category",
                  style: AppTextStyle.subHeader2(context, Colors.white)
                 
                ),
              ),
              //Order List
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket,
                  color: Colors.white,
                ),
                title: new Text("Cart",
                  style: AppTextStyle.subHeader2(context, Colors.white)
                ),
              ),

             
              
            ]

        ),
    
    );
  }

   switchBody(){
//    Main.
    if(_selectedIndex == 0){

     // return DashboardScreen(animationController: animationController,);
     return WishList(mainScreenAnimationController: animationController,);

  }else if(_selectedIndex == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  
        CartListScreen()
        ),);
  }
   }
   
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}