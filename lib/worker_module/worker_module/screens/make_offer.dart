import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/controllers/joboffer_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _auth = FirebaseAuth.instance;

class MakeOffer extends StatefulWidget {
  final String jobId;
  MakeOffer({this.jobId});
  @override
  _MakeOfferState createState() => _MakeOfferState();
}

class _MakeOfferState extends State<MakeOffer> {
  // @override
  // void initState() {
  //   final jobOfferprovider =
  //       Provider.of<JobOfferProvider>(context, listen: false);
  //   jobOfferprovider.changejobid = widget.jobId;
  //   jobOfferprovider.loadAll(null);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final offerdetailController = TextEditingController();

    final offerProvider = Provider.of<JobOfferProvider>(context);
    setState(() {
      offerProvider.changejobid = widget.jobId;
      offerProvider.changeoffersender = _auth.currentUser.displayName;
    });
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
              // controller: offerdetailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Describe your offer here",
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.all(20.0),
              ),
              maxLines: 15,
              onChanged: (String val) {
                offerProvider.changedetail = val;
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          ButtonWidget(
            btnText: 'SEND OFFER',
            onClick: () {
              offerProvider.saveoffers();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
