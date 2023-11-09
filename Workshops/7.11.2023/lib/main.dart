import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(QuestionApp());

class QuestionApp extends StatefulWidget {
  @override
  _QuestionAppState createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  int _questionIndex = 0;

  void _nextQuestion() {
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Soru-Cevap Uygulaması'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                questions[_questionIndex].questionText,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: questions[_questionIndex]
                  .options
                  .map((option) => ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text(option),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
