import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/commons/form_textfeild.dart';
import 'package:Hunarmand_signIn_Ui/commons/ridial_image.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: followButton(),
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: deepOrangeColor,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                color: deepOrangeColor,
              ),
              clipper: GetClipper(),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      RoundedImage(imagePath: 'assets/images/user_avatar.png'),
                      Positioned(
                        top: 40.0,
                        right: 5.0,
                        child: InkWell(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => UploadImage()));
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Form(
                      child: Column(
                        children: [
                          FormInputFeild(
                            hintText: 'My Name',
                            labelText: 'Name',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormInputFeild(
                            hintText: 'My Skill',
                            labelText: 'Skill',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormInputFeild(
                            hintText: 'My Mobile Number',
                            labelText: 'Mobile Number',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormInputFeild(
                            hintText: 'My Email Address',
                            labelText: 'Email Address',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormInputFeild(
                            hintText: 'My CNIC Number',
                            labelText: 'CNIC Number',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormInputFeild(
                            hintText: 'My Location',
                            labelText: 'Location',
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          FormInputFeild(
                            hintText: 'Description',
                            //labelText: 'Description',
                            feildHeight: 10,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonWidget(
                      btnText: 'UPDATE',
                      onClick: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 20.0,
                  ),

                  // ContactInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height / 3.2);
    path.lineTo(size.width + 115.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
