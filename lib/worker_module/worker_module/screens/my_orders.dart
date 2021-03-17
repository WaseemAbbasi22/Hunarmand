import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/searchfilter_form.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/postedjob_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
User _loginUser;
String email;

class MyOrders extends StatefulWidget {
  MyOrders({Key key}) : super(key: key);

  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    super.initState();
    _loginUser = FirebaseAuth.instance.currentUser;
    email = _loginUser.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        // elevation: 0,
        title: Text("My Orders"),
        centerTitle: true,
      ),
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
              Container(
                  padding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                  ),
                  margin: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'My Jobs',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  )),
              SizedBox(height: 10.0),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection('posted_projects')
                    .where("posted_by", isEqualTo: email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.deepOrange,
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          final postedJobs = snapshot.data.docs[index];
                          return _buildListCard(pjobs: postedJobs);
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

  Widget _buildListCard({DocumentSnapshot pjobs}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 6.0,
        child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_avatar.png')),
            title: Text(
              pjobs['title'],
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(pjobs['location']),
            trailing: RaisedButton(
              color: deepOrangeColor,
              child: Text('View Detail',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostedJobDetail()));
              },
            )),
      ),
    );
  }

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
