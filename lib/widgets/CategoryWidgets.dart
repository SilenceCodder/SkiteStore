import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skitestore/model/CategoryModel.dart';
import 'package:skitestore/model/data.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppImage.dart';
import 'package:skitestore/styles/AppTextStyle.dart';

class CategoryWidgets extends StatefulWidget {
      final AnimationController mainScreenAnimationController;
      final Animation mainScreenAnimation;

  
  const CategoryWidgets(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  @override
  _CategoryWidgetsState createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets> with TickerProviderStateMixin{
 AnimationController animationController;

  List<CategoryModel> categoryList = category();

@override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }


     @override
  Widget build(BuildContext context) {
      // var responseData = Provider.of<CategoryModel>(context);
       return AnimatedBuilder(
         animation: widget.mainScreenAnimationController,
         builder: (BuildContext context, Widget child) {
           return FadeTransition(
             opacity: widget.mainScreenAnimation,
             child: new Transform(
               transform: new Matrix4.translationValues(
                   0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
               child: Container(
                 height: MediaQuery.of(context).size.height / 7,
            width: double.infinity,
                   child: ListView.builder(
                     scrollDirection: Axis.horizontal,
                     shrinkWrap: true,
                     itemCount: categoryList.length,
                     padding: const EdgeInsets.only(
                         top: 0, bottom: 0, right: 3, left: 3),
                     itemBuilder: (context, index) {
                       var count = categoryList.length;
                       var animation = Tween(begin: 0.0, end: 1.0).animate(
                           CurvedAnimation(
                               parent: animationController,
                               curve: Interval((1 / count) * index, 1.0,
                                   curve: Curves.fastOutSlowIn)));
                       animationController.forward();
                        return CategoryView(
                  iconLink: categoryList[index].iconLink,
                  name: categoryList[index].name,
                  id: index,
                  animation: animation,
                   animationController: animationController,
                );
                     },
                   ),
                 ),
               ),
             
           );
         },
       );
  
  
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  
}

class CategoryView extends StatelessWidget {
 final AnimationController animationController;
  final Animation animation;
  final bool changeColor;
  final String iconLink, name;
  final int id;

  const CategoryView(
      {Key key,
      this.animationController, this.iconLink, this.name, this.id, this.animation, this.changeColor, })
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
              child: Container(
    margin: EdgeInsets.only(left: 14),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 50,
              height: 50,
              child: FloatingActionButton(
                shape: CircleBorder(),
                heroTag: name,
                //onPressed: onPressed,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: SvgPicture.network(
                    iconLink,
                    placeholderBuilder: (BuildContext context) => Image.asset(AppImage.loading),
                  ),
                ),
                onPressed: ()=> print(''),
              )),
        ),
        Text(name + ' ›', style: AppTextStyle.subHeader2(context, AppColor.colorDark))
      ],
    ),
  ),
          ),
        );
      },
    );
  }
}