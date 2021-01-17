import 'package:Hunarmand_signIn_Ui/BusinessLogic/services.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/slider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClipperDesign extends StatefulWidget {
  ClipperDesign({Key key}) : super(key: key);

  @override
  _ClipperDesignState createState() => _ClipperDesignState();
}

class _ClipperDesignState extends State<ClipperDesign>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0,
      duration: Duration(seconds: 20),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return ClipPath(
                    clipper: DrawClip(_controller.value),
                    child: Container(
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              bluegrayColors,
                              bluegrayLightColor,
                            ]),
                      ),
                    ),
                  );
                },
              ),

              // Container(
              //   margin: EdgeInsets.only(top: 60.0),
              //   child: Card(
              //     color: Colors.grey[200],
              //     elevation: 4.0,
              //     child: Container(
              //       padding: EdgeInsets.all(30.0),
              //       child: Text(
              //         'Popular Services',
              //         style: TextStyle(
              //           color: Colors.grey[900],
              //           //fontWeight: FontWeight.bold,
              //           fontSize: 20.0,
              //           letterSpacing: 0.5,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Cslider(),
            ],
          ),
          Container(
            //margin: EdgeInsets.only(top: 10.0),
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'kia kaam karvana chaty han?',
                style: TextStyle(
                  color: Colors.grey[900],
                  //fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  // primary: false,
                  crossAxisCount: 3,
                ),
                // itemCount: ,
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return _cardWidget(
                      image: service.serviceImage, text: service.title);
                }),
          ),
          //Expanded(child: Home()),
        ],
      ),
    );
  }

  Widget _cardWidget({String image, String text}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/services');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          color: Colors.grey[200],
          elevation: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                  image,
                ),
                height: 80.0,
                //width: 150.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(text,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.2 + (size.width * 0.4 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.6 + 50 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
