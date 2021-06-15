import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/verification/idcard_verification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IdVerification extends StatefulWidget {
  final String uid;
  IdVerification({this.uid});

  @override
  _IdVerificationState createState() => _IdVerificationState();
}

class _IdVerificationState extends State<IdVerification> {
  bool emailVerified = true;
  bool cnicVerified = false;
  bool phoneVerified = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifications'),
        centerTitle: true,
        backgroundColor: deepOrangeColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID Verifications',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            _idsContainer(
                heading: 'Email',
                subheading:
                    'Verify email so that you can \nget instant tasks notifications',
                varible: emailVerified,
                verify: true,
                icon: Icons.email),
            _idsContainer(
                heading: 'Phone No',
                subheading:
                    'Verify phone so that you can \nget instant tasks notifications',
                varible: phoneVerified,
                verify: true,
                icon: Icons.phone),
            _idsContainer(
                heading: 'CNIC',
                subheading:
                    'Verify CNIC so that you are\n included in trused workers',
                varible: cnicVerified,
                icon: FontAwesomeIcons.idCard,
                verify: false,
                onClick: () {
                  if (!cnicVerified) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ICardVerification(uid: widget.uid)));
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _textWidget({String text}) {
    return Text(text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  }

  Widget _idsContainer(
      {String heading,
      String subheading,
      IconData icon,
      bool varible,
      bool verify,
      var onClick}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: deepOrangeColor,
                size: 30.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(heading,
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    subheading,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        height: 1.2,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                width: 5.0,
              ),
              Stack(children: [
                RaisedButton(
                  color: varible ? Colors.grey : deepOrangeColor,
                  child: varible
                      ? _textWidget(
                          text: 'Verified',
                        )
                      : _textWidget(text: 'Add'),
                  onPressed: onClick,
                ),
                Visibility(
                  visible: verify,
                  child: Positioned(
                    right: 0.0,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 30.0,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 30.0,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
