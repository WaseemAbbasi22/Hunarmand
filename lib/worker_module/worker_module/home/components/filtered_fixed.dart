import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/notifications.dart';
import 'package:Hunarmand_signIn_Ui/commons/advance_alertdialoge.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/searchfilter_form.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/postedjob_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllFixedJobs extends StatefulWidget {
  final String showScreen;
  AllFixedJobs({this.showScreen});
  @override
  _AllFixedJobsState createState() => _AllFixedJobsState();
}

class _AllFixedJobsState extends State<AllFixedJobs> {
  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<PostedJobProvider>(context);
    List<String> location;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: Column(
            // shrinkWrap: true,
            children: <Widget>[
              // Stack(
              //   children: <Widget>[
              //     _top(),
              //     //
              //   ],
              // ),
              //
              SizedBox(height: 20.0),
              Container(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                  ),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'All JOBS',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0),
                  )),
              SizedBox(height: 10.0),
              StreamBuilder<List<Jobs>>(
                //  _firestore
                //     .collection('posted_projects')
                //     .where("posted_by", isEqualTo: email)
                //     .snapshots(),
                stream: jobProvider.allfixedjobs,
                // stream: _firestore.collection('posted_projects').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          //primary: false,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 8.0,
                          //shrinkWrap: true,
                        ),
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          location = (snapshot.data[index].location).split(',');

                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            elevation: 10.0,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: <Widget>[
                                // SizedBox(height: 10.0),
                                Stack(children: <Widget>[
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color:
                                            Colors.deepOrange.withOpacity(0.5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                workers[3].imageUrl))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 40.0),
                                    height: 20.0,
                                    width: 20.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        // color:
                                        //     pjobs.status == 'Assigned' ? Colors.amber : Colors.green,
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: 2.0)),
                                  )
                                ]),
                                SizedBox(height: 8.0),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data[index].title,
                                        style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 5.0),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 40.0),
                                          child: Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.place,
                                                size: 20.0,
                                              ),
                                              // SizedBox(
                                              //   width: .0,
                                              // ),
                                              Flexible(
                                                child: Text(
                                                  location[0],
                                                  style: TextStyle(
                                                      fontFamily: 'Quicksand',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0,
                                                      color: Colors.grey),
                                                  // textAlign: TextAlign.center,
                                                  // maxLines: 1,
                                                  // overflow:
                                                  //     TextOverflow.visible,
                                                  // overflow:
                                                  //     TextOverflow.ellipsis,
                                                  // softWrap: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      // Center(
                                      //   child: Container(
                                      //     margin: EdgeInsets.only(left: 60.0),
                                      //     child: Row(
                                      //       //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      //       children: [
                                      //         Text(
                                      //           'Offers',
                                      //           style: TextStyle(
                                      //               fontFamily: 'Quicksand',
                                      //               fontWeight: FontWeight.bold,
                                      //               fontSize: 14.0,
                                      //               color: Colors.grey),
                                      //         ),
                                      //         SizedBox(
                                      //           width: 10.0,
                                      //         ),
                                      //         Text(
                                      //           '20',
                                      //           // pjobs.offers.toString(),
                                      //           style: TextStyle(
                                      //               fontFamily: 'Quicksand',
                                      //               fontWeight: FontWeight.bold,
                                      //               fontSize: 12.0,
                                      //               color: Colors.grey),
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(left: 60.0),
                                          child: Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Status',
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(
                                                'Open',
                                                style: TextStyle(
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.0,
                                                  // color: pjobs.status == 'Open'
                                                  //     ? Colors.green
                                                  //     : Colors.amber,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                // SizedBox(height: 15.0),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PostedJobDetail(
                                                    jobs: snapshot.data[index],
                                                    showScreen:
                                                        widget.showScreen,
                                                  )));
                                    },
                                    child: Container(
                                        height: 100,
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange
                                              .withOpacity(0.95),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'View Detail',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Quicksand'),
                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                            // margin: cardIndex.isEven
                            //     ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
                            //     : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
                          );
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
