import 'package:calculatorapp/button.dart';
import 'package:calculatorapp/newContainer.dart';
import 'package:calculatorapp/switchmode.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

bool darkmode = false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userQuestion = '';
  String _answer = '';

  void numClick(String title) {
    setState(() {
      _userQuestion += title;
    });
  }

  void allClear(String title) {
    setState(() {
      _answer = '';
      _userQuestion = '';
    });
  }

  void clear(String title) {
    setState(() {
      _userQuestion = title;
    });
  }

  void evaluate(String title) {
    Parser p = Parser();
    Expression exp = p.parse(_userQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _answer = _userQuestion;
      _answer = eval.toString();
    });
  }

  buttonPressed(String title) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkmode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            darkmode ? darkmode = false : darkmode = true;
                          });
                        },
                        child: SwitchMode()),
                    SizedBox(height: 40),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _answer,
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: darkmode ? Colors.white : Colors.red),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '=',
                          style: TextStyle(
                              fontSize: 35,
                              color: darkmode ? Colors.green : Colors.grey),
                        ),
                        Text(
                          _userQuestion,
                          style: TextStyle(
                              fontSize: 20,
                              color: darkmode ? Colors.green : Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton2(title: 'sin'),
                        MyButton2(title: 'cos'),
                        MyButton2(title: 'tan'),
                        MyButton2(title: '%'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                          title: 'C',
                          callback: allClear,
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                        MyButton(title: '('),
                        MyButton(title: ')'),
                        MyButton(
                          title: '/',
                          callback: numClick,
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                          title: '7',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '8',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '9',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '*',
                          callback: numClick,
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                          title: '4',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '5',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '6',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '-',
                          callback: numClick,
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                          title: '1',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '2',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '3',
                          callback: numClick,
                        ),
                        MyButton(
                          title: '+',
                          callback: numClick,
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyButton(
                          title: '0',
                          callback: numClick,
                        ),
                        MyButton(title: ','),
                        MyButton(
                          icon: Icons.backspace_outlined,
                          iconColor: darkmode ? Colors.green : Colors.redAccent,
                        ),
                        MyButton(
                          title: '=',
                          callback: evaluate,
                          textColor: darkmode ? Colors.green : Colors.redAccent,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
