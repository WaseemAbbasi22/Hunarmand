import 'package:Hunarmand_signIn_Ui/commons/form_textfeild.dart';
import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class DummyMap extends StatelessWidget {
  const DummyMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: deepOrangeColor,
          title: Text('Chose Location'),
        ),
        body: Column(
          children: [
            FormInputFeild(
              hintText: 'search Location',
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/google_map_bg.jpg'),
                      fit: BoxFit.fill),
                )),
          ],
        ));
  }
}
