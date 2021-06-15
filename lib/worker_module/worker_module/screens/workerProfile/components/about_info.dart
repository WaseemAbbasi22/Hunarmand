import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class AboutInfo extends StatefulWidget {
  final String location;
  final String dob;
  AboutInfo({this.location, this.dob});

  @override
  _AboutInfoState createState() => _AboutInfoState();
}

class _AboutInfoState extends State<AboutInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.green,
        //padding: EdgeInsets.only(left: 20.0),
        width: MediaQuery.of(context).size.width,
        //height: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _rowWidget(
                      heading: 'LOCATION',
                      subheading: widget.location,
                      icon: Icons.place),
                  SizedBox(
                    height: 20.0,
                  ),
                  _rowWidget(
                      heading: 'DOB',
                      subheading: widget.dob,
                      icon: Icons.calendar_today),
                ],
              ),
            ),
          ],
        )
        // color: Colors.amber,

        );
  }

  Widget _rowWidget({String heading, String subheading, IconData icon}) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          icon,
          color: deepOrangeColor,
          size: 30,
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heading,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontFamily: 'Quicksand',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              subheading,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'Quicksand',
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
