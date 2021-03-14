import 'dart:io';
//import 'package:image_picker/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File _image;

class UploadImage extends StatefulWidget {
  UploadImage({Key key}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  ImagePicker picker = ImagePicker();
  _openGallery(BuildContext context) async {
    final picture = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(picture.path);
    });
    Navigator.of(context).pop();
  }

  // Future uploadImageToFirebase(BuildContext context) async {
  //   String fileName = basename(_imageFile.path);
  //   StorageReference firebaseStorageRef =
  //       FirebaseStorage.instance.ref().child('uploads/$fileName');
  //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
  //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
  //   taskSnapshot.ref.getDownloadURL().then(
  //         (value) => print("Done: $value"),
  //       );
  // }

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
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _imageDisplay() {
    if (_image == null) {
      return InkWell(
        onTap: () {
          _showChoiceDialoge(context);
        },
        child: Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'UPLOAD IMAGE',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add_a_photo,
                    size: 40.0,
                    color: deepOrangelightColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Image.file(_image, width: 100, height: 100);
    }
  }

  // Future getImage(int type) async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 290.0),
      //color: Colors.amber,
      color: Colors.grey[300],
      //height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _imageDisplay(),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
    ;
  }
}
