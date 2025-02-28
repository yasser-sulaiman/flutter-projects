

class QuizQuestion {

  const QuizQuestion(this.text, this.options); //, this.correctOption);

  final String text;
  final List<String> options;
  // final int correctOption;

  // define a function as a getter
  List<String> get shuffledOptions{
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }

}