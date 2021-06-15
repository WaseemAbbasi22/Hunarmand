import 'dart:convert';

import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/joboffers/job_offers.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/make_offer.dart';
import 'package:flutter/material.dart';

class PostedJobDetail extends StatefulWidget {
  final Jobs jobs;
  final String showScreen;
  PostedJobDetail({this.jobs, this.showScreen});

  @override
  _PostedJobDetailState createState() => _PostedJobDetailState();
}

class _PostedJobDetailState extends State<PostedJobDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String url;
  String jobtype;
  bool toogleimgcontainer = false;
  @override
  void initState() {
    super.initState();
    print(widget.showScreen);
    url = widget.jobs.imageUrl;
    jobtype = widget.jobs.jobtype;
    // if (jobtype == 'Other') {
    //   toogleimgcontainer = true;
    // }
    print('Image url is .............');
    print(url);
  }

  String btnText = 'MAKE OFFER';
  bool offerboxshow = false;
  bool btnshow = false;
  bool allOfferbtn = false;
  @override
  Widget build(BuildContext context) {
    if (widget.showScreen == 'worker') {
      setState(() {
        btnshow = true;
      });
    } else if (widget.showScreen == 'client') {
      setState(() {
        allOfferbtn = true;
      });
    }
    setState(() {
      url = widget.jobs.imageUrl;
    });
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Visibility(
              // visible: toogleimgcontainer,
              // child: url != null
              child: Container(
            width: double.infinity,
            height: size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: url != null
                      ? NetworkImage(url)
                      : AssetImage('assets/jobimages/img_not_available.jpeg'),
                  fit: BoxFit.cover),
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
          )
              // : Center(
              //     // child: Text(
              //     //   url,
              //     //   style: TextStyle(color: Colors.black),
              //     // ),
              //     child: CircularProgressIndicator(
              //       backgroundColor: Colors.deepOrange,
              //     ),
              //   ),
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        btnshow = !btnshow;
                      });
                    },
                    child: Container(
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
                                widget.jobs.budget,
                                style: TextStyle(
                                    color: deepOrangeColor,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0),
                              ),
                            ],
                          ),
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
                    widget.jobs.title,
                    style: TextStyle(fontSize: 20, height: 1.5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        allOfferbtn = !allOfferbtn;
                      });
                    },
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(workers[3].imageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 30,
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
                              widget.jobs.postedBy,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontFamily: 'Quicksand',
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // _divider(),
                  Divider(
                    color: Colors.grey,
                    // height: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        color: deepOrangeColor,
                        size: 35,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            //color: Colors.red,
                            width: 170,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "LOCATION",
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
                                  widget.jobs.location,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'Quicksand',
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Align(
                      //     //alignment: Alignment.topLeft,
                      //     child: Text(
                      //       'VIEW ON MAP',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: deepOrangelightColor,
                      //         fontFamily: 'Quicksand',
                      //         //letterSpacing: 1.5,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  _divider(),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: deepOrangeColor,
                        size: 35,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "DUE DATE",
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
                            widget.jobs.postedDate,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Quicksand',
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  _divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TASK DETAIL",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.jobs.detail,
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey, height: 2),
                        //textAlign: TextAlign.center,
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Visibility(
                      visible: offerboxshow,
                      child: Container(
                          child: offerboxshow
                              ? MakeOffer(
                                  jobId: widget.jobs.jobId,
                                  scaffoldKey: _scaffoldKey,
                                )
                              : SizedBox(height: 0.0))),
                  Visibility(
                    visible: btnshow,
                    child: ButtonWidget(
                      btnText: btnText,
                      onClick: () {
                        setState(() {
                          //btnText = 'SEND OFFER';
                          offerboxshow = !offerboxshow;
                          btnshow = false;
                        });
                      },
                    ),
                  ),
                  Visibility(
                      visible: allOfferbtn,
                      child: Center(
                        child: RaisedButton(
                          elevation: 6.0,
                          color: deepOrangeColor,
                          child: Text('View All Offers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            setState(() {
                              btnshow = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JobOfferScreen(
                                          jobId: widget.jobs.jobId,
                                        )));
                          },
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _divider() {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      // _divider(),
      Divider(
        color: Colors.grey,
        // height: 50,
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}

// Widget _offerbox() {
//   return Column(
//     children: [
//       SizedBox(
//         height: 30.0,
//       ),
//       Text('hellow wolrd',
//           style: TextStyle(color: Colors.black, fontSize: 60.0)),
//     ],
//   );
// }

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
