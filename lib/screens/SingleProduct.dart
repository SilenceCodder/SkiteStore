import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppImage.dart';
import 'package:skitestore/styles/AppText.dart';
import 'package:skitestore/styles/AppTextStyle.dart';

class SingleProduct extends StatefulWidget {
   final String imagePath, title, description, price, rate;
   final bool status;


     const SingleProduct(
       {Key key, this.imagePath, this.title, this.status, this.description, this.price, this.rate})
       : super(key: key);
  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct>
    with TickerProviderStateMixin {
  final infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;
  List<int> cartItem = [1,2,3,4,5,6];
  int selectedNumber;

  @override
  void initState() {
  
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  void setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tempHight = (MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width / 1.2) + 24.0);
    return Container(
      color: AppColor.primaryDarkColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: (widget.imagePath == null ? Image.asset(AppImage.splash1, fit: BoxFit.cover,)
                      : (Image.asset(widget.imagePath, fit: BoxFit.cover,))
                  )
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryLightColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppColor.primaryColor.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight:
                              tempHight > infoHeight ? tempHight : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0, left: 18, right: 16),
                            child: Text(
                                (widget.title == null ? '' : widget.title),
                              textAlign: TextAlign.left,
                              style: AppTextStyle.header3(context, AppColor.black)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  (widget.price == null ? ' ' : 'Price: ${widget.price}'),
                                  textAlign: TextAlign.left,
                                  style: AppTextStyle.subHeader2(context, AppColor.black)
                                ),
                                Column(
                                 children: <Widget>[
                                    Row(
                                    children: <Widget>[
                                      Text(
                                        (widget.rate == null ? '0' : '${widget.rate}'),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          letterSpacing: 0.27,
                                          color: AppColor.primaryDarkColord,
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15, top: 1.0),
                                        child: dropdown()
                                      ),
                                    ],
                                  )
                                 ],
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: opacity1,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                children: <Widget>[
                                  getTimeBoxUI((widget.status ? 'In stock' : 'Out of Stock'), "Status: "),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 5, bottom: 8),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        (widget.description == null ? ' ' :
                                        '${widget.description}'),
                                        textAlign: TextAlign.justify,
                                        style: AppTextStyle.subHeader2(context, Colors.black),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: opacity3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 48,
                                    height: 48,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryLight,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        border: new Border.all(
                                            color: AppColor.black
                                                .withOpacity(0.2)),
                                      ),
                                      child: Icon(
                                        Icons.shop,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child:  GestureDetector(
                                      child: Container(
                                        height: 48, decoration: BoxDecoration(
                                          color: AppColor.p,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(color: AppColor.primaryDarkColord.withOpacity(0.5),
                                                offset: Offset(1.1, 1.1),
                                                blurRadius: 10.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Add to Cart",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                              letterSpacing: 0.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: (){
                                        
                                      },
                                    ) 
                                    
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0 - 35,
              right: 35,
              child: new ScaleTransition(
                alignment: Alignment.center,
                scale: new CurvedAnimation(
                    parent: animationController, curve: Curves.fastOutSlowIn),
                child: Card(
                  color: AppColor.primaryDarkColord , //(widget.selected ? AppColor.primaryDarkColord : Colors.grey),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  elevation: 10.0,
                  child: Container(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color:  Colors.white, //(widget.selected ? Colors.white : AppColor.primaryDarkColord),
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: new BorderRadius.circular(
                        AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String text1, String txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primaryDarkColord,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColor.primaryColor.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                txt2,
                textAlign: TextAlign.center,
                style: AppTextStyle.subHeader2(context, Colors.yellow)
              ),
              Text(
                text1,
                textAlign: TextAlign.center,
                style: AppTextStyle.subHeader2(context, Colors.white)
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  dropdown(){
   return Container(
        height: 40,
          width: 80,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
            topLeft:  const  Radius.circular(0.0),
            topRight: const  Radius.circular(30.0),
            bottomLeft:const  Radius.circular(0.0),
            bottomRight: const  Radius.circular(30.0),
                    ),
                                    color: AppColor.primaryLight,
                                    border: Border.all(
                                        style: BorderStyle.solid, 
                                        width: 0.80, color: AppColor.primaryDarkColord),
                                  ),
                              child:  Center(
                                child: DropdownButton<int>(
                            isExpanded: true,
                             iconEnabledColor: Colors.white,
                                underline: SizedBox(),
                                value: selectedNumber,
                                onChanged: (value) {
                                  setState(() {
                                    selectedNumber = value;
                                  });
                                },
                                items: cartItem.map((lang) {
                                return DropdownMenuItem<int>(
                                          value: lang, 
                                          child: Text(lang.toString(), textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                                        );
                                            }).toList(),
                              
                              ),
                              ),
                            );
  }

  
}
