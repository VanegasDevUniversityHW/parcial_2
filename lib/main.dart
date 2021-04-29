import 'package:flutter/material.dart';
import 'package:parcial_2/preguntas.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'preguntas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> answerPoints = [];
  int numberOfQuestion = 0;

  void verifyAnswer(String answer) {
    bool isAnswerCorrect = answer == questions[numberOfQuestion].answer;

    answerPoints.add(Icon(
      isAnswerCorrect ? Icons.check : Icons.close,
      color: isAnswerCorrect ? Colors.green : Colors.red,
    ));

    numberOfQuestion++;
  }

  void finishGame() {
    Alert(
      context: context,
      title: 'Final!',
      desc: 'Llegaste al final del cuestionario',
    ).show();

    numberOfQuestion = 0;
    answerPoints = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: Column(
                  children: [
                    Text(
                      questions[numberOfQuestion].statement,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontFamily: 'Lobster',
                      ),
                    )
                  ],
                )
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: FlatButton(
                  child: Image.asset("assets/images/bill.jpg"),
                  onPressed: () {
                    setState(() {
                      verifyAnswer("bill.jpg");

                      if (numberOfQuestion >= questions.length) {
                        finishGame();
                      }
                    });
                    //The user picked true.
                  },
                ),
              ),
            Expanded(
              child: FlatButton(
                  color: Colors.red,
                  child: Image.asset("assets/images/steve.jpg"),
                  onPressed: () {
                    setState(() {
                      verifyAnswer("steve.jpg");

                      if (numberOfQuestion >= questions.length) {
                        finishGame();
                      }
                    });
                    //The user picked false.
                  },
                ),
              ),
            Expanded(
              child: FlatButton(
                  child: Image.asset("assets/images/elon.jpg"),
                  onPressed: () {
                    setState(() {
                      verifyAnswer("elon.jpg");

                      if (numberOfQuestion >= questions.length) {
                        finishGame();
                      }
                    });
                    //The user picked true.
                  },
                ),
              ),
            Expanded(
              child: FlatButton(
                  color: Colors.red,
                  child: Image.asset("assets/images/robert.jpg"),
                  onPressed: () {
                    setState(() {
                      verifyAnswer("robert.jpg");

                      if (numberOfQuestion >= questions.length) {
                        finishGame();
                      }
                    });
                    //The user picked false.
                  },
                ),
            ),
          ],
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: answerPoints,
        )
      ],
    );
  }
}
