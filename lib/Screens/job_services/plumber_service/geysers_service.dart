import 'package:Hunarmand_signIn_Ui/Models/job_models/electric_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Hunarmand_signIn_Ui/Models/job_models/jobdetail_model.dart';

class GeysersService extends StatefulWidget {
  @override
  _GeysersServiceState createState() => _GeysersServiceState();
}

class _GeysersServiceState extends State<GeysersService> {
  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    int inde;
    int length = geysers.length;
    return Expanded(
      //flex: 10,
      child: ListView.builder(
// scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              decoration: BoxDecoration(
                  // color: Colors.red,
                  //borderRadius: BorderRadius.circular(30.0),
                  ),
              //padding: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height * 0.22,

              width: double.maxFinite,
              child: Card(
                color: Colors.white,
                elevation: 10.0,
                shadowColor: Colors.white,
                child: Container(
                  //margin: EdgeInsets.symmetric(horizontal: 30.0),
                  // margin: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0.0),
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      //borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 2.0, color: Colors.white)
                      ],
                      border: Border(
                          top: BorderSide(
                              width: 2.0, color: Colors.deepOrange[200]))),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Joblist(
                          heading: geysers[index].heading,
                          subheading: geysers[index].subheading,
                          price: geysers[index].price,
                          counter: geysers[index].counter,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Joblist extends StatefulWidget {
  int total = 0;
  final String heading;
  final String subheading;
  final int price;
  final int counter;
  Joblist({this.heading, this.subheading, this.price, this.counter});

  @override
  _JoblistState createState() => _JoblistState();
}

class _JoblistState extends State<Joblist> {
  int counter = 0;
  JobDetailModel jobDetailModel;

  @override
  Widget build(BuildContext context) {
    final itemdetailprovider =
        Provider.of<JobDetailProvider>(context, listen: false);

    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.heading,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'avenir',
                fontWeight: FontWeight.w600,
              ),
            )),
        SizedBox(
          height: 6.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.subheading,
            style: TextStyle(
                //fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 16),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //alignment: Alignment.bottomRight,
            Text(
              widget.price.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.do_disturb_on_outlined),
                  iconSize: 30,
                  color: Colors.black,
                  //hoverColor: Colors.amber,
                  onPressed: () {
                    setState(() {
                      if (counter != 0) {
                        counter = counter - 1;
                        print(counter);
                        if (counter == 0) {
                          itemdetailprovider.removefromlist(jobDetailModel);
                        } else {
                          var filteredlist = itemdetailprovider.itemdetail
                              .where((item) => item.heading == widget.heading)
                              .toList();
                          filteredlist[0].counter =
                              ((filteredlist[0].counter) - 1);
                        }
                      } else {
                        counter = 0;
                      }
                    });
                  },
                ),
                //),

                Text(
                  '$counter',
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                      fontSize: 20),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.add_circle_rounded),
                  iconSize: 30,
                  color: Colors.black,
                  //hoverColor: Colors.amber,
                  onPressed: () {
                    setState(() {
                      if (counter < 10) {
                        counter = counter + 1;
                        if (counter == 1) {
                          jobDetailModel = itemdetailprovider.addtolist(
                              widget.heading,
                              widget.subheading,
                              widget.price,
                              counter);
                        } else {
                          var filteredlist = itemdetailprovider.itemdetail
                              .where((item) => item.heading == widget.heading)
                              .toList();
                          filteredlist[0].counter = counter;
                        }
                      } else {
                        counter = counter;
                      }
                      widget.total =
                          widget.total + (counter + 1) * widget.price;
                      print(widget.total);
                    });
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

//   Widget _joblist(
//       {String heading,
//       String sub_heading,
//       String price,
//       int counter,
//       Function onplus(),
//       Function onmin()}) {}
}
