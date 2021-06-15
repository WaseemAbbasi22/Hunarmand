import 'package:Hunarmand_signIn_Ui/Screens/home/slider.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Cslider(),
          SizedBox(
            height: 30.0,
          ),
          // Card(
          //   elevation: 4,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 8),
          //     child: TextField(
          //       decoration: InputDecoration(
          //         border: InputBorder.none,
          //         hintText: "Search",
          //         fillColor: Colors.white,
          //         //filled: true,

          //         prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
          //         //suffixIcon: Icon(Icons.filter_list),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
