import 'package:Hunarmand_signIn_Ui/Screens/duplicate/dashborad.dart';
import 'package:Hunarmand_signIn_Ui/Service/google_map_dummy.dart';
import 'package:Hunarmand_signIn_Ui/Service/map.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/small_btn.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/my_orders.dart';
import 'package:flutter/material.dart';

class HourlyJobDetail extends StatefulWidget {
  HourlyJobDetail({Key key}) : super(key: key);

  @override
  _HourlyJobDetailState createState() => _HourlyJobDetailState();
}

class _HourlyJobDetailState extends State<HourlyJobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: deepOrangeColor,
        bottomOpacity: 0.5,
        title: Text(
          'Job Details',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        //color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: [
              _topCardWidget(),
              SizedBox(height: 10.0),
              _centerCardWidget(),
              SizedBox(
                height: 10.0,
              ),
              _cardWidget(),
              SizedBox(
                height: 60.0,
              ),
              ButtonWidget(
                btnText: 'POST',
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyOrders()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topCardWidget() {
    return Card(
      elevation: 6.0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JOB LOCATION',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              color: Colors.grey[900],
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.place,
                  color: deepOrangeColor,
                  size: 30.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Address detail',
                  style: TextStyle(fontSize: 19.0, color: Colors.black87),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.34,
                ),
                IconButton(
                  color: deepOrangeColor,
                  icon: Icon(Icons.forward),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DummyMap()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _centerCardWidget() {
    return Card(
      elevation: 6.0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ITEMS',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 2.0,
            ),
            Divider(
              color: Colors.grey[900],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hourly Wage.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                Text(
                  'Rs. 500/ hr',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _cardWidget() {
    Color dcolor = Colors.grey[900];
    return Card(
      elevation: 6.0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        //color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JOB TOTAL',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: dcolor,
            ),
            _rowWidget(
              title: 'Service Charges',
              price: 'Rs. 99',
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: dcolor,
            ),
            _notificationContainer(),
            Divider(
              color: dcolor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationContainer() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.all(8.0),
      color: Colors.amber,
      child: Row(
        children: [
          Icon(
            Icons.notification_important,
            color: Colors.green,
            size: 40.0,
          ),
          Text(
            'Note:Total cost will be calculated on \norder completion.',
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w700,
                height: 1.5,
                letterSpacing: 1.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _rowWidget({String title, String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.0, color: Colors.black87),
        ),
        Text(
          price,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
