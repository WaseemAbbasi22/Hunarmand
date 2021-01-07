//import 'dart:html';

import 'package:Hunarmand_signIn_Ui/BusinessLogic/services.dart';
import 'package:Hunarmand_signIn_Ui/Models/service_model.dart';
import 'package:Hunarmand_signIn_Ui/Screens/service_detail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeS extends StatefulWidget {
  HomeS({Key key}) : super(key: key);

  @override
  _HomeSState createState() => _HomeSState();
}

class _HomeSState extends State<HomeS> {
  @override
  Widget build(BuildContext context) {
    final double padding = 8.0;
    return Scaffold(
      //backgroundColor: Color(0xFF81F2836),

      body: Container(
        color: Color.fromRGBO(222, 235, 249, 0.8),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/app_bg_2.JPG'),
        //     fit: BoxFit.cover,
        //   ),
        //   gradient: LinearGradient(colors: [
        //     Color.fromRGBO(122, 163, 167, 1),
        //     Color.fromRGBO(215, 173, 126, 1)
        //   ], end: Alignment.centerLeft, begin: Alignment.centerRight),
        // ),
        child: Stack(
          children: <Widget>[
            Cslider(),
            Container(
              margin: EdgeInsets.only(top: 300.0),
              child: GridView.builder(
                padding: EdgeInsets.all(padding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 3,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];

                  return buildCard(service: service);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard({@required Services service}) => GestureDetector(
        onDoubleTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ServiceDetail()));
        },
        onTapDown: (_) => setTapped(service, isTapped: true),
        onTapUp: (_) => setTapped(service, isTapped: false),
        onTapCancel: () => setTapped(service, isTapped: false),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: service.color,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 800),
                  opacity: service.isTapped ? 1 : 0.5,
                  child: Image.asset(service.serviceImage, fit: BoxFit.cover),
                ),
              ),
              if (!service.isTapped)
                Center(
                  child: Text(
                    service.title,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      );

  void setTapped(Services item, {@required bool isTapped}) {
    setState(() {
      services = services
          .map((otherItem) =>
              item == otherItem ? item.copy(isTapped: isTapped) : otherItem)
          .toList();
    });
  }
}
