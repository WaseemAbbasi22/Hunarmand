//import 'dart:js';
import 'package:Hunarmand_signIn_Ui/Service/map.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/calander.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:intl/intl.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/small_btn.dart';
import 'package:flutter/material.dart';

class Jobdetail extends StatefulWidget {
  Jobdetail({Key key}) : super(key: key);

  @override
  _JobdetailState createState() => _JobdetailState();
}

class _JobdetailState extends State<Jobdetail> {
  @override
  Widget build(BuildContext context) {
    Color dcolor = Colors.grey[900];

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
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
        child: Container(
          //color: Colors.grey[300],
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
                height: 25.0,
              ),
              _bottom(),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address detail',
                  style: TextStyle(fontSize: 19.0, color: Colors.black87),
                ),
                IconButton(
                  color: deepOrangeColor,
                  icon: Icon(Icons.forward_outlined),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GMap()));
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
                Text('Item detail',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
            _rowWidget(
              title: 'Sub Total',
              price: 'price',
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: dcolor,
            ),
            _rowWidget(
              title: 'Total',
              price: 'price',
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: dcolor,
            ),
          ],
        ),
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

  Widget _bottom() {
    return Container(
      color: Colors.white,
      height: 80,
      // padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallButton(
            btnText: 'Post Now',
            onClick: () {},
          ),
          SmallButton(
            btnText: 'Schedule',
            onClick: () async {
              DateTime selectedDate = DateTime.now();

              //final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
              showDateTimeDialog(context, initialDate: selectedDate,
                  onSelectedDate: (selectedDate) {
                setState(() {
                  selectedDate = selectedDate;
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
