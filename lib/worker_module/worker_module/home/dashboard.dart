import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/geysers_service.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/newinstallation_service.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/renovation_service.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/tap_services.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/taskdetail_screen.dart';
import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/washingmechine_service.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
import 'package:Hunarmand_signIn_Ui/commons/advance_alertdialoge.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/components/filtered_fixed.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/components/filtered_other.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/my_fixedorders.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/my_otherorders.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkerDashboard extends StatefulWidget {
  final String servicetype;
  final String showScreen;
  WorkerDashboard({this.servicetype, this.showScreen});
  @override
  _WorkerDashboardState createState() => _WorkerDashboardState();
}

class _WorkerDashboardState extends State<WorkerDashboard>
    with SingleTickerProviderStateMixin {
  final List<String> categories = [
    'fixedjobs',
    'hourlyjobs',
    'otherjobs',
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
        // elevation: 0,
        title: Text("HUNARMAND"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_call,
              color: Colors.white,
            ),
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AdvanceCustomAlert();
                  })
            },
          ),
        ],

        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.amber,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: <Widget>[
              Tab(
                text: ('Fixed Job'),
              ),

              Tab(
                text: ('Other Job'),
              ),

              // Tab(
              //   text: ('Outside Pokhara-Lekhnath'),
              // ),
            ]),
      ),
      drawer: MainDrawer(showscreen: "worker"),
      body: TabBarView(
        children: <Widget>[
          AllFixedJobs(
            showScreen: widget.showScreen,
          ),

          AllOtherJobs(),

          // NestedTabBar(),
          // NestedTabBar(),
        ],
        controller: _tabController,
      ),
    );
  }
}
