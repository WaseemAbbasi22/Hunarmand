import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/customcard_shaper.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/rating_bar.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkerCard extends StatefulWidget {
  WorkerCard({Key key}) : super(key: key);

  @override
  _WorkerCardState createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {
  final double _borderRadius = 24;
  bool verified = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deepOrangeColor,
        elevation: 0,
        title: Text("HUNARMAND"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      // drawer: MainDrawer(),
      body: Column(children: <Widget>[
        _top(),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Workers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          //height: 500,
          child: Expanded(
            child: ListView.builder(
                itemCount: workers.length,
                itemBuilder: (context, index) {
                  final worker = workers[index];
                  return _cardItem(worker: worker, ontap: () => {});
                }),
          ),
        ),
      ]),
    );
  }

  _top() {
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
          TextField(
            decoration: InputDecoration(
              hintText: "Search by name",
              fillColor: Colors.white,
              filled: true,
              suffixIcon: Icon(Icons.filter_list, color: Colors.deepOrange),
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            ),
          )
        ],
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
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: Container(
              height: 155,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                gradient: LinearGradient(colors: [
                  Colors.white,
                  Colors.white,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 9,
            bottom: 10,
            top: 10,
            child: CustomPaint(
              size: Size(80, 150),
              painter: CustomCardShapePainter(
                  _borderRadius, worker.startColor, worker.endColor),
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
                      SizedBox(height: 10.0),
                      Text('Varification',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                //SizedBox(width: 10.0),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _profileContent(
                          title: worker.name, description: worker.category),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _profileContent(title: 'Jobs', description: '12'),
                          SizedBox(
                            width: 35.0,
                          ),
                          _profileContent(
                            title: 'Rate',
                            description: worker.rate.toString() + '/hr',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _verificationContent(
                              text: 'Email',
                              icon: Icons.email,
                              iColor: deepOrangeColor,
                              verify: true),
                          SizedBox(
                            width: 20.0,
                          ),
                          _verificationContent(
                              text: 'Phone',
                              icon: Icons.phone,
                              iColor: Colors.blueGrey,
                              verify: false),
                          SizedBox(
                            width: 20.0,
                          ),
                          _verificationContent(
                              text: 'CNIC',
                              icon: FontAwesomeIcons.solidIdCard,
                              iColor: Colors.blueGrey,
                              verify: false),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 25.0,
                ),
                //SizedBox(height: 16),
                Positioned(
                  right: 0,
                  bottom: 0,
                  top: 0,
                  left: 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        worker.rating.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            //`fontFamily: 'Avenir',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      RatingBar(rating: worker.rating),
                    ],
                  ),
                ),
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
    bool verify,
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
        Stack(children: [
          Icon(
            icon,
            color: iColor,
            size: 25,
          ),
          Visibility(
            visible: verify,
            child: Icon(
              Icons.check_sharp,
              color: Colors.green,
              size: 30.0,
            ),
          ),
        ]),
      ],
    );
  }
}
