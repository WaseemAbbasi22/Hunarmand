import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  SearchFilter({Key key}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  double _maxrange = 10000;
  double _minrange = 200;
  RangeValues values;
  @override
  Widget build(BuildContext context) {
    double currentrange = 0;
    values = RangeValues(_minrange, _maxrange);
    final _formkey = GlobalKey<FormState>();
    return Form(
      key: _formkey,
      child: Container(
        child: Column(
          children: [
            Text(
              'Search Filter',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            // TextFormField(
            //   validator: (val) => val.isEmpty ? 'please Enter Name' : null,
            //   // onChanged: (val) => setState(() => _currentName = val),
            // ),
            // SizedBox(
            //   height: 20.0,
            // ),
            //Dropdown
            // DropdownButtonFormField(
            //   value: userData.sugers ?? _currentSuger,
            //   items: sugers.map((suger) {
            //     return DropdownMenuItem(
            //       value: suger,
            //       child: Text('$suger sugers'),
            //     );
            //   }).toList(),
            //   onChanged: (val) => setState(() => _currentSuger = val),
            // ),
            SizedBox(
              height: 20.0,
            ),

            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Budget Range ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  'Rs. ${_minrange.toString()}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Text(
                  '-',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Rs.${_maxrange.toString()}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: RangeSlider(
                activeColor: Colors.red,
                inactiveColor: Colors.white,
                min: 0,
                max: 10000,
                values: values,
                divisions: 20,
                // //value: (_minrange ?? 200).toDouble(),
                onChanged: (val) {
                  setState(() {
                    values = val;
                  });
                },

                //setState(() => _currentStrength = val.round()),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Specific Location',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              IconButton(
                icon: Icon(
                  Icons.place,
                  color: Colors.deepOrange,
                ),
                onPressed: () {},
              ),
            ]),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              elevation: 10.0,
              color: Colors.deepOrange[500],
              child: Text(
                "APPLY",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.pop(context);
                // if (_formkey.currentState.validate()) {
                //   await DatabaseService(uid: user.uid).updateUserData(
                //       _currentSuger ?? userData.sugers,
                //       _currentName ?? userData.name,
                //       _currentStrength ?? userData.strength);
                //   Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
