import 'package:flutter/material.dart';
import 'package:skitestore/styles/AppImage.dart';
import 'package:skitestore/widgets/AdvertSlider.dart';
import 'package:skitestore/widgets/CategoryTextView.dart';
import 'package:skitestore/widgets/CategoryWidgets.dart';
import 'package:skitestore/widgets/LatestProductWidget.dart';

class DashboardScreen extends StatefulWidget {
   final AnimationController animationController;
  const DashboardScreen({Key key, this.animationController}) : super(key: key);
  
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
List<Widget> listViews = List<Widget>();
  var scrollController = ScrollController();
  double topBarOpacity = 0.0;
   TabController tabController;
   GlobalKey key = new GlobalKey();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    addAllListData();
    super.initState();
  }

  void addAllListData() {
    var count = 9;
    listViews.add(
      AdvertSlider(
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
            Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
   listViews.add(
      CategorytitleView(
        titleTxt: 'Categories',
        subTxt: '',
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      CategoryWidgets(
        mainScreenAnimation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );

  //**************LATEST PRODUCT */
    listViews.add(
      CategorytitleView(
        titleTxt: 'Latest Products',
        subTxt: 'View More',
        iconData: Icons.arrow_right,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      LatestProductWidget(
        mainScreenAnimation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 4, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );


 //**************PRODUCT 1 */

     listViews.add(
      CategorytitleView(
        titleTxt: 'Watch Collection',
        subTxt: 'View more',
        iconData: Icons.arrow_right,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 5, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      LatestProductWidget(
        mainScreenAnimation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 6, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );


    listViews.add(
Image.asset(AppImage.bike)
    );
 //**************PRODUCT 2 */

 
     listViews.add(
      CategorytitleView(
        titleTxt: 'Wears Collection',
        subTxt: 'View more',
        iconData: Icons.arrow_right,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 7, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      LatestProductWidget(
        mainScreenAnimation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 8, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );

    
    listViews.add(
Image.asset(AppImage.splash1)
    );


    
 //**************PRODUCT 3 */
     listViews.add(
      CategorytitleView(
        titleTxt: 'Laptop Collection',
        subTxt: 'View more',
        iconData: Icons.arrow_right,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve: Interval((1 / count) * 9, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      LatestProductWidget(
        mainScreenAnimation: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval((1 / count) * 10, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController,
      ),
    );
  }
  
  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget getMainListViewUI() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        } else {
          return ListView.builder(
           controller: scrollController,
             shrinkWrap: true,
            padding: EdgeInsets.only(
//              top: AppBar().preferredSize.height + // Am not using custom App Bar, so I comment this out
//                  MediaQuery.of(context).padding.top +
//                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
              body: Stack(
              children: <Widget>[
                getMainListViewUI(),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
            
            );
  }
}