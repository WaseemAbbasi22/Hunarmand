import 'dart:io';
// import 'package:Hunarmand_signIn_Ui/controllers/postjob_controller.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class UploadingImage extends StatefulWidget {
  UploadingImage({Key key}) : super(key: key);

  @override
  _UploadingImageState createState() => _UploadingImageState();
}

class _UploadingImageState extends State<UploadingImage> {
  File image;
  String imageUrl;
  // final jobProvider = Provider.of<PostedJobProvider>(BuildContext context);

  ImagePicker picker = ImagePicker();
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

  Future uploadImageToFirebase(File _imagepath, BuildContext context) async {
    final _storage = FirebaseStorage.instance;
    final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);

    var fileName = Path.basename(_imagepath.toString());
    if (_imagepath != null) {
      var snapshot =
          await _storage.ref().child('jobImages/$fileName').putFile(_imagepath);

      imageUrl = await snapshot.ref.getDownloadURL();
      jobProvider.changeimageurl = imageUrl;
      // if (imageUrl != null) {
      //   // PostJobController _controller = PostJobController();
      //   _controller.setUrl(imageUrl);
      // }
      print('image url from upload function is......');
      print(imageUrl);
      print('image url from provider  function is......');
      print(imageUrl);
      return imageUrl;
    } else {
      print('something wrong');
    }
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

  Widget _imageDisplay() {
    // final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);

    if (image != null) {
      return Image.file(image, width: 100, height: 100);
    } else {
      return Container(
        width: 100,
        color: Colors.grey[300],
        padding: EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'UPLOAD IMAGE',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w800),
                // textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            IconButton(
              icon: Icon(
                Icons.add_a_photo,
                size: 40.0,
                color: deepOrangelightColor,
              ),
              onPressed: () {
                _showChoiceDialoge(context);
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 250.0),
      //color: Colors.amber,
      color: Colors.grey[300],
      //height: 100,
      child: _imageDisplay(),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [

      //     SizedBox(
      //       height: 10.0,
      //     ),
      //   ],
      // ),
    );
  }
}
// class UploadingImage {
//   File image;
//   String imageUrl;
//   // final jobProvider = Provider.of<PostedJobProvider>(BuildContext context);

//   ImagePicker picker = ImagePicker();
//   void openGallery(BuildContext context) async {
//     final picture = await picker.getImage(source: ImageSource.gallery);

//     image = File(picture.path);

//     uploadImageToFirebase(image, context);
//     Navigator.of(context).pop();
//   }

//   void openCamera(BuildContext context) async {
//     var picture = await picker.getImage(source: ImageSource.camera);
//     image = File(picture.path);

//     uploadImageToFirebase(image, context);
//     Navigator.of(context).pop();
//   }

//   Future uploadImageToFirebase(File _imagepath, BuildContext context) async {
//     final _storage = FirebaseStorage.instance;
//     final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);

//     var fileName = Path.basename(_imagepath.toString());
//     if (_imagepath != null) {
//       var snapshot = await _storage
//           .ref()
//           .child('posted_jobs/$fileName')
//           .putFile(_imagepath);

//       imageUrl = await snapshot.ref.getDownloadURL();
//       jobProvider.changeimageurl = imageUrl;
//       // if (imageUrl != null) {
//       //   // PostJobController _controller = PostJobController();
//       //   _controller.setUrl(imageUrl);
//       // }
//       print(imageUrl);
//       return imageUrl;
//     } else {
//       print('something wrong');
//     }
//   }
// }
