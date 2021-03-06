import 'package:Hunarmand_signIn_Ui/Models/Worker_model.dart';
import 'package:Hunarmand_signIn_Ui/Widgets/rating_bar.dart';
import 'package:Hunarmand_signIn_Ui/commons/radial_progressbar.dart';
import 'package:Hunarmand_signIn_Ui/commons/ridial_image.dart';
import 'package:flutter/material.dart';

class TopWorkers extends StatelessWidget {
  const TopWorkers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      padding: EdgeInsets.all(10.0),
      // margin: EdgeInsets.only(bottom: 30.0),
      //color: Colors.grey[200],
      height: 180.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: workers.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                // height: 500,
                // padding: EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  // color: Colors.red,

                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RadialProgress(
                      width: 4,
                      goalCompleted: 0.9,
                      child: RoundedImage(
                        imagePath: workers[index].imageUrl,
                        size: Size.fromWidth(40.0),
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 30.0,
                    //   backgroundImage: AssetImage(workers[index].imageUrl),
                    // ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      workers[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'avenir',
                        letterSpacing: 1.5,
                      ),
                    ),
                    // Text(
                    //   "$_rating",
                    //   style: TextStyle(
                    //       color: Colors.black,
                    //       //`fontFamily: 'Avenir',
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.w700),
                    // ),
                    RatingBar(rating: 4.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
