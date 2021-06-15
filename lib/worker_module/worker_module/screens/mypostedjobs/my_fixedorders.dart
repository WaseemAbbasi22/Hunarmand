import 'package:Hunarmand_signIn_Ui/Models/job_models/posted_job_m.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/searchfilter_form.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/postedjob_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _firestore = FirebaseFirestore.instance;
User _loginUser;
String name;

class FixedJobOrders extends StatefulWidget {
  FixedJobOrders({Key key}) : super(key: key);

  @override
  _FixedJobOrdersState createState() => _FixedJobOrdersState();
}

class _FixedJobOrdersState extends State<FixedJobOrders> {
  @override
  void initState() {
    _loginUser = FirebaseAuth.instance.currentUser;
    name = _loginUser.displayName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jobProvider = Provider.of<PostedJobProvider>(context, listen: false);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  _top(),
                  //
                ],
              ),
              //
              SizedBox(height: 20.0),
              // Container(
              //     padding: EdgeInsets.only(
              //       left: 25.0,
              //       right: 25.0,
              //     ),
              //     margin: EdgeInsets.only(bottom: 10.0),
              //     child: Text(
              //       'My Jobs',
              //       style: TextStyle(
              //           color: Colors.green,
              //           fontFamily: 'Quicksand',
              //           fontWeight: FontWeight.bold,
              //           fontSize: 18.0),
              //     )),
              SizedBox(height: 10.0),
              StreamBuilder<List<PostedJobs>>(
                //  _firestore
                //     .collection('posted_projects')
                //     .where("posted_by", isEqualTo: email)
                //     .snapshots(),
                stream: jobProvider.fixedjobs,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print(snapshot.error.toString());
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.deepOrange,
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          // final postedJobs = snapshot.data[index];
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Card(
                              elevation: 6.0,
                              child: ListTile(
                                  contentPadding: EdgeInsets.all(10.0),
                                  leading: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/user_avatar.png')),
                                  title: Text(
                                    snapshot.data[index].title,
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(snapshot.data[index].location),
                                  trailing: RaisedButton(
                                    color: deepOrangeColor,
                                    child: Text('View Detail',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PostedJobDetail(
                                                    jobs: snapshot.data[index],
                                                  )));
                                    },
                                  )),
                            ),
                          );
                          // return _buildListCard(pjobs: postedJobs);
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

  Widget _buildListCard({PostedJobs pjobs}) {}

  _top() {
    void _showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              //height: 1000,
              color: Colors.brown[50],
              padding: EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 20.0,
              ),
              child: SearchFilter(),
            );
          });
    }

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
          Container(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  fillColor: Colors.white,
                  //enabled: true,
                  //filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
                  suffixIcon: InkWell(
                    child: Icon(Icons.filter_list, color: Colors.deepOrange),
                    onTap: () {
                      // keybo

                      _showBottomSheet();
                    },
                  ),
                  //suffixIcon: Icon(Icons.filter_list),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
