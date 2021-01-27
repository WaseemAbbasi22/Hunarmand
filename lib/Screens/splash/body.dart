import 'package:Hunarmand_signIn_Ui/Screens/home/starter.dart';
import 'package:Hunarmand_signIn_Ui/Screens/splash/content/splash_content.dart';

import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _animationDuration = Duration(milliseconds: 200);
  int currentPage = 0;
  int currentIndex = 0;
  PageController _controller;
  List<Map<String, String>> splashData = [
    {
      "id": "1",
      "text":
          "Are you serching for Home Services\nWith HUNARMAND you can find easily.\n1st Post your Job",
      "image": "assets/images/post_task_icon.png"
    },
    {
      "id": "2",
      "text":
          "2nd Get offers from trusted Workers around you\nand view their profiles",
      "image": "assets/images/review_offers_icon.png"
    },
    {
      "id": "3",
      "text":
          "3rd Choose the right person for your Job and.\nget it done by our trusted workers.",
      "image": "assets/images/hire_icon.png"
    },
  ];
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (_, i) => SplashContent(
                image: splashData[i]["image"],
                text: splashData[i]['text'],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(flex: 3),
                  ButtonWidget(
                    btnText: currentIndex == splashData.length - 1
                        ? "CONTINUE"
                        : "NEXT",
                    onClick: () {
                      if (currentIndex == splashData.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StarterScreen(),
                          ),
                        );
                      }
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                  ),
                  // Container(
                  //   height: 40,
                  //   margin: EdgeInsets.all(40),
                  //   width: double.infinity,
                  //   child: FlatButton(
                  //     child: Text(currentIndex == splashData.length - 1
                  //         ? "CONTINUE"
                  //         : "NEXT"),
                  //     onPressed: () {
                  //       if (currentIndex == splashData.length - 1) {
                  //         Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (_) => SignIn(),
                  //           ),
                  //         );
                  //       }
                  //       _controller.nextPage(
                  //         duration: Duration(milliseconds: 100),
                  //         curve: Curves.bounceIn,
                  //       );
                  //     },
                  //     color: deepOrangeColor,
                  //     textColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //   ),
                  // ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: _animationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.deepOrange : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
