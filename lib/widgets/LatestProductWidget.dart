import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skitestore/model/CategoryModel.dart';
import 'package:skitestore/model/ProductModel.dart';
import 'package:skitestore/model/data.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppImage.dart';
import 'package:skitestore/styles/AppTextStyle.dart';
import 'package:skitestore/widgets/ProductView.dart';

class LatestProductWidget extends StatefulWidget {
  final AnimationController mainScreenAnimationController;
      final Animation mainScreenAnimation;

  
  const LatestProductWidget(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  @override
  _LatestProductWidgetState createState() => _LatestProductWidgetState();
}

class _LatestProductWidgetState extends State<LatestProductWidget> with TickerProviderStateMixin{
  AnimationController animationController;
   List<ProductModel> latest = latestProduct();

@override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }
 
     @override
  Widget build(BuildContext context) {
       return AnimatedBuilder(
         animation: widget.mainScreenAnimationController,
         builder: (BuildContext context, Widget child) {
           return FadeTransition(
             opacity: widget.mainScreenAnimation,
             child: new Transform(
               transform: new Matrix4.translationValues(
                   0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
               child: Container(
                  height: 200,
                  width: 700,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                       itemCount: latest.length,
                       padding: const EdgeInsets.only(
                           top: 0, bottom: 0, right: 2, left: 2),
                       itemBuilder: (context, index) {
                         var count = latest.length;
                         var animation = Tween(begin: 0.0, end: 1.0).animate(
                             CurvedAnimation(
                                 parent: animationController,
                                 curve: Interval((1 / count) * index, 1.0,
                                     curve: Curves.fastOutSlowIn)));
                         animationController.forward();
                          return ProductView(
                              image: latest[index].image,
                              name: latest[index].name,
                              id: index,
                              description: latest[index].desc,
                              like: latest[index].like,
                              price: latest[index].price,
                              rate: latest[index].rate,
                              status: latest[index].status,
                              animation: animation,
                              animationController: animationController,
                    );
                       },
                     ),
                  ),
               ),
               ),
             
           );
         },
       );
  }
}