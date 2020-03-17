import 'package:flutter/material.dart';
import 'package:skitestore/model/CategoryModel.dart';
import 'package:skitestore/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppImage.dart';
import 'package:skitestore/styles/AppTextStyle.dart';


class AllCategory extends StatefulWidget {
  final AnimationController mainScreenAnimationController;
      final Animation mainScreenAnimation;
    
  const AllCategory(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  @override
  _AllCategoryState createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> with TickerProviderStateMixin{
   List<CategoryModel> categortyList = category();
 AnimationController animationController;

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
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child:  GridView(
                      padding:
                      EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        categortyList.length,
                            (index) {
                          var count = categortyList.length;
                          var animation = Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn),
                            ),
                          );
                          animationController.forward();
                          return CategoryViewGrid(
                          iconLink: categortyList[index].iconLink,
                          name: categortyList[index].name,
                          id: index,
                          animation: animation,
                          animationController: animationController,
                          );
                        },
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 24.0,
                        crossAxisSpacing: 24.0,
                        childAspectRatio: 1.0,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }

}
  class CategoryViewGrid extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final bool changeColor;
  final String iconLink, name;
  final int id;

  const CategoryViewGrid(
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
              child: AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
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
              child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: SvgPicture.network(
                    iconLink,
                    placeholderBuilder: (BuildContext context) => Image.asset(AppImage.loading),
                  ),
                ),
              ),
        ),
        Text(name + ' ›', style: AppTextStyle.subHeader2(context, AppColor.colorDark))
      ],
    ),
  
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