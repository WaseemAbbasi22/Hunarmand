// import 'package:Hunarmand_signIn_Ui/BusinessLogic/uplaod_image.dart';
// import 'package:Hunarmand_signIn_Ui/utils/color.dart';
// import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';

// UploadingImage _uploadingImage = UploadingImage();

// class UploadImage extends StatefulWidget {
//   @override
//   _UploadImageState createState() => _UploadImageState();
// }

// class _UploadImageState extends State<UploadImage> {
//   Future<void> _showChoiceDialoge(BuildContext context) {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             title: Text('Make a Choice'),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   // IconButton(icon: Icon(Icons.photo_album), onPressed: (){

//                   // },),
//                   GestureDetector(
//                     child: Text('Gallery'),
//                     onTap: () {
//                       _uploadingImage.openGallery(context);
//                     },
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                   ),
//                   GestureDetector(
//                     child: Text('Camera'),
//                     onTap: () {
//                       _uploadingImage.openCamera(context);
//                     },
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   Widget _imageDisplay() {
//     final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);

//     if (_uploadingImage.image != null) {
//       return Image.file(_uploadingImage.image, width: 100, height: 100);
//     } else {
//       return Container(
//         color: Colors.grey[300],
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: Text(
//                 'UPLOAD IMAGE',
//                 style: TextStyle(
//                     color: Colors.blueGrey,
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w800),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Center(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.add_a_photo,
//                   size: 40.0,
//                   color: deepOrangelightColor,
//                 ),
//                 onPressed: () {
//                   _showChoiceDialoge(context);
//                 },
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }

//   // Future getImage(int type) async {
//   //   final pickedFile = await picker.getImage(source: ImageSource.camera);
//   //   setState(() {
//   //     if (pickedFile != null) {
//   //       _image = File(pickedFile.path);
//   //     } else {
//   //       print('No image selected.');
//   //     }
//   //   });
//   // }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     // _uploadingImage.image.delete();
//     _uploadingImage.image = null;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 290.0),
//       //color: Colors.amber,
//       color: Colors.grey[300],
//       //height: 100,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           _imageDisplay(),
//           SizedBox(
//             height: 10.0,
//           ),
//         ],
//       ),
//     );
//   }
// }
