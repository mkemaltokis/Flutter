import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(
      {super.key, required this.chooseAnswer, required this.goToResult});
  final void Function(String answer) chooseAnswer;
  final void Function() goToResult;
  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizScreen> {
  int selectedQuestionIndex = 0;

  void changeQuestion() {
    setState(() {
      if (questions.length - 1 > selectedQuestionIndex)
        selectedQuestionIndex++;
      else {
        setState(() {
          widget.goToResult();
        });
      }
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(questions[selectedQuestionIndex].question),
              ...questions[selectedQuestionIndex].answers.map((answer) {
                return ElevatedButton(
                    onPressed: () {
                      widget.chooseAnswer(answer);
                      changeQuestion();
                    },
                    child: Text(answer));
              })
            ],
          ),
        ),
      ),
    );
  }
}
