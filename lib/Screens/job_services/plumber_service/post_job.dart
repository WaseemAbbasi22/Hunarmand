import 'package:Hunarmand_signIn_Ui/Widgets/bottomcontainer_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class Postjob extends StatelessWidget {
  const Postjob({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //       colors: [orangeColors, orangeLightColors],
          //       end: Alignment.centerLeft,
          //       begin: Alignment.centerRight),
          //   image: DecorationImage(
          //     image: AssetImage(
          //       'assets/app_bg_2.JPG',
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // margin: EdgeInsets.only(top: 10.0),
          //color: Colors.grey,
          child: Container(
        //margin: EdgeInsets.only(top: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Card(
                    color: Colors.white,
                    //elevation: 4.0,
                    child: Container(
                      // margin: EdgeInsets.only(top: 5.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
                      // padding: EdgeInsets.only(top: 10.0, left: 20.0),
                      height: 170,
                      //color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: 5.0,
                          // ),
                          Image(
                            image: AssetImage(
                              'assets/iconjob.jpg',
                            ),
                            height: 60,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: _textWidget(
                              text:
                                  'If the service you are looking for is not in the list, describe it here relevant Hunarmand will help you',
                              fontsize: 20.0,
                              fontW: FontWeight.normal,
                              fontcolor: Colors.grey[800],
                            ),
                          ),

                          // _textWidget(
                          //     text: 'not in the list, describe it here relevant',
                          //     fontsize: 20.0,
                          //     fontW: FontWeight.normal,
                          //     fontcolor: Colors.grey[800]),

                          // Text(
                          //   'not in the list, describe it here relevant',
                          //   style: TextStyle(
                          //     color: Colors.grey[800],
                          //     fontSize: 20.0,
                          //     letterSpacing: 0.5,
                          //     //wordSpacing: 3.8,
                          //   ),
                          // ),
                          // Text(
                          //   ' Hunarmand will help you',
                          //   style: TextStyle(
                          //     color: Colors.grey[800],
                          //     fontSize: 20.0,
                          //     letterSpacing: 0.5,
                          //     //wordSpacing: 3.8,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  _descriptionCard(),
                  SizedBox(height: 10.0),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget _descriptionCard() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.white, offset: Offset(10, 30), blurRadius: 30.0),
      ]),
      padding: EdgeInsets.all(15.0),
      //color: Colors.white,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              // labelText: 'Title',
              hintText: 'Enter job title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                //borderSide: new BorderSide(),
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              // labelText: 'Title',
              hintText: 'Enter Job Budget',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                //borderSide: new BorderSide(),
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              // labelText: 'Title',
              hintText: 'Enter Job Location',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                //borderSide: new BorderSide(),
              ),
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              //labelText: 'Description',

              hintText: 'Enter Details here',
              // helperMaxLines: 20,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                //borderSide: new BorderSide(),
              ),
            ),
            // maxLength: 10,
            maxLines: 8,
          ),
          // SizedBox(
          //   height: 100,
          // ),
          SizedBox(
            height: 10.0,
          ),
          UploadImage(),

          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: ButtonWidget(
              btnText: 'Post',
              onClick: () => {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _textWidget({
    String text,
    double fontsize,
    Color fontcolor,
    FontWeight fontW,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: fontcolor,
        fontSize: fontsize,
        letterSpacing: 0.5,
        fontWeight: fontW,

        //wordSpacing: 3.8,
      ),
    );
  }
}
