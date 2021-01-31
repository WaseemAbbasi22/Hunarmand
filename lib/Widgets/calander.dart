import 'package:Hunarmand_signIn_Ui/utils/color.dart';
import 'package:Hunarmand_signIn_Ui/worker_module/worker_module/screens/my_orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const MaterialColor _buttonTextColor = MaterialColor(0xFFFF5722, <int, Color>{
  50: Colors.deepOrange,
  100: Colors.deepOrange,
  200: Colors.deepOrange,
  300: Colors.deepOrange,
  400: Colors.deepOrange,
  500: Colors.deepOrange,
  600: Colors.deepOrange,
  700: Colors.deepOrange,
  800: Colors.deepOrange,
  900: Colors.deepOrange,
});

Future<TimeOfDay> _selectTime(BuildContext context,
    {@required DateTime initialDate}) {
  final now = DateTime.now();

  return showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: initialDate.hour, minute: initialDate.minute),
      // initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.orange,
            accentColor: Colors.orange,
            primarySwatch: _buttonTextColor,
          ),
          child: child,
        );
      });
}

Future<DateTime> _selectDateTime(BuildContext context,
    {@required DateTime initialDate}) {
  final now = DateTime.now();
  final newestDate = initialDate.isAfter(now) ? initialDate : now;

  return showDatePicker(
      context: context,
      initialDate: newestDate.add(Duration(seconds: 1)),
      firstDate: now,
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primaryColor: deepOrangeColor,
            accentColor: deepOrangeColor,
            primarySwatch: _buttonTextColor,
          ),
          child: child,
        );
      });
}

Dialog showDateTimeDialog(
  BuildContext context, {
  @required ValueChanged<DateTime> onSelectedDate,
  @required DateTime initialDate,
}) {
  final dialog = Dialog(
    child: Schedule(onSelectedDate: onSelectedDate, initialDate: initialDate),
    //backgroundColor: Colors.red,
  );

  showDialog(context: context, builder: (BuildContext context) => dialog);
}

class Schedule extends StatefulWidget {
  final ValueChanged<DateTime> onSelectedDate;
  final DateTime initialDate;
  const Schedule({
    @required this.onSelectedDate,
    @required this.initialDate,
    Key key,
  }) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime selectedDate;

  @override
  void initState() {
    super.initState();

    selectedDate = widget.initialDate;
  }

  @override
//
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Job will only be scheduled between 8:00 am to 8:00 pm and it last upto one week',
              style: TextStyle(
                  fontSize: 16.0,
                  color: bluegrayColors,
                  fontWeight: FontWeight.bold,
                  height: 1.5),
            ),
          ),
          Text(
            'Select date and time',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.amber,
                child: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
                onPressed: () async {
                  final date =
                      await _selectDateTime(context, initialDate: selectedDate);
                  if (date == null) return;

                  setState(() {
                    selectedDate = DateTime(
                      date.year,
                      date.month,
                      date.day,
                      selectedDate.hour,
                      selectedDate.minute,
                    );
                  });

                  widget.onSelectedDate(selectedDate);
                },
              ),
              const SizedBox(width: 8),
              RaisedButton(
                color: Colors.amber,
                child: Text(DateFormat('HH:mm').format(selectedDate)),
                onPressed: () async {
                  final time =
                      await _selectTime(context, initialDate: selectedDate);
                  if (time == null) return;

                  setState(() {
                    selectedDate = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      time.hour,
                      time.minute,
                    );
                  });

                  widget.onSelectedDate(selectedDate);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          RaisedButton(
            color: Colors.deepOrange,
            child: Text('Done!'),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyOrders()));
            },

            // highlightColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
