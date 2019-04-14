import 'package:example/customized_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
      body: CustomizedCalendar()
    );
  }
}