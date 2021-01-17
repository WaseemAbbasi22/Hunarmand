//import 'dart:html';

import 'package:Hunarmand_signIn_Ui/Models/service_model.dart';
import 'package:Hunarmand_signIn_Ui/BusinessLogic/services.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/slider.dart';
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
    //Services service = new Services();
    return Scaffold(
      backgroundColor: Colors.grey[390],
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Cslider(),
            Container(
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 15,
                  // primary: false,
                  crossAxisCount: 3,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];

                  return _cardWidget(
                    service: service,
                    ontap: () {
                      Navigator.of(context).pushNamed('/services');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardWidget({@required Services service, var ontap}) {
    return InkWell(
      onTap: ontap,
      child: Card(
        color: Colors.grey[395],
        elevation: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(
                service.serviceImage,
              ),
              height: 80.0,
              //width: 150.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(service.title,
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
  // Widget _slider(
  //     {@required Color color,
  //     @required String title,
  //     @required String subtitle}) {
  //   return Container(
  //     margin: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0, bottom: 15.0),
  //     padding: EdgeInsets.only(left: 10.0),
  //     height: 120,
  //     width: 240,
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.circular(10.0),
  //       image: DecorationImage(
  //         image: AssetImage('assets/electric_bg.jpg'),
  //         fit: BoxFit.fill,
  //       ),
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(top: 50.0),
  //           child: Text(
  //             title,
  //             style: TextStyle(
  //               fontSize: 22.0,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 5.0,
  //         ),
  //         Text(
  //           subtitle,
  //           style: TextStyle(
  //             color: Colors.amber,
  //             fontSize: 19.0,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
