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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Center(
          child: Kalendar(
            markedDates: _events,
            markBuilder: (String event) {
              if (event == 'Hello') {
                return Text('1L', style: Theme.of(context).textTheme.caption);
              }
            },
            borderRadius: 8,
            showBorder: true,
            selectedDates: _selectedDates,
            onTap: (DateTime date, isSelected) {
              debugPrint(date.toIso8601String());
              if (isSelected) {
                _selectedDates[DateFormat('y-M-d').format(date)] = isSelected;
              } else {
                _selectedDates.remove(DateFormat('y-M-d').format(date));
              }

              setState(() {});
              print(_selectedDates);
            },
            weekBuilder: (weekdays) {
              return Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: List.generate(weekdays.length, (index) {
                    return Expanded(
                      child: Text(
                        '${weekdays[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
            dayTileMargin: 3,
        dayTileBuilder: (props) {
          return CustomDayTile(props);
        },
          ),
        ),
      ),
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


