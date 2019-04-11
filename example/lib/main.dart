import 'package:example/calendar_with_border.dart';
import 'package:example/simple_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kalendar/kalendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, List<String>> _events;

  Map<String, bool> _selectedDates;

  @override
  void initState() {
    super.initState();
    _events = Map();
    _events[DateFormat('y-M-d').format(DateTime.now())] = ['Hello'];
    _events[DateFormat('y-M-d').format(DateTime(2019, 4, 5))] = ['Hello'];

    _selectedDates = Map<String, bool>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalendar Demo'),
      ),
      body: CalendarWithBorder()
    );
  }
}

class CustomDayTile extends StatelessWidget {
  final DayProps props;

  CustomDayTile(this.props);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(props.dayTileMargin ?? 3),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: props.dayTileBorderColor ?? Colors.grey,
        ),
        borderRadius: BorderRadius.circular(props.borderRadius),
        color: props.isSelected ? Colors.green : Colors.transparent,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '${props.dateTime.day}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: props.isDayOfCurrentMonth
                      ? Colors.black87
                      : props.isSelected ? Colors.white54 : Colors.grey,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: EventMarks(props.events, markBuilder: props.markBuilder),
          ),
        ],
      ),
    );
  }
}
