import 'package:flutter/material.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppTextStyle.dart';
import 'package:skitestore/screens/SingleProduct.dart';

class GridProductWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
final String image, name, price, description, rate;
  final bool like, status;
  final int id;

  const GridProductWidget(
      {Key key,
      this.animationController, this.image, this.name, this.id, this.animation,this.description, this.like, this.rate, this.price, this.status})
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
                100 * (1.0 - animation.value), 0.0, 0.0),
              child: AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Container(
    margin: EdgeInsets.only(left: 3),
    child: Container(
      child: Stack(children: <Widget>[
         Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.0),
        child: MaterialButton(
          color: AppColor.primaryLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
           onPressed: (){
 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SingleProduct(
                          price: price,
                          description: description,
                          title: name,
                          rate: rate,
                          imagePath: image,
                          status: status,
      )),
                  );
           },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               Image.asset(image, height: 150),
          //       SizedBox(height: 5.0),
                Text(
                name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ],
            ),
          ),
        ),
      ),
        SizedBox(height: 5.0),
          Positioned(
            top: 5,
            bottom: 15,
            left: 10,
            child: 
               Text(
              "N340,00",
              style: AppTextStyle.subHeader2(context, AppColor.black),
            ),
            )
      ],)
)
  
  ),
         
          ),
        );
      },
    )
          ),
        );
      },
    );
  }
}