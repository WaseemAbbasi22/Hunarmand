//import 'dart:html';

import 'package:Hunarmand_signIn_Ui/Screens/duplicate/Home2.dart';
import 'package:Hunarmand_signIn_Ui/Screens/service_detail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/slider.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/header_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/home_header.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[390],
      body: Container(
        // color: ,
        // decoration: BoxDecoration(
        //   //color: Colors.white,
        //   // borderRadius: BorderRadius.circular(20.0),
        //   image: DecorationImage(
        //     image: AssetImage('assets/app_bg_2.JPG'),
        //     fit: BoxFit.fitHeight,
        //   ),
        // ),
        width: double.infinity,
        //height: double.infinity,
        //margin: EdgeInsets.only(left: 10),
        //color: Colors.red,

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            //,
            Cslider(),
            // HomeS(),

            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 20),
            //     child: Row(
            //       children: [
            //         _slider(
            //             color: Colors.grey,
            //             title: 'Electrican',
            //             subtitle: 'Highely trained'),
            //         _slider(
            //             color: Colors.blueGrey,
            //             title: 'Plumber',
            //             subtitle: 'Highely trained')
            //       ],
            //     ),
            //   ),
            // ),
            //HeaderContainer('Home'),
            //HomeHeaderContainer(),

            Container(
              //color: Colors.red,
              margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
              padding: EdgeInsets.only(left: 20.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Kia kaam krvana chaty han?',
                style: TextStyle(
                  color: Colors.grey[900],
                  //fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 4,
                crossAxisSpacing: 15,
                primary: false,
                crossAxisCount: 3,
                children: <Widget>[
                  _cardWidget(
                      image: 'assets/electriciank.png', text: 'Electrician'),
                  _cardWidget(image: 'assets/plumberk.png', text: 'Plumber'),
                  _cardWidget(
                      image: 'assets/carpenterk.png', text: 'Carpenter'),
                  _cardWidget(image: 'assets/painterk.png', text: 'Pinter'),
                  _cardWidget(image: 'assets/gardnerk.png', text: 'Gardner'),
                  _cardWidget(image: 'assets/gardnerk.png', text: 'Painter'),
                  _cardWidget(
                      image: 'assets/gardnerk.png', text: 'Electrician'),
                  _cardWidget(
                      image: 'assets/gardnerk.png', text: 'Electrician'),
                ],//hhhyiyyubbb jjhjh
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _slider(
      {@required Color color,
      @required String title,
      @required String subtitle}) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 15.0),
      padding: EdgeInsets.only(left: 10.0),
      height: 120,
      width: 240,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage('assets/electric_bg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.amber,
              fontSize: 19.0,
            ),
          )
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
