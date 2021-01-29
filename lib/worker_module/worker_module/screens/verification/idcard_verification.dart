import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/commons/form_textfeild.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ICardVerification extends StatefulWidget {
  ICardVerification({Key key}) : super(key: key);

  @override
  _ICardVerificationState createState() => _ICardVerificationState();
}

class _ICardVerificationState extends State<ICardVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('CNIC verification'),
          backgroundColor: deepOrangeColor,
          centerTitle: true),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CNIC Verifications',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Verify your CNIC so that you can send offers to the customers',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FormInputFeild(
                  hintText: 'Enter CNIC Number',
                ),
                SizedBox(
                  height: 20.0,
                ),
                _cnicUpload(
                    btntext: 'Upload CNIC Front',
                    icon: FontAwesomeIcons.idCard,
                    onClick: () {
                      //UploadImage();
                    }),
                SizedBox(
                  height: 20.0,
                ),
                _cnicUpload(
                    btntext: 'Upload CNIC Back',
                    icon: FontAwesomeIcons.idCard,
                    onClick: () {}),
                SizedBox(
                  height: 20.0,
                ),
                _cnicUpload(
                    btntext: 'Upload Your Selfi',
                    icon: FontAwesomeIcons.user,
                    onClick: () {}),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text('Save',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _cnicUpload({String btntext, IconData icon, var onClick}) {
    return Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.grey[200],
        child: Column(
          children: [
            Center(
                child: Icon(
              icon,
              size: 100,
              color: Colors.grey,
            )),
            SizedBox(height: 10.0),
            RaisedButton(
              color: deepOrangeColor,
              child: Text(btntext,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: onClick,
            ),
          ],
        ));
  }
}
