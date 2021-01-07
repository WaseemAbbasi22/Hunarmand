import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const MaterialColor _buttonTextColor = MaterialColor(0xFFFFA726, <int, Color>{
  50: Colors.orange,
  100: Colors.orange,
  200: Colors.orange,
  300: Colors.orange,
  400: Colors.orange,
  500: Colors.orange,
  600: Colors.orange,
  700: Colors.orange,
  800: Colors.orange,
  900: Colors.orange,
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
            primaryColor: Colors.orange,
            accentColor: Colors.orange,
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
                color: Colors.orange[500],
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
                color: Colors.orange[500],
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
            color: Color(0xFFFFA726),
            child: Text('Done!'),
            onPressed: () {
              Navigator.of(context).pop();
            },

            // highlightColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
