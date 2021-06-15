import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/geysers_service.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/newinstallation_service.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/renovation_service.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/tap_services.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/taskdetail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/washingmechine_service.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/post_job.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Jobsstate extends StatefulWidget {
  final String servicetype;
  Jobsstate({this.servicetype});
  @override
  _JobsstateState createState() => _JobsstateState();
}

class _JobsstateState extends State<Jobsstate>
    with SingleTickerProviderStateMixin {
  final List<String> categories = [
    'Taps',
    'Automatic Washing Machine',
    'Geysers',
    'New Installation',
    'Renovation'
  ];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    // final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);
    // jobProvider.changeservicetype = widget.servicetype;
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        title: Text(
          'Jobs',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.amber,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                text: ('Fixed Job'),
              ),
              // Tab(
              //   text: ('Hourly Job'),
              // ),
              Tab(
                text: ('Post Job'),
              ),

              // Tab(
              //   text: ('Outside Pokhara-Lekhnath'),
              // ),
            ]),
      ),
      body: TabBarView(
        children: <Widget>[
          NestedTabBar(
            cat: categories,
            sType: widget.servicetype,
          ),
          // Center(
          //   child: Text('hourly job'),
          // ),
          Postjob(),

          // NestedTabBar(),
          // NestedTabBar(),
        ],
        controller: _tabController,
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  NestedTabBar({this.cat, this.sType});
  final List cat;
  final String sType;
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  TabController _nestedTabController;
  int total;
  @override
  void initState() {
    super.initState();
    // total = Joblist().total;
    _nestedTabController =
        new TabController(length: widget.cat.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String stype =
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.orange,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: widget.cat[0],
            ),
            Tab(
              text: widget.cat[1],
            ),
            Tab(
              text: widget.cat[2],
            ),
            Tab(
              text: widget.cat[3],
            ),
            Tab(
              text: widget.cat[4],
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.70,
          // margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Services(),
                      // selectedIndex == 2 ? Text('index2') : Text('index3'),
                      SizedBox(
                        height: 10.0,
                      ),
                      ButtonWidget(
                          btnText: 'Next',
                          onClick: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Jobdetail(
                                          serviceType: widget.sType,
                                        )));
                          }),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      WashingMechineService(),
                      // selectedIndex == 2 ? Text('index2') : Text('index3'),
                      SizedBox(
                        height: 10.0,
                      ),

                      ButtonWidget(
                          btnText: 'Next',
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Jobdetail(
                                          serviceType: widget.sType,
                                        )));
                          }),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GeysersService(),
                      // selectedIndex == 2 ? Text('index2') : Text('index3'),
                      SizedBox(
                        height: 10.0,
                      ),

                      ButtonWidget(
                          btnText: 'Next',
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Jobdetail(
                                          serviceType: widget.sType,
                                        )));
                          }),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      NewInstallationService(),
                      // selectedIndex == 2 ? Text('index2') : Text('index3'),
                      SizedBox(
                        height: 10.0,
                      ),

                      ButtonWidget(
                          btnText: 'Next',
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Jobdetail(
                                          serviceType: widget.sType,
                                        )));
                          }),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RenovationService(),
                      // selectedIndex == 2 ? Text('index2') : Text('index3'),
                      SizedBox(
                        height: 10.0,
                      ),

                      ButtonWidget(
                          btnText: 'Next',
                          // serviceType: widget.s,
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Jobdetail(
                                          serviceType: widget.sType,
                                        )));
                          }),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                    ],
                  ),
                ],
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8.0),
              //     color: Colors.blueGrey[300],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
