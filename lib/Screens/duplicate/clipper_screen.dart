import 'package:Hunarmand_signIn_Ui/Screens/HomeScreen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/service_detail_screen.dart';
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
      backgroundColor: Colors.white,
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
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [Colors.orange[700], Colors.orange[300]]),
                      ),
                    ),
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Card(
                  color: Colors.grey[200],
                  elevation: 4.0,
                  child: Container(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      'Popular Services',
                      style: TextStyle(
                        color: Colors.grey[900],
                        //fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: GridView.count(
              mainAxisSpacing: 4,
              crossAxisSpacing: 15,
              primary: false,
              crossAxisCount: 2,
              children: <Widget>[
                _cardWidget(
                    image: 'assets/electriciank.png', text: 'Electrician'),
                _cardWidget(image: 'assets/plumberk.png', text: 'Plumber'),
                _cardWidget(image: 'assets/carpenterk.png', text: 'Carpenter'),
                _cardWidget(image: 'assets/painterk.png', text: 'Pinter'),
                _cardWidget(image: 'assets/gardnerk.png', text: 'Gardner'),
                _cardWidget(image: 'assets/gardnerk.png', text: 'Painter'),
                _cardWidget(image: 'assets/gardnerk.png', text: 'Electrician'),
                _cardWidget(image: 'assets/gardnerk.png', text: 'Electrician'),
              ], //hhhyiyyubbb jjhjh
            ),
          ),
          //Expanded(child: Home()),
        ],
      ),
    );
  }

  Widget _cardWidget({String image, String text}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ServiceDetail()));
      },
      child: Card(
        color: Colors.grey[395],
        elevation: 2,
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
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ))
          ],
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
