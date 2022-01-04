import 'package:calculatorapp/main.dart';
import 'package:flutter/material.dart';
import 'newContainer.dart';

class MyButton extends StatelessWidget {
  double padding = 17;
  final String? title;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;
  final Function? callback;

  MyButton(
      {this.title, this.icon, this.iconColor, this.textColor, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!(title);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NewContainer(
          darkModeCnt: darkmode,
          borderRadius: BorderRadius.circular(40),
          padding: EdgeInsets.all(padding),
          child: Container(
            width: padding * 2,
            height: padding * 2,
            child: Center(
                child: title != null
                    ? Text(
                        '$title',
                        style: TextStyle(
                            color: textColor != null
                                ? textColor
                                : darkmode
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 30),
                      )
                    : Icon(
                        icon,
                        color: iconColor,
                        size: 30,
                      )),
          ),
        ),
      ),
    );
  }
}

bool darkMode = darkmode;

class MyButton2 extends StatelessWidget {
  final String? title;
  final double padding = 17;

  MyButton2({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: NewContainer(
          darkModeCnt: darkmode,
          borderRadius: BorderRadius.circular(50),
          padding:
              EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
          child: Container(
            width: padding * 2,
            child: Center(
              child: Text('$title',
                  style: TextStyle(
                      color: darkmode ? Colors.white : Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ));
  }
}
