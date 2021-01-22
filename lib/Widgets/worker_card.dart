import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/customcard_shaper.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/drawer.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/rating_bar.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class WorkerCard extends StatefulWidget {
  WorkerCard({Key key}) : super(key: key);

  @override
  _WorkerCardState createState() => _WorkerCardState();
}

class _WorkerCardState extends State<WorkerCard> {
  final double _borderRadius = 24;
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
              // Text(
              //   "view All",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              // ),
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
              height: 110,
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
              size: Size(100, 150),
              painter: CustomCardShapePainter(
                  _borderRadius, worker.startColor, worker.endColor),
            ),
          ),
          Positioned.fill(
            child: Row(
              children: <Widget>[
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
                SizedBox(width: 10.0),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      worker.name,
                      style: TextStyle(
                          color: Colors.black,
                          // fontFamily: 'Avenir',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      worker.category,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Avenir',
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Jobs",
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'Avenir',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "12",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontFamily: 'Avenir',
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Rate",
                              style: TextStyle(
                                  color: Colors.black,
                                  // fontFamily: 'Avenir',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              worker.rate.toString() + '/hr',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontFamily: 'Avenir',
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.0,
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
}
