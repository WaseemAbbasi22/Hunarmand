import 'package:Hunarmand_signIn_Ui/Models/posted_job_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/postedjob_detail.dart';
import 'package:flutter/material.dart';

class WorkerDashboard extends StatefulWidget {
  WorkerDashboard({Key key}) : super(key: key);

  @override
  _WorkerDashboardState createState() => _WorkerDashboardState();
}

class _WorkerDashboardState extends State<WorkerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        elevation: 0,
        title: Text("HUNARMAND"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          // shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: <Widget>[
                _top(),
                // Container(
                //   alignment: Alignment(0.0, -0.40),
                //   height: 100.0,
                //   color: Colors.white,
                //   child: Text(
                //     'Get coaching',
                //     style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.fromLTRB(25.0, 90.0, 25.0, 0.0),
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(20.0),
                //       boxShadow: [
                //         BoxShadow(blurRadius: 2.0, color: Colors.grey)
                //       ]),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       Stack(
                //         children: <Widget>[
                //           Container(
                //             padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                //             child: Text(
                //               'YOU HAVE',
                //               style: TextStyle(
                //                   color: Colors.grey,
                //                   fontFamily: 'Quicksand',
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 14.0),
                //             ),
                //           ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(25.0, 40.0, 5.0, 25.0),
                //   child: Text(
                //     '206',
                //     style: TextStyle(
                //         color: Colors.black,
                //         fontFamily: 'Quicksand',
                //         fontWeight: FontWeight.bold,
                //         fontSize: 40.0),
                //   ),
                // )
              ],
            ),
            // SizedBox(width: 60.0),
            // Container(
            //   height: 60.0,
            //   width: 125.0,
            //   decoration: BoxDecoration(
            //       // color: ,
            //       borderRadius: BorderRadius.circular(10.0)),
            //   child: Center(
            //     child: Text('Buy more',
            //         style: TextStyle(
            //             fontFamily: 'Quicksand',
            //             fontWeight: FontWeight.bold,
            //             color: Colors.green)),
            //   ),
            // )

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
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //primary: false,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 10.0,
                    // shrinkWrap: true,
                  ),
                  itemCount: posted_job.length,
                  itemBuilder: (context, index) {
                    final posted_jobs = posted_job[index];
                    return _buildCard(pjobs: posted_jobs, ontap: () {});

                    // children: <Widget>[
                    //   _buildCard('Tom', 'Available', 1),
                    //   _buildCard('Tom', 'Away', 2),
                    //   _buildCard('Tom', 'Away', 3),
                    //   _buildCard('Tom', 'Available', 4),
                    //   _buildCard('Tom', 'Away', 5),
                    //   _buildCard('Tom', 'Available', 6),
                    // ],
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard({@required PostedJob pjobs, var ontap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 12.0),
          Stack(children: <Widget>[
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.deepOrange.withOpacity(0.5),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'))),
            ),
            Container(
              margin: EdgeInsets.only(left: 40.0),
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color:
                      pjobs.status == 'Assigned' ? Colors.amber : Colors.green,
                  border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 2.0)),
            )
          ]),
          SizedBox(height: 8.0),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              pjobs.title,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
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
                    Text(
                      pjobs.location,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Offers',
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      pjobs.offers.toString(),
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
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
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      pjobs.status,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: pjobs.status == 'Open'
                            ? Colors.green
                            : Colors.amber,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          SizedBox(height: 15.0),
          Expanded(
              child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PostedJobDetail()));
            },
            child: Container(
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(0.95),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Center(
                  child: Text(
                    'View Detail',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
                  ),
                )),
          ))
        ],
      ),
      // margin: cardIndex.isEven
      //     ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
      //     : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
    );
  }

  _top() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: deepOrangeColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          TextField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search",
              fillColor: Colors.white,
              filled: true,
              suffixIcon: Icon(Icons.filter_list, color: Colors.deepOrange),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            ),
          )
        ],
      ),
    );
  }
}
