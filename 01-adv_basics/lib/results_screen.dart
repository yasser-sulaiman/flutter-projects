import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.results, this.onRestart,{super.key});

  final List<String> results;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < results.length; i++) {
      summaryData.add(
        {
          'question': questions[i].text,
          'user_answer': results[i],
          'correct_answer': questions[i].options[0],
          'question_index': i,
        },
      );
    }

    return summaryData;
  }

  void restartQuiz() {
    //
  }

  @override
  Widget build(BuildContext context) {
    final totalNumberOfQuestions = questions.length;
    final summary = getSummaryData();
    final totalCorrectAnswers = summary.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $totalCorrectAnswers out of $totalNumberOfQuestions questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            //ListView(),
            QuestionsSummary(summary),
            const SizedBox(height: 20),
            TextButton(
              onPressed: onRestart,
              child: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
