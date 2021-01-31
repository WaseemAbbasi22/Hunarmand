import 'package:Hunarmand_signIn_Ui/Screens/job_services/plumber_service/hourlyjob_detail.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/bottomcontainer_widget.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class Hourlyjob extends StatelessWidget {
  const Hourlyjob({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 236, 236, 1),
      body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //       'assets/app_bg_2.JPG',
          //     ),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // margin: EdgeInsets.only(top: 10.0),
          //color: Colors.grey,
          child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Card(
              child: Container(
                // decoration: BoxDecoration(
                //     border: Border(
                //         top: BorderSide(
                //             width: 2.0, color: Colors.amber[200]))),
                //width: 415.0,
                //width: MediaQuery.of(context).size,
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                // padding: EdgeInsets.only(top: 10.0, left: 20.0),
                height: 200,
                //color: Colors.blue,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/clock.jpg',
                      ),
                      height: 100,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'You can hire a Hunarmand on hourly ',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20.0,
                          letterSpacing: 0.5,
                          //wordSpacing: 3.8,
                        ),
                      ),
                    ),
                    Text(
                      'basis for the required services',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20.0,
                        letterSpacing: 0.5,
                        //wordSpacing: 3.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 5.0,
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            _descriptionCard(),
            SizedBox(
              height: 100.0,
            ),
            ButtonWidget(
              btnText: 'Post',
              onClick: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HourlyJobDetail()));
              },
            )
            //Bottom(),
          ],
        ),
      )),
    );
  }

  Widget _descriptionCard() {
//     GradientCard(
//     gradient: Gradients.tameer,
//     shadowColor: Gradients.tameer.colors.last.withOpacity(0.25),
//     elevation: 8,
// );
    return Card(
        //color: Color.fromRGBO(241, 236, 236, 1),
        elevation: 6.0,
        //shadowColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(15.0),
          height: 115,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _textWidget(
                      text: 'Hourly Wage.',
                      fontsize: 20.0,
                      fontW: FontWeight.normal,
                      fontcolor: Colors.black),
                  _textWidget(
                      text: 'Rs. 500/hr',
                      fontsize: 20.0,
                      fontW: FontWeight.bold),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                  padding: EdgeInsets.only(
                    // left: 15.0,
                    top: 5.0,
                  ),
                  child: _textWidget(
                      text:
                          'If it takes longer than 1 hour.PKR125 will be charged for every 15 miutes until completion',
                      fontsize: 17.0,
                      fontcolor: Colors.grey[800],
                      fontW: FontWeight.normal)),
            ],
          ),
        ));
  }

  Widget _textWidget({
    String text,
    double fontsize,
    Color fontcolor,
    FontWeight fontW,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: fontcolor,
        fontSize: fontsize,
        letterSpacing: 0.5,
        fontWeight: fontW,

        //wordSpacing: 3.8,
      ),
    );
  }
}
