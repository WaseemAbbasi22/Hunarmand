import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/commons/ridial_image.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/workerProfile/components/about_info.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/workerProfile/components/contact_info.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/workerProfile/edit_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: followButton(),
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: deepOrangeColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => EditProfilePage()));
            },
          )
        ],
      ),
      body: Stack(
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
                Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: MediaQuery.of(context).size.height / 16.0,
                    child: RoundedImage(
                        imagePath: 'assets/images/user_avatar.png')),
                SizedBox(
                  height: 18.0,
                ),
                Center(
                  child: Text(
                    workers[1].name,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    workers[1].category,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Card(
                  //color: Colors.grey[300],
                  elevation: 6.0,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    // color: Colors.brown,
                    child: Column(
                      children: [
                        Divider(
                          height: 30.0,
                          color: Colors.black,
                          // indent: 30,
                          // endIndent: 30,
                        ),
                        Container(
                          width: 350.0,
                          height: 60.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _jobdetailinfo(
                                  heading: '12',
                                  subheading: 'Total Jobs',
                                  hColor: Colors.blueAccent),
                              VerticalDivider(
                                width: 50.0,
                                color: Colors.black,
                              ),
                              _jobdetailinfo(
                                  heading: '6',
                                  subheading: 'Completed',
                                  hColor: Colors.amber),
                              VerticalDivider(
                                width: 50.0,
                                color: Colors.black,
                              ),
                              _jobdetailinfo(
                                  heading: '6',
                                  subheading: 'Pending',
                                  hColor: Colors.green),
                            ],
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  height: 15,
                  color: Colors.grey,
                ),
                AboutInfo(),
                Divider(
                  height: 15,
                  color: Colors.grey,
                ),
                ContactInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _jobdetailinfo({String heading, String subheading, Color hColor}) {
    return Column(
      children: <Widget>[
        Text(
          heading,
          style: TextStyle(
            color: hColor,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          subheading,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
