import 'package:Hunarmand_signIn_Ui/Models/electric_model.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({Key key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    int inde;
    int length = taps.length;
    return Expanded(
      //flex: 10,
      child: ListView.builder(
// scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 05),
              //padding: EdgeInsets.only(top: 10),
              height: 125,
              width: double.maxFinite,
              child: Card(
                color: Colors.white,
                elevation: 6.0,
                shadowColor: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 2.0, color: Colors.blueGrey[200]))),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: _joblist(
                          heading: taps[index].heading,
                          sub_heading: taps[index].subheading,
                          price: taps[index].price,
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

  Widget _joblist(
      {String heading,
      String sub_heading,
      String price,
      int counter,
      Function onplus(),
      Function onmin()}) {
    int counter = 0;
    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              heading,
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
            sub_heading,
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
              price,
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
                  onPressed: () {},
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
                    counter = counter + 1;
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
