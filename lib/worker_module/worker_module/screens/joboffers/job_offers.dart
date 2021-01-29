import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/rating_bar.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/home/searchfilter_form.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/group_screen/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobOffers extends StatefulWidget {
  JobOffers({Key key}) : super(key: key);

  @override
  _JobOffersState createState() => _JobOffersState();
}

class _JobOffersState extends State<JobOffers> {
  int reviews = 4;
  double offerbdg = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        // elevation: 0,
        title: Text("All Offers"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          // color: Colors.grey,
          // padding: EdgeInsets.symmetric(
          //   horizontal: 10.0,
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _top(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'All Offers',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final worker = workers[index];
                      return _cardItem(worker: worker, ontap: () => {});
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _cardItem({@required Workers worker, var ontap}) {
    // double _rating = 4.0;
    double _borderRadius = 24.0;
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
              elevation: 4,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.3,
              ),
            ),
          ),

          Positioned.fill(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.only(right: 10.0, left: 5.0),
                            padding: EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                worker.imageUrl,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _profileContent(
                                      title: worker.name,
                                      description: worker.category),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  RatingBar(rating: worker.rating),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    '($reviews Rating)',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            color: Colors.grey[200],
                            child: Column(
                              children: [
                                Text('Offer Budget',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text('Rs.5000 ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Varification',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    _verificationContent(
                                        text: 'Email',
                                        icon: Icons.email,
                                        iColor: deepOrangeColor),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    _verificationContent(
                                        text: 'Phone',
                                        icon: Icons.phone,
                                        iColor: Colors.blueGrey),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    _verificationContent(
                                        text: 'CNIC',
                                        icon: FontAwesomeIcons.solidIdCard,
                                        iColor: Colors.blueGrey),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.25,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              //color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "OFFER DESCRIPTION",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                        height: 1.5),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: RaisedButton(
                          color: deepOrangeColor,
                          child: Text('DISCUSS JOB',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //SizedBox(width: 10.0),

                //SizedBox(height: 16),
              ],
            ),
          ),

          //
        ],
        //
      ),
    );
  }

  Widget _profileContent({String title, String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              // fontFamily: 'Avenir',
              fontSize: 16.0,
              fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey,
            fontFamily: 'Avenir',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _verificationContent({
    String text,
    IconData icon,
    Color iColor,
  }) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
              color: Colors.black,
              // fontFamily: 'Avenir',
              fontSize: 16.0,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 3.0,
        ),
        Icon(
          icon,
          color: iColor,
          size: 20,
        ),
      ],
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
