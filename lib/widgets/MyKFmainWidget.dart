
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skitestore/screens/DemoPage.dart';
import 'package:skitestore/screens/Tabs/MainDashboard.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppImage.dart';
import 'package:skitestore/util/kf_drawer.dart';

class MyKFmainWidget extends StatefulWidget {
    @override
    _MyKFmainWidgetState createState() => _MyKFmainWidgetState();
}

class _MyKFmainWidgetState extends State<MyKFmainWidget> {
    KFDrawerController _drawerController;

    @override
    void initState() {
        super.initState();
        _drawerController = KFDrawerController(
            initialPage: MainDashboard(),
            items: [
                KFDrawerItem.initWithPage(
                    text: Text('Home', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    icon: Icon(FontAwesomeIcons.home, color: Colors.white),
                    page: DemoPage(), //BuyAirtime(),
                ), 
                KFDrawerItem.initWithPage(
                    text: Text('Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    icon: Icon(Icons.shopping_basket, color: Colors.white),
                    page: DemoPage(),
                ),
                KFDrawerItem.initWithPage(
                    text: Text('WishList', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    icon: Icon(FontAwesomeIcons.heart, color: Colors.white),
                    page: DemoPage(),
                ),
                KFDrawerItem.initWithPage(
                    text: Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    icon: Icon(FontAwesomeIcons.user, color: Colors.white),
                    page: DemoPage(),
                ),
            ],
        );
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: KFDrawer(
                controller: _drawerController,
                header: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Image.asset(
                                    AppImage.logo,
                                    alignment: Alignment.centerLeft,
                                ),
                            ],
                        )
                    ),
                ),
                footer: KFDrawerItem(
                    text: Text(
                        'LOG OUT',
                        style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                        Icons.input,
                        color: Colors.white,
                    ),
                    onPressed: () {
                       //LOG OUT
                    },
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                        colors: [AppColor.rimary, AppColor.darkrimary],
                        tileMode: TileMode.repeated,
                    ),
                ),
            ),

        );
    }

}