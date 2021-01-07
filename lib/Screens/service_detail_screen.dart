import 'package:Hunarmand_signIn_Ui/Models/electric_model.dart';
import 'package:Hunarmand_signIn_Ui/Models/massage_model.dart';
import 'package:Hunarmand_signIn_Ui/Screens/electricScreen/hourlyjob.dart';
import 'package:Hunarmand_signIn_Ui/Screens/electricScreen/post_job.dart';
import 'package:Hunarmand_signIn_Ui/Screens/fixedjob.dart';

import 'package:Hunarmand_signIn_Ui/Screens/services.dart';
import 'package:Hunarmand_signIn_Ui/Screens/tasks/taskdetail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/bottomcontainer_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:flutter/material.dart';

class ServiceDetail extends StatefulWidget {
  ServiceDetail({Key key}) : super(key: key);

  @override
  _ServiceDetailState createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TabController tabController;

  final List<String> categories = [
    'Taps',
    'Automatic Washing Machine',
    'Geysers',
    'New Installation',
    'Renovation'
  ];
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text(
          'Jobs',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // leading: Icon(
        //   Icons.arrow_back,
        //   color: Colors.black,
        // ),
        bottom: TabBar(
          controller: tabController,
          //isScrollable: true,
          indicatorColor: Colors.amber,

          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 30.0)),
          tabs: [
            Tab(
              // text: 'Fixed Jobs',
              child: Text('Fixed Jobs',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w600)),
            ),
            Tab(
              child: Text('Hourly Jobs',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w600)),
            ),
            Tab(
              child: Text('Post Task',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          //Icon(Icons.apps),
          Expanded(
            child: Column(
              children: <Widget>[
                _categorySelector(),
                Divider(
                  height: 2.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  // margin: EdgeInsets.only(top: 5.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    categories[0],
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600]),
                  ),
                ),
                //fixedjob(),
                Services(),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Bottom(),
                      SizedBox(
                        height: 10.0,
                      ),
                      ButtonWidget(
                          btnText: 'Next',
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Jobdetail()));
                          }),
                    ],
                  ),
                ),
                // ButtonWidget(
                //     btnText: 'Next',
                //     onClick: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => Jobdetail()));
                //     },
                //Bottom(),
                // SizedBox(
                //   height: 30.0,
                // ),
                // Services(),
              ],
            ),
          ),
          Hourlyjob(),
          Postjob(),
        ],
      ),
    );
  }

  Widget _categorySelector() {
    return Container(
        height: 80.0,
        color: Colors.white,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // if (taps.length == 6) {
                    //   selectedIndex = 3;
                    // } else {
                    selectedIndex = index;
                    // }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 18.0),
                  child: Container(
                    //height: 50.0,
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: index == selectedIndex
                          ? Border()
                          : Border.all(
                              color: Colors.grey,
                            ),
                      color:
                          index == selectedIndex ? Colors.orange : Colors.white,
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.black
                            : Colors.black87,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                        fontFamily: 'avenir',
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
