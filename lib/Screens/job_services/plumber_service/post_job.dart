import 'package:Hunarmand_signIn_Ui/BusinessLogic/uplaod_image.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/input_card.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/bottomcontainer_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/commons/form_textfeild.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User _loginUser = _auth.currentUser;

class Postjob extends StatefulWidget {
  const Postjob({Key key}) : super(key: key);

  @override
  _PostjobState createState() => _PostjobState();
}

class _PostjobState extends State<Postjob> {
  final _formkey = GlobalKey<FormState>();
  String title;
  String location;
  String budget;
  String detail;
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
                                child: Text(
                                  'If the service you are looking for is not in the list, describe it here relevant Hunarmand will help you',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
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
                InputCard(
                  hintText: 'Enter job title',
                  onChange: (val) {
                    title = val;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputCard(
                  hintText: 'Enter job Location',
                  onChange: (val) {
                    location = val;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputCard(
                  hintText: 'Enter job budget',
                  onChange: (val) {
                    budget = val;

                    // print(budget);
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputCard(
                  maxline: 8,
                  hintText: 'Enter decription',
                  onChange: (val) {
                    detail = val;
                  },
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
          //UploadingImage(),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: ButtonWidget(
              btnText: 'Post',
              onClick: () {
                try {
                  _firestore
                      .collection('posted_projects')
                      .add({
                        'title': title,
                        'location': location,
                        'budget': budget,
                        'detail': detail,
                        'imageurl': "not avaliable",
                        'posted_by': _loginUser.email,
                        'posterurl': "nill"
                      })
                      .then((value) => print("job Added"))
                      .catchError(
                          (error) => print("Failed to add job: $error"));
                } catch (e) {
                  print(e);
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrders()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
