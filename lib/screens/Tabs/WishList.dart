import 'package:flutter/material.dart';
import 'package:skitestore/model/ProductModel.dart';
import 'package:skitestore/model/data.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppTextStyle.dart';

class WishList extends StatefulWidget {
     final AnimationController mainScreenAnimationController;

  const WishList({Key key, this.mainScreenAnimationController}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> with TickerProviderStateMixin{
  AnimationController animationController;
   List<ProductModel> carts = cartList();

 @override
  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: AnimatedBuilder(
          animation: widget.mainScreenAnimationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: widget.mainScreenAnimationController,
                      curve: Interval((1 / 1) * 2, 1.0,
                          curve: Curves.fastOutSlowIn))),
              child: new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 30 * (1.0 - Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: widget.mainScreenAnimationController,
                        curve: Interval((1 / 1) * 2, 1.0,
                            curve: Curves.fastOutSlowIn))).value), 0.0),
                child: view(),
              ),
            );
          },
        ),
    );
  }

  view(){
   return  ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:carts.length,
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, right: 3, left: 3),
                  itemBuilder: (context, index) {
                    var count = carts.length;
                    var animation = Tween(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController,
                            curve: Interval((1 / count) * index, 1.0,
                                curve: Curves.fastOutSlowIn)));
                    animationController.forward();
                    return CartItemsView(
                      animation: animation,
                      animationController: animationController,
                      image: carts[index].image,
                      name: carts[index].name,
                      id: index,
                      description: carts[index].desc,
                      like: carts[index].like,
                      price: carts[index].price,
                      rate: carts[index].rate,
                      status: carts[index].status,
                      
                    );
                  },
                );
  }
}

class CartItemsView extends StatefulWidget {
    final AnimationController animationController;
  final Animation animation;
   final String image, name, price, description, rate;
  final bool like, status;
  final int id;

   CartItemsView(
      {Key key,
      this.animationController, this.image, this.name, this.id, 
      this.animation,this.description, this.like, this.rate, this.price, this.status})
      : super(key: key);

  @override
  _CartItemsViewState createState() => _CartItemsViewState();
}

class _CartItemsViewState extends State<CartItemsView> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  100 * (1.0 - widget.animation.value), 0.0, 0.0),
              child:  GestureDetector(
         child: Container(
          child: ListTile(
            leading: Container(child: Image.asset(widget.image,), width: 100, height: 300,),
            title: Text(widget.name, style: AppTextStyle.subHeader1(context, AppColor.black),),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.price, style: AppTextStyle.header4(context, AppColor.black),),
                 Container(
                 // height: 80,
                   child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 150,
                    height: 30,
                    //color: Colors.grey,
                    decoration: BoxDecoration(
                        color: AppColor.primaryDarkColord,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: GestureDetector(
                          onTap: (){
                              setState(() {
                              _quantity -= 1;
                            });
                                        
                            },
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text("-",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: "Montserrat-Bold")),
                              ),
                            ),
                          ),
                        ),
                       // divider(),
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: double.infinity,
                            child: Center(
                              child: Text(_quantity.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "Montserrat-Bold")),
                            ),
                          ),
                        ),
                        //divider(),
                        Flexible(
                          flex: 2,
                          child: GestureDetector(
                            onTap: (){
                                            setState(() {
                                            _quantity += 1;
                                          });
                                        
                            },
                            child: Container(
                                height: double.infinity,
                              child: Center(
                                child: Text("+",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: "Montserrat-Bold")),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                          ),

               
              ],
            )
          ),
         )
         
          ),
        ) 
        );
      }
    );
  }
}