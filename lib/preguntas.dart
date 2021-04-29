import 'package:flutter/cupertino.dart';

List<Question> questions = [
  Question(statement: 'Quien es el dueño de SpaceX?', answer: "elon.jpg"),
  Question(statement: 'Quien es el fundador de Microsoft?', answer: "bill.jpg"),
  Question(statement: 'Quien es el creador de AppleCo.?', answer: "steve.jpg"),
];

class Question{
  String statement;
  String answer;

  Question( {String statement, String answer} ){
    this.statement = statement;
    this.answer = answer;
  }
}