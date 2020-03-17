import 'package:flutter/material.dart';
import 'package:skitestore/model/ProductModel.dart';
import 'package:skitestore/model/data.dart';
import 'package:skitestore/widgets/GridProductWidget.dart';

class WearScreen extends StatefulWidget {
  @override
  _WearScreenState createState() => _WearScreenState();
}

class _WearScreenState extends State<WearScreen> with TickerProviderStateMixin{
   AnimationController animationController;
    List<ProductModel> wearsList = latestProduct();

     @override
  void initState() {
    super.initState();
      animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
      
  }


  @override
  Widget build(BuildContext context) {
     return AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
              return FadeTransition(
                opacity: animationController,
                child: new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30 * (1.0 - animationController.value), 0.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child:  GridView(
                      padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        wearsList.length,
                            (index) {
                          var count = wearsList.length;
                          var animation = Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn),
                            ),
                          );
                          animationController.forward();
						return GridProductWidget(
                              image: wearsList[index].image,
                              name: wearsList[index].name,
                              id: index,
                               description: wearsList[index].desc,
                              like: wearsList[index].like,
                              price: wearsList[index].price,
                              rate: wearsList[index].rate,
                              status: wearsList[index].status,
                              animation: animation,
                              animationController: animationController,
                    );
                        },
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 15.0,
                        childAspectRatio: 0.65,
						
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}