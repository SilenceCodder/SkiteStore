import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:skitestore/model/AdvertSliderModel.dart';
import 'package:skitestore/model/data.dart';
import 'package:skitestore/styles/AppColor.dart';
import 'package:skitestore/styles/AppImage.dart';

class AdvertSlider extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
 

   AdvertSlider(
      {Key key,
      this.animationController,  
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

      List<AdvertSliderModel> advertSliderList = advert();
   
    return  AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: AppColor.primaryLight,
                    ),
                    height: 150.0,
                    child: Swiper(
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          child: TopSwiperWidget(
                            image: advertSliderList[index].image,
                            index: index,
                          ),
                          onTap: (){
                           
                          },
                        );
                      },
                      itemCount: advertSliderList.length,
                      pagination: new SwiperPagination(),
                    ),

                  )
              )

          ),
        );
      },
    );

  }

//
//  get(){
//    // List<Banners> banners = responseData.data.
//    responseData.data.
//  }


}

class TopSwiperWidget extends StatelessWidget {
    final String image;
  final int index;

  const TopSwiperWidget({Key key, this.image, this.index, })
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

  return  FadeInImage.assetNetwork(
     placeholder: AppImage.loading,
     image: image,
     height: MediaQuery.of(context).size.height,
     fit: BoxFit.fill,
     width: MediaQuery.of(context).size.width,
   );
 
  }
}