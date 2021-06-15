import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/Screens/authenticate/components/input_card.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/my_orderhome.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/BusinessLogic/uplaod_image.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
// final _authService = AuthService();
// User _loginUser = _auth.currentUser;
// UploadingImage _uploadingImage;

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
  String postedBy;
  // String imageUrl;
  @override
  void initState() {
    // final jobProvider = Provider.of<PostedJobProvider>(context);

    // final postJobController =
    // Provider.of<PostedJobProvider>(context, listen: false);

    // if (widget.jobs != null) {
    //   //Edit
    //   postJobController.text = widget.jobs.title;

    //   postJobController.loadAll(widget.jobs);
    // } else {
    //Add
    // postJobController.loadAll(null);
    // }
    super.initState();
  }

  @override
  void dispose() {
    jobTitleController.dispose();
    jobbudgetController.dispose();
    jobdetailController.dispose();
    jobLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);
    postedBy = _auth.currentUser.displayName;

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
        mainAxisAlignment: MainAxisAlignment.start,
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
                // Text(
                //   'Job Location',
                //   style: TextStyle(color: Colors.grey[500]),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(10.0),
                //         child: Text(
                //           provider.joblocation != null
                //               ? provider.joblocation
                //               : 'Chose Job Location',
                //           style: TextStyle(
                //             fontSize: 16.0,
                //           ),
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //       SizedBox(
                //         width: 50.0,
                //       ),
                //       provider.joblocation == null
                //           ? IconButton(
                //               color: Colors.deepOrange,
                //               icon: Icon(Icons.forward),
                //               onPressed: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => DummyMap()));
                //               },
                //             )
                //           : SizedBox(
                //               width: 2.0,
                //             ),
                //       // Text(

                //       //   style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                //       // ),
                //     ],
                //   ),
                // ),
                InputCard(
                  hintText: 'Enter job Location',
                  controller: jobLocationController,
                  onChange: (String val) {
                    provider.changeloction = val;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputCard(
                  controller: jobbudgetController,
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
                  controller: jobdetailController,
                  maxline: 8,
                  hintText: 'Enter decription',
                  onChange: (String val) {
                    provider.changedetail = val;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pick Job Validity Date',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.deepOrange,
                          size: 30.0,
                        ),
                        onPressed: () {
                          _pickDate(context, provider).then((value) {
                            if (value != null) {
                              provider.changeDate = value;
                            }
                          });
                        }),
                    provider.jobposteddate != null
                        ? Text(
                            DateFormat('MM/dd/yyyy')
                                .format(provider.jobposteddate),
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.blueGrey),
                          )
                        : Text(
                            formatDate(
                                DateTime.now(), [MM, ' ', d, ', ', yyyy]),
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.blueGrey),
                          ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          UploadingImage(),
          // UploadingImage(),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: ButtonWidget(
              btnText: 'Post',
              onClick: () {
                try {
                  provider.changepostedby = postedBy;
                  provider.changejobtype = 'Other';
                  provider.savejobs();
                  provider.changeloction = null;
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Orderstate()));
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<DateTime> _pickDate(
      BuildContext context, PostedJobProvider jobProvider) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}
