import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kalendar/kalendar.dart';

class CalendarWithMultiSelect extends StatefulWidget {
  @override
  _CalendarWithMultiSelectState createState() =>
      _CalendarWithMultiSelectState();
}

class _CalendarWithMultiSelectState extends State<CalendarWithMultiSelect> {
  final _selectedDates = HashMap<String, bool>();
  final _selectedDatesSet = HashSet<String>();
  Map<String, List<String>> _markedDates;

  @override
  void initState() {    
    super.initState();
    _markedDates = {
      '2019-04-10': [
        'hello'
      ]
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Kalendar(
              showBorder: true,
              borderRadius: 12,
              onTap: (DateTime dateTime, bool isSelected) {
                debugPrint(dateTime.toIso8601String());
                debugPrint('$isSelected');
                setState(() {
                  _selectedDates[formatDate(dateTime)] = isSelected;
                  if (isSelected) {
                    _selectedDatesSet.add(formatDate(dateTime));
                  } else {
                    _selectedDatesSet.remove(formatDate(dateTime));
                  }
                });
              },
              selectedDates: _selectedDates,
              markedDates: _markedDates,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(                                
                onPressed: () {
                  _selectedDatesSet.forEach((date) {
                    if (_markedDates[date] == null) {
                      _markedDates[date] = [];
                    }

                    _markedDates[date].add('red');
                  });

                  setState(() {});
                },
                child: Text('Mark selected dated'),
              ),              
            ],
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(_selectedDatesSet.toString()),
            ),
          )
          // Text('Hello')
        ],
      ),
    );
  }
}
