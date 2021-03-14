import 'package:Hunarmand_signIn_Ui/BusinessLogic/services.dart';
import 'package:Hunarmand_signIn_Ui/Models/service_model.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/components/top_container.dart';
import 'package:Hunarmand_signIn_Ui/Screens/home/top_worker.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/worker_card.dart';
import 'package:Hunarmand_signIn_Ui/commons/advance_alertdialoge.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/utils/constant.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  HomeDashboard({this.useremail});
  final String useremail;
  //double _rating = 4.0;

  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: deepOrangeColor,
            title: Text("HUNARMAND"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add_call,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AdvanceCustomAlert();
                      });
                },
              ),
            ],
          ),
          drawer: MainDrawer(),
          body: ListView(
            children: <Widget>[
              TopContainer(),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Services",
                      style: kImportantTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 200.0,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    int ind = index;
                    final service = services[index];

                    return _gridItem(
                      service: service,
                      ontap: () {
                        if (index == 1) {
                          Navigator.of(context).pushNamed('/services');
                        } else if (ind == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WorkerCard()));
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated Worker",
                      style: kImportantTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => WorkerCard()));
                      },
                      child: Text(
                        "view All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.deepOrange),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TopWorkers(),
            ],
          )),
    );
  }

  _gridItem({@required Services service, var ontap}) {
    //flex :3
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(.0),
            height: 50,
            width: 50,
            //color: deepOrangeColor,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: deepOrangelightColor,
                image: DecorationImage(
                    image: AssetImage(service.serviceImage),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            service.title,
            style: kNormalTextStyle,
          ),
        ],
      ),
    );
  }
}
