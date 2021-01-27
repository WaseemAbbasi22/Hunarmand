import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryresult;
  static double screenWidth = 500;
  static double screenHeight = 1000;
  static double defaultSize;
  static Orientation orientation;

  // void init(BuildContext context) {
  //   _mediaQueryresult = MediaQuery.of(context);
  //   screenWidth = _mediaQueryresult.size.width;
  //   screenHeight = _mediaQueryresult.size.height;
  //   orientation = _mediaQueryresult.orientation;
  // }
  @override
  void initState(BuildContext context) {
    _mediaQueryresult = MediaQuery.of(context);
    screenWidth = _mediaQueryresult.size.width;
    screenHeight = _mediaQueryresult.size.height;
    orientation = _mediaQueryresult.orientation;
  }
}

// Get the screen height as per screen size
double getScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;

  return (inputHeight / 812.0) * screenHeight;
}

//Get the screen height as per screen size
double getScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;

  return (inputWidth / 375.0) * screenWidth;
}
