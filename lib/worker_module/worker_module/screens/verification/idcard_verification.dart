import 'dart:io';
import 'package:Hunarmand_signIn_Ui/controllers/verification_provider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class ICardVerification extends StatefulWidget {
  final String uid;
  ICardVerification({this.uid});

  @override
  _ICardVerificationState createState() => _ICardVerificationState();
}

class _ICardVerificationState extends State<ICardVerification> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController cniccontroller = new TextEditingController();

  String cnicfurl;
  String cnicburl;
  String selfiurl;
  String cnic;
  File image;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final verificationprovider =
        Provider.of<VerificationProvider>(context, listen: false);
    final node = FocusScope.of(context);

    return Scaffold(
      key: _scaffoldKey,
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
            child: Form(
              key: _formKey,
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
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: cniccontroller,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => node.unfocus(),
                        decoration: InputDecoration(
                            hintText: 'Enter CNIC Number',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelText: 'CNIC Number'),
                        onChanged: (val) {
                          setState(() {
                            cnic = val;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter CNIC number';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  _cnicUpload(
                      btntext: 'Upload CNIC Front',
                      icon: FontAwesomeIcons.idCard,
                      imageUrl: cnicfurl,
                      onClick: () {
                        _showChoiceDialoge(context, 'cnicf');
                        //UploadImage();
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  _cnicUpload(
                      btntext: 'Upload CNIC Back',
                      icon: FontAwesomeIcons.idCard,
                      imageUrl: cnicburl,
                      onClick: () {
                        _showChoiceDialoge(context, 'cnicb');
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  _cnicUpload(
                      btntext: 'Upload Your Selfi',
                      imageUrl: selfiurl,
                      icon: FontAwesomeIcons.user,
                      onClick: () {
                        _showChoiceDialoge(context, 'selfi');
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.green,
                    child: Text('Save',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        verificationprovider.changeuserId = widget.uid;
                        verificationprovider.changecnicfront = cnicfurl;
                        verificationprovider.changecnicback = cnicburl;
                        verificationprovider.changeselfe = selfiurl;
                        verificationprovider.saveverification();
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text('data saved'),
                        //   duration: Duration(seconds: 3),
                        // ));
                      } else {
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: Text('Enter CNIC'),
                        //   duration: Duration(seconds: 3),
                        // ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cnicUpload(
      {String btntext, IconData icon, String imageUrl, var onClick}) {
    return Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.grey[200],
        child: imageUrl == null
            ? Column(
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
              )
            : Image.network(
                imageUrl,
                height: 200,
                width: 200,
              ));
  }

  // void demo() async {
  //   var pickedImage = await ImagePicker().getImage(
  //       source: ImageSource.gallery, //pick from device gallery
  //       maxWidth: 1920,
  //       maxHeight: 1200, //specify size and quality
  //       imageQuality: 80); //so image_picker will resize for you

  //   var anotherPickedImage = await ImagePicker().getImage(
  //       source: ImageSource.camera, //pick from camera
  //       maxWidth: 1920,
  //       maxHeight: 1200,
  //       imageQuality: 80);

  //   //upload and get download url
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child("unique_name.jpg"); //generate a unique name
  //   await ref.putFile(File(pickedImage.path)); //you need to add path here
  //   String imageUrl = await ref.getDownloadURL();

  //   // To use the image within your widgets:
  //   // Image.network(imageUrl);
  // }

  void openGallery(BuildContext context, String type) async {
    final picture = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      image = File(picture.path);
    });

    uploadImageToFirebase(image, context, type);
    Navigator.of(context).pop();
  }

  void openCamera(BuildContext context, String type) async {
    var picture = await picker.getImage(source: ImageSource.camera);
    setState(() {
      image = File(picture.path);
    });

    uploadImageToFirebase(image, context, type);
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialoge(BuildContext context, String type) {
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
                      openGallery(context, type);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      openCamera(context, type);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> uploadImageToFirebase(
      File _imagepath, BuildContext context, String type) async {
    final _storage = FirebaseStorage.instance;
    // final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);

    var fileName = Path.basename(_imagepath.toString());
    if (_imagepath != null) {
      var snapshot = await _storage
          .ref()
          .child('verificationImage/Idverification/$fileName')
          .putFile(_imagepath);
      if (type == 'cnicf') {
        String cnicf = await snapshot.ref.getDownloadURL();

        setState(() {
          cnicfurl = cnicf;
        });
      } else if (type == 'cnicb') {
        String cnicb = await snapshot.ref.getDownloadURL();
        setState(() {
          cnicburl = cnicb;
        });
      } else if (type == 'selfi') {
        String selfi = await snapshot.ref.getDownloadURL();

        setState(() {
          selfiurl = selfi;
        });
      }
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
