import 'package:Hunarmand_signIn_Ui/Models/workermodel.dart';
import 'package:Hunarmand_signIn_Ui/commons/ridial_image.dart';
import 'package:Hunarmand_signIn_Ui/controllers/worker_provider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/workerProfile/components/about_info.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/workerProfile/components/contact_info.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/workerProfile/edit_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  ProfilePage({this.uid});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // Worker worker;
    print(widget.uid);
    final workerprovider = Provider.of<WorkerProvider>(context, listen: false);
    workerprovider.changeworkerid = widget.uid;
    // workerprovider.worker;
    // workerprovider.loadAll(worker);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    final workerprovider = Provider.of<WorkerProvider>(context, listen: false);
    return Scaffold(
      // bottomNavigationBar: followButton(),
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(fontSize: 20.0)),
        centerTitle: true,
        backgroundColor: deepOrangeColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => EditProfilePage()));
            },
          )
        ],
      ),
      //   body: Container(
      //     child: Center(
      //       child: Text('profilepage'),
      //     ),
      //   ),
      // );
      body: Stack(children: <Widget>[
        ClipPath(
          child: Container(
            color: deepOrangeColor,
          ),
          clipper: GetClipper(),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: workerprovider.worker,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text("Loading...");
              return new ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildTripCard(context, snapshot.data.docs[index]));
            }),
      ]),
    );
  }

  Widget _jobdetailinfo({int heading, String subheading, Color hColor}) {
    return Column(
      children: <Widget>[
        Text(
          heading.toString(),
          style: TextStyle(
            color: hColor,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 2.0,
        ),
        Text(
          subheading,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildTripCard(BuildContext context, DocumentSnapshot snapshot) {
    return Stack(children: [
      Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height / 16.0,
              child: RoundedImage(imagePath: 'assets/images/user_avatar.png')),
          SizedBox(
            height: 18.0,
          ),
          Center(
            child: Text(
              snapshot['name'] ?? "worker name",
              // snapshot.data[index].name,

              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              snapshot['mobileno'] ?? "worker Phone",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Card(
            //color: Colors.grey[300],
            elevation: 6.0,
            child: Container(
              margin: EdgeInsets.all(10.0),
              // color: Colors.brown,
              child: Column(
                children: [
                  Divider(
                    height: 30.0,
                    color: Colors.black,
                    // indent: 30,
                    // endIndent: 30,
                  ),
                  Container(
                    width: 350.0,
                    height: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _jobdetailinfo(
                            heading: snapshot['totaljobs'] ?? 0,
                            subheading: 'Total Jobs',
                            hColor: Colors.blueAccent),
                        VerticalDivider(
                          width: 50.0,
                          color: Colors.black,
                        ),
                        _jobdetailinfo(
                            heading: snapshot['completedjobs'] ?? 0,
                            subheading: 'Completed',
                            hColor: Colors.green),
                        VerticalDivider(
                          width: 50.0,
                          color: Colors.black,
                        ),
                        _jobdetailinfo(
                            heading: snapshot['pendingjobs'] ?? 0,
                            subheading: 'Pending',
                            hColor: Colors.amber),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            height: 15,
            color: Colors.grey,
          ),
          AboutInfo(
            location: snapshot['location'] ?? 'n/a',
            dob: snapshot['dateofbirth'] ?? 'n/a',
          ),
          Divider(
            height: 15,
            color: Colors.grey,
          ),
          ContactInfo(
            email: snapshot['email'] ?? 'n/a',
            mobileno: snapshot['mobileno'] ?? 'n/a',
          ),
        ],
      ),
    ]);
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height / 3.2);
    path.lineTo(size.width + 115.0, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// Stream<QuerySnapshot> getUserStreamSnapshots(BuildContext context) async* {
//   final uid = await Provider.of(context).auth.getCurrentUID();
//   yield* FirebaseFirestore.instance.collection('workers').doc(uid).snapshots();
// }
