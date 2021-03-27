import 'package:Hunarmand_signIn_Ui/BusinessLogic/uplaod_image.dart';
import 'package:Hunarmand_signIn_Ui/Models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/input_card.dart';
import 'package:Hunarmand_signIn_Ui/Service/database_service.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/image_picker.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_controller.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:provider/provider.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
User _loginUser = _auth.currentUser;
UploadingImage _uploadingImage;

// DataBaseService _dbService = DataBaseService();

class Postjob extends StatefulWidget {
  final PostedJobs jobs;
  Postjob({this.jobs});

  @override
  _PostjobState createState() => _PostjobState();
}

class _PostjobState extends State<Postjob> {
  final _formkey = GlobalKey<FormState>();
  final jobTitleController = TextEditingController();
  final jobLocationController = TextEditingController();
  final jobbudgetController = TextEditingController();
  final jobdetailController = TextEditingController();
  // String imageUrl;
  @override
  void initState() {
    super.initState();
    final postJobController =
        Provider.of<PostedJobProvider>(context, listen: false);
    // if (widget.jobs != null) {
    //   //Edit
    //   postJobController.text = widget.jobs.title;

    //   postJobController.loadAll(widget.jobs);
    // } else {
    //Add
    postJobController.loadAll(null);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<PostedJobProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
            padding: EdgeInsets.all(5),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 6.0,
                        child: Container(
                          //height: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/icons/taskupload_icon.JPG',
                                  ),
                                  height: 80,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'If the service you are looking for is not in the list, describe it here relevant Hunarmand will help you',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      _descriptionCard(provider: jobProvider),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _descriptionCard({PostedJobProvider provider}) {
    return Container(
      child: Column(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                InputCard(
                  hintText: 'Enter job title',
                  controller: jobTitleController,
                  onChange: (String val) {
                    provider.changetitle = val;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputCard(
                  hintText: 'Enter job Location',
                  onChange: (String val) {
                    provider.changeloction = val;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputCard(
                  hintText: 'Enter job budget',
                  onChange: (String val) {
                    provider.changebudget = val;
                  },

                  // print(budget);
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputCard(
                  maxline: 8,
                  hintText: 'Enter decription',
                  onChange: (String val) {
                    provider.changedetail = val;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          UploadImage(),
          // UploadingImage(),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: ButtonWidget(
              btnText: 'Post',
              onClick: () async {
                try {
                  provider.savejobs();
                  // Provider.of<Poste>(context, listen: false).addJob(
                  //     title: title,
                  //     location: location,
                  //     budget: budget,
                  //     detail: detail,
                  //     offers: 2,
                  //     status: 'open');
                  // // print(title);
                  // _dbService.addJobToDb(context);
                } catch (e) {
                  print(e);
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrders()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
