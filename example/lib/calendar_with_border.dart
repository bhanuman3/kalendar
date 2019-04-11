import 'package:flutter/material.dart';
import 'package:kalendar/kalendar.dart';

class CalendarWithBorder extends StatefulWidget {
  @override
  _CalendarWithBorderState createState() => _CalendarWithBorderState();
}

class _CalendarWithBorderState extends State<CalendarWithBorder>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 0, end: 30).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 1), () {
            controller.reverse();
          });
        } else if (status == AnimationStatus.dismissed) {
          Future.delayed(Duration(seconds: 1), () {
            controller.forward();
          });
        }
      });

      controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Kalendar(
        showBorder: true,
        borderRadius: animation.value,
      ),
    );
  }
}
