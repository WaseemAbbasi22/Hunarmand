import 'dart:io';

import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/user.dart';
import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/Service/firestore_service.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/commons/form_textfeild.dart';
import 'package:Hunarmand_signIn_Ui/commons/ridial_image.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart' as Path;

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  final String uid;
  EditProfilePage({this.uid});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File image;
  ImagePicker picker = ImagePicker();
  String imgurl =
      "https://w7.pngwing.com/pngs/639/452/png-transparent-computer-icons-avatar-user-profile-people-icon-child-face-heroes.png";
  String name;
  String emial;
  String mobileno;
  String location;
  String cnic;
  String skill;
  // FirestoreService firestoreService = ;
  @override
  @override
  void initState() {
    super.initState();
    print(widget.uid);
  }

  Widget build(BuildContext context) {
    final workerprovider = Provider.of<WorkerProvider>(context, listen: false);
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
              child: StreamBuilder<Worker>(
                  stream: FirestoreService(uid: widget.uid).userData,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text("Loading...");
                      default:
                        Worker user = snapshot.data;
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                RoundedImage(
                                    // imgtype: user.imageUrl != null ? true : false,
                                    size: Size.fromRadius(80),
                                    imagePath: user.imageUrl != ""
                                        ? user.imageUrl
                                        : imgurl),
                                Positioned(
                                  top: 40.0,
                                  right: 5.0,
                                  child: InkWell(
                                    onTap: () {
                                      _showChoiceDialoge(context);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    // onTap: () {
                                    //   showModalBottomSheet(
                                    //       context: context,
                                    //       builder: ((builder) => UploadImage()));
                                    // },
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
                                      initialvalue: user.name ?? '',
                                      hintText: 'My Name',
                                      labelText: 'Name',
                                      onvalchange: (val) {
                                        setState(() {
                                          name = val;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    FormInputFeild(
                                      initialvalue: user.skill ?? '',
                                      hintText: 'My Skill',
                                      labelText: 'Skill',
                                      onvalchange: (val) {
                                        setState(() {
                                          skill = val;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    // FormInputFeild(
                                    //   initialvalue: user.mobileNo ?? '',
                                    //   hintText: 'My Mobile Number',
                                    //   labelText: 'Mobile Number',
                                    // ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    FormInputFeild(
                                      initialvalue: user.email ?? '',
                                      hintText: 'My Email Address',
                                      labelText: 'Email Address',
                                      onvalchange: (val) {
                                        setState(() {
                                          emial = val;
                                        });
                                      },
                                    ),
                                    FormInputFeild(
                                      initialvalue: user.mobileNo ?? '',
                                      hintText: 'My Mobile Number',
                                      labelText: 'Mobile Number',
                                      readonly: true,
                                      // onvalchange: (val) {
                                      //   setState(() {
                                      //     emial = val;
                                      //   });
                                      // },
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    FormInputFeild(
                                      initialvalue: user.cnic ?? 'cnic',
                                      hintText: 'My CNIC Number',
                                      labelText: 'CNIC Number',
                                      onvalchange: (val) {
                                        setState(() {
                                          cnic = val;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    FormInputFeild(
                                      initialvalue: user.location ?? 'location',
                                      hintText: 'My Location',
                                      labelText: 'Location',
                                      onvalchange: (val) {
                                        setState(() {
                                          location = val;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    // FormInputFeild(
                                    //   hintText: 'Description',
                                    //   //labelText: 'Description',
                                    //   feildHeight: 10,
                                    // ),
                                    // SizedBox(
                                    //   height: 10.0,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            ButtonWidget(
                                btnText: 'UPDATE',
                                onClick: () {
                                  name != null
                                      ? workerprovider.changename = name
                                      : workerprovider.changename = user.name;
                                  cnic != null
                                      ? workerprovider.changecnic = cnic
                                      : workerprovider.changecnic = user.cnic;
                                  emial != null
                                      ? workerprovider.changeemail = emial
                                      : workerprovider.changeemail = user.email;
                                  imgurl != null
                                      ? workerprovider.changeimgurl = imgurl
                                      : workerprovider.changeimgurl =
                                          user.imageUrl;
                                  skill != null
                                      ? workerprovider.changeskill = skill
                                      : workerprovider.changeskill = user.skill;
                                  location != null
                                      ? workerprovider.changeloction = location
                                      : workerprovider.changeloction =
                                          user.location;
                                  workerprovider.changephoneno = user.mobileNo;
                                  workerprovider.updateworkers(widget.uid);
                                  // print('image url is');
                                  // print(imgurl);
                                  Navigator.pop(context);
                                }),
                            SizedBox(
                              height: 20.0,
                            ),

                            // ContactInfo(),
                          ],
                        );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void openGallery(BuildContext context) async {
    final picture = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      image = File(picture.path);
    });

    uploadImageToFirebase(image, context);
    Navigator.of(context).pop();
  }

  void openCamera(BuildContext context) async {
    var picture = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(picture.path);
    });

    uploadImageToFirebase(image, context);
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialoge(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text('Make a Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  // IconButton(icon: Icon(Icons.photo_album), onPressed: (){

                  // },),
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> uploadImageToFirebase(
      File _imagepath, BuildContext context) async {
    final _storage = FirebaseStorage.instance;
    // final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);

    var fileName = _imagepath.toString();
    if (_imagepath != null) {
      var snapshot = await _storage
          .ref()
          .child('WorkerImage/Idverification/$fileName')
          .putFile(_imagepath);
      String img = await snapshot.ref.getDownloadURL();

      setState(() {
        imgurl = img;
      });

      // imageUrl = await snapshot.ref.getDownloadURL();
      // jobProvider.changeimageurl = imageUrl;
      // if (imageUrl != null) {
      //   // PostJobController _controller = PostJobController();
      //   _controller.setUrl(imageUrl);
      // }
      // print('image url from upload function is......');
      // print(imageUrl);
      // print('image url from provider  function is......');
      // print(imageUrl);
      // return imageUrl;
    } else {
      print('something wrong');
    }
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
