import 'package:flutter/material.dart';
import 'package:kalendar/kalendar.dart';

class SimpleCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Kalendar(),
    );
  }
}
