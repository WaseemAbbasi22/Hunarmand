import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:flutter/material.dart';

class MakeOffer extends StatefulWidget {
  MakeOffer({Key key}) : super(key: key);

  @override
  _MakeOfferState createState() => _MakeOfferState();
}

class _MakeOfferState extends State<MakeOffer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      //width: double.infinity,
      //color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OFFER DESCRIPTION",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontFamily: 'Quicksand',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Card(
            elevation: 2,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Describe your offer here",
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.all(20.0),
                //labelText: 'Offer Description'

                //enabled: true,
                //filled: true,
                // prefixIcon: Icon(Icons.search, color: Colors.deepOrange),

                //suffixIcon: Icon(Icons.filter_list),
              ),
              maxLines: 15,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ButtonWidget(
            btnText: 'SEND OFFER',
            onClick: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
