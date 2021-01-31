import 'package:Hunarmand_signIn_Ui/Widgets/bottomcontainer_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/commons/form_textfeild.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/my_orders.dart';
import 'package:flutter/material.dart';

class Postjob extends StatefulWidget {
  const Postjob({Key key}) : super(key: key);

  @override
  _PostjobState createState() => _PostjobState();
}

class _PostjobState extends State<Postjob> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
            padding: EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 6.0,
                        child: Container(
                          //height: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/icons/taskupload_icon.JPG',
                                  ),
                                  height: 80,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _textWidget(
                                  text:
                                      'If the service you are looking for is not in the list, describe it here relevant Hunarmand will help you',
                                  fontsize: 20.0,
                                  fontW: FontWeight.w600,
                                  fontcolor: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      _descriptionCard(),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _descriptionCard() {
    return Container(
      child: Column(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                FormInputFeild(
                  hintText: 'Enter job title',
                ),
                SizedBox(
                  height: 15.0,
                ),
                FormInputFeild(
                  hintText: 'Enter job Location',
                ),
                SizedBox(
                  height: 15.0,
                ),
                FormInputFeild(
                  hintText: 'Enter job Budget',
                ),
                SizedBox(
                  height: 15.0,
                ),
                FormInputFeild(
                  hintText: 'Enter job Detail',
                  feildHeight: 15,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          UploadImage(),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: ButtonWidget(
              btnText: 'Post',
              onClick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrders()));
              },
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
      ),
      textAlign: TextAlign.center,
    );
  }
}

// TextFormField(
//   decoration: InputDecoration(
//     // labelText: 'Title',
//     hintText: 'Enter job title',
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       //borderSide: new BorderSide(),
//     ),
//   ),
// ),

// SizedBox(
//   height: 20.0,
// ),
// TextFormField(
//   decoration: InputDecoration(
//     // labelText: 'Title',
//     hintText: 'Enter Job Budget',
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       //borderSide: new BorderSide(),
//     ),
//   ),
// ),

// SizedBox(
//   height: 20.0,
// ),
// TextFormField(
//   decoration: InputDecoration(
//     // labelText: 'Title',
//     hintText: 'Enter Job Location',
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       //borderSide: new BorderSide(),
//     ),
//   ),
// ),

// SizedBox(
//   height: 20.0,
// ),
// TextFormField(
//   decoration: InputDecoration(
//     //labelText: 'Description',

//     hintText: 'Enter Details here',
//     // helperMaxLines: 20,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       //borderSide: new BorderSide(),
//     ),
//   ),
//   // maxLength: 10,
//   maxLines: 8,
// ),
// SizedBox(
//   height: 100,
// ),
