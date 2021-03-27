import 'dart:io';
// import 'package:Hunarmand_signIn_Ui/controllers/postjob_controller.dart';
import 'package:flutter/material.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';

class UploadingImage {
  File image;
  String imageUrl;
  // final jobProvider = Provider.of<PostedJobProvider>(BuildContext context);

  ImagePicker picker = ImagePicker();
  void openGallery(BuildContext context) async {
    final picture = await picker.getImage(source: ImageSource.gallery);
    image = File(picture.path);
    // setState(){

    // }
    uploadImageToFirebase(image);
    Navigator.of(context).pop();
  }

  void openCamera(BuildContext context) async {
    var picture = await picker.getImage(source: ImageSource.camera);
    image = File(picture.path);

    uploadImageToFirebase(image);
    Navigator.of(context).pop();
  }

  Future uploadImageToFirebase(File _imagepath) async {
    final _storage = FirebaseStorage.instance;

    var fileName = Path.basename(_imagepath.toString());
    if (_imagepath != null) {
      var snapshot = await _storage
          .ref()
          .child('posted_jobs/$fileName')
          .putFile(_imagepath);
      imageUrl = await snapshot.ref.getDownloadURL();

      // if (imageUrl != null) {
      //   // PostJobController _controller = PostJobController();
      //   _controller.setUrl(imageUrl);
      // }
      print(imageUrl);
      return imageUrl;
    } else {
      print('something wrong');
    }
  }
}
