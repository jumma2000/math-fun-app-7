import '../models/question.dart';
import '../data/questions_data.dart';
import 'dart:math';

class QuizEngine {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  List<int> selectedAnswers = [];

  QuizEngine() {
    _loadQuestions();
  }

  void _loadQuestions() {
    questions = List.from(allQuestions);
    _shuffleQuestions();
    selectedAnswers = List.filled(questions.length, -1);
  }

  void _shuffleQuestions() {
    final random = Random();
    questions.shuffle(random);
  }

  Question getCurrentQuestion() => questions[currentQuestionIndex];

  bool get isLastQuestion => currentQuestionIndex == questions.length - 1;

  bool get isQuizComplete => selectedAnswers.every((answer) => answer != -1);

  void selectAnswer(int answerIndex) {
    if (selectedAnswers[currentQuestionIndex] != -1) return;
    selectedAnswers[currentQuestionIndex] = answerIndex;
    if (answerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      correctAnswers++;
    } else {
      wrongAnswers++;
    }
  }

  void nextQuestion() {
    if (!isLastQuestion) currentQuestionIndex++;
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) currentQuestionIndex--;
  }

  int getTotalQuestions() => questions.length;
  int getCurrentQuestionNumber() => currentQuestionIndex + 1;
  double getProgress() => (currentQuestionIndex + 1) / questions.length;

  bool isAnswerSelected(int index) =>
      selectedAnswers[currentQuestionIndex] == index;

  bool isAnswerCorrect(int index) =>
      index == questions[currentQuestionIndex].correctAnswerIndex;

  bool hasAnswered() => selectedAnswers[currentQuestionIndex] != -1;

  int getCorrectAnswers() => correctAnswers;
  int getWrongAnswers() => wrongAnswers;

  String getEvaluation() {
    double percentage = (correctAnswers / questions.length) * 100;
    if (percentage >= 80) return 'ممتاز 🏆';
    if (percentage >= 60) return 'جيد 👍';
    if (percentage >= 40) return 'متوسط 📚';
    return 'ضعيف 💪';
  }

  String getEvaluationMessage() {
    double percentage = (correctAnswers / questions.length) * 100;
    if (percentage >= 80) {
      return 'أداء رائع! أنت خبير في الكسور!';
    } else if (percentage >= 60) {
      return 'أداء جيد! تحتاج إلى مراجعة بعض المفاهيم.';
    } else if (percentage >= 40) {
      return 'تحتاج إلى المزيد من التمارين. استمر في التعلم!';
    } else {
      return 'لا بأس! الجميع يبدأ من الصفر. تدرب أكثر وستتحسن.';
    }
  }

  void reset() {
    currentQuestionIndex = 0;
    correctAnswers = 0;
    wrongAnswers = 0;
    _loadQuestions();
  }

  String getSolution() => questions[currentQuestionIndex].solution;
  String getOperationType() => questions[currentQuestionIndex].operationType;
}