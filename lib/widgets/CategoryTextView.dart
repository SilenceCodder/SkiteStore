
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skitestore/core/services/navigation_service.dart';
import 'package:skitestore/locator.dart';
import 'package:skitestore/screens/ProductTAB/ListofProductsTabs.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppTextStyle.dart';
import 'package:skitestore/util/constants.dart';

class CategorytitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final IconData iconData;
  final AnimationController animationController;
  final Animation animation;
  final NavigationService _navigationService = locator<NavigationService>(); 

   CategorytitleView(
      {Key key,
      this.titleTxt: "",
      this.subTxt: "",
        this.iconData,
      this.animationController,
      this.animation})
      : super(key: key);

      
      
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.subHeader2(context, AppColor.colorDark)
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      onTap: () {
                        //TODO NAVIGATE TO PRODUCT PAGE..
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListofProductsTabs()),
                          );
                       
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            Text(
                              subTxt,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.subHeader2(context, AppColor.colorDark),
                            ),
                            SizedBox(
                              height: 38,
                              width: 26,
                              child: Icon(
                                iconData,
                                color: AppColor.rimary,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
