import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:flutter/material.dart';

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
              height: MediaQuery.of(context).size.height * 0.43,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Help Center',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'In case of any inconvenience,fell free to call us our Administration Team will assist you',
                        style: TextStyle(
                            fontSize: 20, height: 1.5, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: deepOrangeColor,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 100.0),
                          child: Text(
                            'CALL NOW',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: deepOrangeColor,
                  radius: 60,
                  child: Icon(
                    Icons.add_ic_call,
                    color: Colors.white,
                    size: 60,
                  ),
                )),
          ],
        ));
  }
}
