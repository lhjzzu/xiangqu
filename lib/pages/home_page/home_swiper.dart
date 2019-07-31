import 'package:flutter/material.dart';
import '../../provide/home_provide.dart';
import '../../provide/swiper_index_provide.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provide/provide.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

typedef void HomeSwiperOnTap(int index);
class HomeSwiper extends StatelessWidget {
  final HomeSwiperOnTap onTap;
  HomeSwiper({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _swiper(context);
  }
   Widget _swiper(BuildContext context) {
    final _controller = new SwiperController();
    final _customLayoutOption =
        new CustomLayoutOption(startIndex: -1, stateCount: 3)
            .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
      new Offset(-350.0, 0.0),
      new Offset(0.0, 0.0),
      new Offset(350.0, 0.0)
    ]);

    return Provide<SwiperIndexProvide>(
      builder: (context, child, provide) {
        return Swiper(
          onTap: (int index) {
            if (this.onTap != null) {
              this.onTap(index);
            }
          },
          customLayoutOption: _customLayoutOption,
          fade: 1,
          index: Provide.value<SwiperIndexProvide>(context).currentIndex,
          onIndexChanged: (int index) {
            Provide.value<SwiperIndexProvide>(context).changeIndex(index);
          },
          curve: Curves.easeInOut,
          scale: 0.8,
          controller: _controller,
          layout: SwiperLayout.DEFAULT,
          outer: false,
          viewportFraction: 0.8,
          loop: false,
          autoplay: false,
          itemBuilder: (context, index) {
            return _itemBuilder(context, index);
          },
          itemCount: Provide.value<HomeProvide>(context).list.length,
          scrollDirection: Axis.horizontal,
          autoplayDisableOnInteraction: false,
        );
      },
    );
  }


  Widget _itemBuilder(context, index) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: Provide.value<HomeProvide>(context).list[index].image ,
          fit: BoxFit.cover,
          placeholder: (context, url) {
             return Center(
               child: Image.asset("assets/images/topic_default_image.png", fit: BoxFit.cover,),
             );
          },
        ),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    );
  }
}