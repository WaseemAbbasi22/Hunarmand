import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class PostedJobDetail extends StatefulWidget {
  @override
  _PostedJobDetailState createState() => _PostedJobDetailState();
}

class _PostedJobDetailState extends State<PostedJobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(posted_job[1].imageUrl), fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                      // Row(
                      //   children: <Widget>[
                      //     SvgPicture.asset("assets/images/heart_icon.svg"),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     SvgPicture.asset("assets/images/share_icon.svg"),
                      //   ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.45),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(blurRadius: 6.0, color: Colors.grey)
                        ]),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Job Budget Estimated',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            Text(
                              posted_job[1].budget,
                              style: TextStyle(
                                  color: deepOrangeColor,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: deepOrangeColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    posted_job[1].detail,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(workers[1].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "POSTED BY",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            workers[1].name,
                            style: TextStyle(
                              fontSize: 14,
                              color: deepOrangeColor,
                              fontFamily: 'Quicksand',
                              letterSpacing: 1.5,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '1 HOUR AGO',
                        style: TextStyle(
                          fontSize: 14,
                          color: deepOrangeColor,
                          fontFamily: 'Quicksand',
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text("Interior"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text("40m2"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text("Ideas"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nobody wants to stare at a blank wall all day long, which is why wall art is such a crucial step in the decorating process. And once you start brainstorming, the rest is easy. From gallery walls to DIY pieces like framing your accessories and large-scale photography, we've got plenty of wall art ideas to spark your creativity. And where better to look for inspiration that interior designer-decorated walls",
                    style: TextStyle(height: 1.6),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     image: DecorationImage(
                            //         image:
                            //             AssetImage("assets/images/image_2.png"),
                            //         fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     image: DecorationImage(
                            //         image:
                            //             AssetImage("assets/images/image_3.png"),
                            //         fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: 150,
                            height: 150,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     image: DecorationImage(
                            //         image:
                            //             AssetImage("assets/images/image_4.png"),
                            //         fit: BoxFit.cover)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
// import 'package:Hunarmand_signIn_Ui/utils/color.dart';
// import 'package:flutter/material.dart';

// class PostedJobDetail extends StatefulWidget {
//   PostedJobDetail({Key key}) : super(key: key);

//   @override
//   _PostedJobDetailState createState() => _PostedJobDetailState();
// }

// class _PostedJobDetailState extends State<PostedJobDetail> {
//   @override
//   Widget build(BuildContext context) {
//     //PostedJob posted_job = new PostedJob();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: deepOrangeColor,
//         elevation: 0,
//         title: Text("HUNARMAND"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.notifications,
//               color: Colors.white,
//             ),
//             onPressed: () => {},
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           Container(
//             alignment: Alignment(0.0, -0.40),
//             height: 60.0,
//             color: Colors.white,
//             child: Text(
//               'Job Detail',
//               style: TextStyle(
//                   fontFamily: 'Montserrat',
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0.0),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20.0),
//                 boxShadow: [BoxShadow(blurRadius: 6.0, color: Colors.grey)]),
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Job Budget Estimated',
//                     style: TextStyle(
//                         color: Colors.grey,
//                         fontFamily: 'Quicksand',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     posted_job[1].budget,
//                     style: TextStyle(
//                         color: Colors.deepOrange,
//                         fontFamily: 'Quicksand',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 40.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 12.0),
//             child: Text(
//               posted_job[1].detail,
//               style: TextStyle(
//                   color: Colors.grey[700],
//                   fontFamily: 'Quicksand',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25.0),
//             ),
//           ),
//           Container(
//             color: Colors.grey[500],
//             child: Column(
//               children: [
//                 Container(child:
//                 Row(children: [
//                   Row(children: [

//                   ],)
//                 ],)
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
