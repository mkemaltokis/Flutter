import 'package:flutter/material.dart';
import 'package:introapp/home_screen.dart';
import 'package:introapp/quiz_screen.dart';
import 'package:introapp/result_screen.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  String activeScreenName = "home-screen";
  List<String> userAnswers = [];

  void goToQuiz() {
    setState(() {
      activeScreenName = "quiz-screen";
    });
  }

  void goToResult() {
    setState(() {
      activeScreenName = "result-screen";
    });
  }

  void addAnswer(String answer) {
    userAnswers.add(answer);
    print("Listeye yeni cevap eklendi:");
    print(userAnswers);
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;

    if (activeScreenName == "home-screen") {
      activeScreen = HomeScreen(goToQuiz);
    } else if (activeScreenName == "quiz-screen") {
      activeScreen = QuizScreen(
        chooseAnswer: (answer) => addAnswer(answer),
        goToResult: goToResult,
      );
    } else {
      activeScreen = ResultScreen(userAnswers: userAnswers);
    }

    return Container(
      child: activeScreen,
    );
  }
}
