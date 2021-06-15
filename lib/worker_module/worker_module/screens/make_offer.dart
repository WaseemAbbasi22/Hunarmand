import 'package:Hunarmand_signIn_Ui/Widgets/btn_widget.dart';
import 'package:Hunarmand_signIn_Ui/controllers/joboffer_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _auth = FirebaseAuth.instance;

class MakeOffer extends StatefulWidget {
  final String jobId;
  final GlobalKey<ScaffoldState> scaffoldKey;
  MakeOffer({this.jobId, this.scaffoldKey});
  @override
  _MakeOfferState createState() => _MakeOfferState();
}

class _MakeOfferState extends State<MakeOffer> {
  final _formKey = GlobalKey<FormState>();

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
    // final offerdetailController = TextEditingController();

    final offerProvider = Provider.of<JobOfferProvider>(context);

    return Container(
      padding: EdgeInsets.all(10.0),
      //width: double.infinity,
      //color: Colors.grey[200],
      child: Form(
        key: _formKey,
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
            TextFormField(
              // controller: offerdetailController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your offer budget';
                }
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your offer budget",
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.all(20.0),
              ),

              onChanged: (String val) {
                offerProvider.changeofferbudget = int.parse(val);
              },
            ),
            Card(
              elevation: 2,
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: TextFormField(
                // controller: offerdetailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
                if (_formKey.currentState.validate()) {
                  offerProvider.changejobid = widget.jobId;

                  offerProvider.changeoffersender =
                      _auth.currentUser.displayName;
                  offerProvider.saveoffers();
                  Navigator.pop(context);
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('please describe offer'),
                    duration: Duration(seconds: 3),
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
