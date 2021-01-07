import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class Cslider extends StatelessWidget {
  const Cslider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      //height: 200,
      //color: Colors.amber,
      child: CarouselSlider(
        options: CarouselOptions(
          disableCenter: true,
          height: 220.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: [
          _sliderContainer(
              image: 'assets/e_bg.JPG',
              heading: 'Electraction',
              sub_heading: 'Our skilled worker will help you'),
          _sliderContainer(
              image: 'assets/p_bg.JPG',
              heading: 'Electraction',
              sub_heading: 'Our skilled worker will help you'),
          _sliderContainer(
              image: 'assets/pa_bg.JPG',
              heading: 'Electraction',
              sub_heading: 'Our skilled worker will help you'),
          _sliderContainer(
              image: 'assets/g_bg.jpg',
              heading: 'Electraction',
              sub_heading: 'Our skilled worker will help you'),
        ],
      ),
    );
  }

  Widget _sliderContainer({String image, String heading, String sub_heading}) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        // margin: EdgeInsets.only(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     Text(
        //       heading,
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 20.0,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: Text(
        //         sub_heading,
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontSize: 15.0,
        //         ),
        //         //textAlign: TextAlign.center,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
  // return Swiper(
  //     itemBuilder: (BuildContext context, int index) {
  //       return new Image.asset(
  //         "assets/electric_bg.jpg",
  //         fit: BoxFit.fill,
  //       );
  //     },
  //     containerHeight: 250.0,
  //     itemHeight: 250,
  //     itemCount: 3,
  //     autoplay: true,
  //     pagination: new SwiperPagination(),
  //     control: new SwiperControl(),
  //   );
}
