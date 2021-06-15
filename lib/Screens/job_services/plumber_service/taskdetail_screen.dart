//import 'dart:js';
import 'package:Hunarmand_signIn_Ui/Models/job_models/jobdetail_model.dart';
import 'package:Hunarmand_signIn_Ui/Service/google_map_dummy.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/mypostedjobs/my_orderhome.dart';
import 'package:Hunarmand_signIn_Ui/controllers/postjob_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _auth = FirebaseAuth.instance;

int total;
int subTotal;
String jobtitle = 'Need worker for fixed services';
String jobDetail = '';
String postername;

class Jobdetail extends StatefulWidget {
  final String serviceType;
  Jobdetail({this.serviceType});

  @override
  _JobdetailState createState() => _JobdetailState();
}

class _JobdetailState extends State<Jobdetail> {
  @override
  void initState() {
    postername = _auth.currentUser.displayName;
    final provider = Provider.of<JobDetailProvider>(context, listen: false);
    final jobprovider = Provider.of<PostedJobProvider>(context, listen: false);
    total = calculateTotal();
    setDetail();
    print(provider.getitemdetail().length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jobprovider = Provider.of<PostedJobProvider>(context, listen: false);
    final itemdetailprovider =
        Provider.of<JobDetailProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change  color here
        ),
        backgroundColor: deepOrangeColor,
        bottomOpacity: 0.5,
        title: Text(
          'Job Details',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            //color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        //color: Colors.grey[300],
        child: Column(
          children: [
            _topCardWidget(jobprovider),
            SizedBox(height: 5.0),
            Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item name'),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('Item price'),
                        Text('Item quantity'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),
            _centerCardWidget(),
            // SizedBox(
            //   height: 10.0,
            // ),
            _cardWidget(),
            SizedBox(
              height: 25.0,
            ),
            // _bottom(),
            ButtonWidget(
              btnText: 'Post Now',
              onClick: () {
                jobprovider.changejobtype = 'Fixed';
                jobprovider.changetitle = jobtitle;
                jobprovider.changebudget = total.toString();
                jobprovider.changedetail = jobDetail;
                jobprovider.changepostedby = postername;
                jobprovider.changeservicetype = widget.serviceType;
                jobprovider.savefixjobs();
                itemdetailprovider.itemdetail.clear();
                jobprovider.changeloction = null;
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Orderstate()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _topCardWidget(PostedJobProvider jobprovider) {
    // final jobprovider = Provider.of<PostedJobProvider>(context, listen: false);

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
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 50.0,
              children: [
                jobprovider.joblocation == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            jobprovider.joblocation != null
                                ? jobprovider.joblocation
                                : 'Chose Job Location',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // jobprovider.joblocation == null
                          //     ? Text(
                          //         'Address detail',
                          //         style: TextStyle(fontSize: 19.0, color: Colors.black87),
                          //       )
                          //     : Text(
                          //         '${jobprovider.joblocation}',
                          //         style: TextStyle(fontSize: 19.0, color: Colors.black87),
                          //       ),
                          jobprovider.joblocation != null
                              ? SizedBox(
                                  height: 0.0,
                                )
                              : IconButton(
                                  color: deepOrangeColor,
                                  icon: Icon(Icons.forward),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DummyMap()));
                                  },
                                )
                        ],
                      )
                    : Text(
                        jobprovider.joblocation != null
                            ? jobprovider.joblocation
                            : 'Chose Job Location',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _centerCardWidget() {
    final itemdetailprovider =
        Provider.of<JobDetailProvider>(context, listen: false);
    int length = itemdetailprovider.getitemdetail().length;
    return Expanded(
      // flex: 5,
      child: ListView.builder(
          itemCount: length,
          itemBuilder: (context, index) {
            return length > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                length > 0
                                    ? Text(itemdetailprovider
                                        .getitemdetail()[index]
                                        .heading)
                                    : Text('no item yet'),

                                // Text(itemdetailprovider.getitemdetail()[index].subheading),
                                Text(itemdetailprovider
                                    .getitemdetail()[index]
                                    .price
                                    .toString()),

                                Text(itemdetailprovider
                                    .getitemdetail()[index]
                                    .counter
                                    .toString()),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      'No Item Added Yet',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 18.0),
                    ),
                  );
          }),
    );
    // return Card(
    //   elevation: 6.0,
    //   child: Container(
    //     padding: EdgeInsets.all(15.0),
    //     color: Colors.white,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text('ITEMS',
    //             style: TextStyle(
    //               fontSize: 18,
    //               color: Colors.black54,
    //               fontWeight: FontWeight.bold,
    //             )),
    //         SizedBox(
    //           height: 2.0,
    //         ),
    //         Divider(
    //           color: Colors.grey[900],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           //crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Text('Item detail',
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   color: Colors.black,
    //                 )),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(
    //                   'Quantity',
    //                   style: TextStyle(
    //                     fontSize: 14,
    //                     color: Colors.black,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 20.0,
    //                 ),
    //                 Text(
    //                   'Price',
    //                   style: TextStyle(
    //                     fontSize: 14,
    //                     color: Colors.black,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
              price: 'Rs. $subTotal',
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: dcolor,
            ),
            _rowWidget(
              title: 'Total',
              price: 'Rs. $total',
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

  // Widget _bottom() {
  //   return Container(
  //     color: Colors.white,
  //     height: 80,
  //     // padding: EdgeInsets.symmetric(horizontal: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         SmallButton(
  //           btnText: 'Post Now',
  //           onClick: () {
  //             Navigator.push(
  //                 context, MaterialPageRoute(builder: (_) => MyOrders()));
  //           },
  //         ),
  //         SmallButton(
  //           btnText: 'Schedule',
  //           onClick: () {
  //             setDetail();
  //             //   DateTime selectedDate = DateTime.now();

  //             //   //final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  //             //   showDateTimeDialog(context, initialDate: selectedDate,
  //             //       onSelectedDate: (selectedDate) {
  //             //     setState(() {
  //             //       selectedDate = selectedDate;
  //             //     });
  //             //   });
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //}

  int calculateTotal() {
    final itemdetailprovider =
        Provider.of<JobDetailProvider>(context, listen: false);
    int length = itemdetailprovider.getitemdetail().length;
    int serviceCharges = 99;
    int subtotal = 0;
    for (int i = 0; i < length; i++) {
      subtotal = subtotal +
          (itemdetailprovider.itemdetail[i].price) *
              (itemdetailprovider.itemdetail[i].counter);
    }
    print(subtotal + serviceCharges);
    setState(() {
      subTotal = subtotal;
      total = subtotal + serviceCharges;
    });
    return total;
  }

  void setDetail() {
    final itemdetailprovider =
        Provider.of<JobDetailProvider>(context, listen: false);
    int length = itemdetailprovider.getitemdetail().length;
    String jobdetail = " ";
    for (int i = 0; i < length; i++) {
      jobdetail = jobdetail +
          "," +
          (itemdetailprovider.itemdetail[i].heading +
              "  x" +
              itemdetailprovider.itemdetail[i].counter.toString());
    }
    print(jobdetail);
    setState(() {
      jobDetail = jobdetail;
    });
  }
}
