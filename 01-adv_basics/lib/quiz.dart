import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(startQuiz);
  //   super.initState();
  // }

  // void startQuiz() {
  //   setState(() {
  //     activeScreen = QuestionsScreen();
  //   });
  // }
  List<String> selectedAnswers = [];
  String activeScreen = 'start';

  void startQuiz() {
    setState(() {
      activeScreen = 'questions';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start';
    });
  }

  void chooseOption(String option) {
    selectedAnswers.add(option);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(startQuiz);

    if (activeScreen == 'start') {
      screenWidget = StartScreen(startQuiz);
    } else if (activeScreen == 'questions') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseOption);
    } else if (activeScreen == 'results') {
      screenWidget = ResultsScreen(selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 95, 3, 86),
                const Color.fromARGB(255, 233, 6, 6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
