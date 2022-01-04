import 'package:calculatorapp/main.dart';
import 'package:calculatorapp/newContainer.dart';
import 'package:flutter/material.dart';

class SwitchMode extends StatefulWidget {
  @override
  _SwitchModeState createState() => _SwitchModeState();
}

class _SwitchModeState extends State<SwitchMode> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = darkmode;
    return NewContainer(
      darkModeCnt: darkMode,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.wb_sunny,
                color: darkMode ? Colors.grey : Colors.redAccent),
            Icon(Icons.nightlight_round,
                color: darkMode ? Colors.green : Colors.grey)
          ],
        ),
      ),
    );
  }
}
