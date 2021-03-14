import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/hourlyjob.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/post_job.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/services.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/taskdetail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/bottomcontainer_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/utils/constant.dart';
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
    Color textcolor = Colors.white;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        title: Text(
          'Jobs',
          style: TextStyle(color: textcolor),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicator: UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 30.0)),
          tabs: [
            Tab(
              child: Text(
                'Fixed Jobs',
                style: kTabBarTextStyle,
              ),
            ),
            Tab(
              child: Text('Hourly Jobs', style: kTabBarTextStyle),
            ),
            Tab(
              child: Text('Post Job', style: kTabBarTextStyle),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _categorySelector(),
                  Divider(
                    height: 10.0,
                  ),
                  Services(),
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
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ],
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
                      color: index == selectedIndex
                          ? Colors.amberAccent
                          : Colors.white,
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
