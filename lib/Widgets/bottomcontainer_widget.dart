//import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      // height: 115,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textWidget(text: 'Total:'),
            _textWidget(text: 'Rs. 0'),
          ],
        ),
      ]),
    );
  }

  Widget _textWidget({String text}) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        letterSpacing: 0.5,
        fontWeight: FontWeight.bold,
        //wordSpacing: 3.8,
      ),
    );
  }
}
