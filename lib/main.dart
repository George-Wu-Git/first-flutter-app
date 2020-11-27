import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "what's your favorite color",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 3},
      ]
    },
    {
      'questionText': "what's your favorite animal",
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Dog', 'score': 50},
        {'text': 'Cat', 'score': 3},
        {'text': 'Whale', 'score': 10},
      ]
    },
    {
      'questionText': "what's your favorite animal",
      'answers': [
        {'text': 'George', 'score': 10},
        {'text': 'Kevin', 'score': 50},
        {'text': 'Man', 'score': 3},
        {'text': 'tim', 'score': 10},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
