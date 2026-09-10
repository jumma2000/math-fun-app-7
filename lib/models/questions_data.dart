import '../models/question.dart';

List<Question> allQuestions = [
  // ===== جمع ===== (أسئلة 1-4)
  Question(
    questionText: 'ما ناتج ¼ + ¼؟',
    options: ['½', '¼', '1', '¾'],
    correctAnswerIndex: 0,
    solution: '¼ + ¼ = (1+1)/4 = 2/4 = ½',
    operationType: 'جمع',
  ),
  Question(
    questionText: 'ما ناتج ½ + ¼؟',
    options: ['¾', '½', '¼', '1'],
    correctAnswerIndex: 0,
    solution: '½ + ¼ = 2/4 + 1/4 = 3/4 = ¾',
    operationType: 'جمع',
  ),
  Question(
    questionText: 'ما ناتج ⅓ + ⅓؟',
    options: ['⅔', '⅓', '1', '½'],
    correctAnswerIndex: 0,
    solution: '⅓ + ⅓ = (1+1)/3 = 2/3 = ⅔',
    operationType: 'جمع',
  ),
  Question(
    questionText: 'ما ناتج ½ + ½؟',
    options: ['1', '½', '¾', '¼'],
    correctAnswerIndex: 0,
    solution: '½ + ½ = (1+1)/2 = 2/2 = 1',
    operationType: 'جمع',
  ),

  // ===== طرح ===== (أسئلة 5-8)
  Question(
    questionText: 'ما ناتج ¾ - ¼؟',
    options: ['½', '¼', '1', '¾'],
    correctAnswerIndex: 0,
    solution: '¾ - ¼ = (3-1)/4 = 2/4 = ½',
    operationType: 'طرح',
  ),
  Question(
    questionText: 'ما ناتج 1 - ½؟',
    options: ['½', '¼', '¾', '1'],
    correctAnswerIndex: 0,
    solution: '1 - ½ = 2/2 - 1/2 = 1/2 = ½',
    operationType: 'طرح',
  ),
  Question(
    questionText: 'ما ناتج ⅔ - ⅓؟',
    options: ['⅓', '⅔', '1', '½'],
    correctAnswerIndex: 0,
    solution: '⅔ - ⅓ = (2-1)/3 = 1/3 = ⅓',
    operationType: 'طرح',
  ),
  Question(
    questionText: 'ما ناتج ⅘ - ⅕؟',
    options: ['⅗', '⅘', '1', '½'],
    correctAnswerIndex: 0,
    solution: '⅘ - ⅕ = (4-1)/5 = 3/5 = ⅗',
    operationType: 'طرح',
  ),

  // ===== ضرب ===== (أسئلة 9-12)
  Question(
    questionText: 'ما ناتج ½ × ½؟',
    options: ['¼', '½', '¾', '1'],
    correctAnswerIndex: 0,
    solution: '½ × ½ = (1×1)/(2×2) = 1/4 = ¼',
    operationType: 'ضرب',
  ),
  Question(
    questionText: 'ما ناتج ⅓ × ½؟',
    options: ['⅙', '⅓', '½', '¼'],
    correctAnswerIndex: 0,
    solution: '⅓ × ½ = (1×1)/(3×2) = 1/6 = ⅙',
    operationType: 'ضرب',
  ),
  Question(
    questionText: 'ما ناتج ¾ × ⅓؟',
    options: ['¼', '½', '¾', '⅓'],
    correctAnswerIndex: 0,
    solution: '¾ × ⅓ = (3×1)/(4×3) = 3/12 = 1/4 = ¼',
    operationType: 'ضرب',
  ),
  Question(
    questionText: 'ما ناتج ⅔ × ¾؟',
    options: ['½', '⅓', '¼', '¾'],
    correctAnswerIndex: 0,
    solution: '⅔ × ¾ = (2×3)/(3×4) = 6/12 = 1/2 = ½',
    operationType: 'ضرب',
  ),

  // ===== قسمة ===== (أسئلة 13-15)
  Question(
    questionText: 'ما ناتج ½ ÷ ¼؟',
    options: ['2', '½', '¼', '1'],
    correctAnswerIndex: 0,
    solution: '½ ÷ ¼ = ½ × 4/1 = (1×4)/(2×1) = 4/2 = 2',
    operationType: 'قسمة',
  ),
  Question(
    questionText: 'ما ناتج ¾ ÷ ½؟',
    options: ['1½', '¾', '½', '1'],
    correctAnswerIndex: 0,
    solution: '¾ ÷ ½ = ¾ × 2/1 = (3×2)/(4×1) = 6/4 = 3/2 = 1½',
    operationType: 'قسمة',
  ),
  Question(
    questionText: 'ما ناتج ⅓ ÷ ⅓؟',
    options: ['1', '⅓', '⅙', '½'],
    import '../models/question.dart';
import '../data/questions_data.dart';
import 'dart:math';

class QuizEngine {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  List<int> selectedAnswers = []; // -1 يعني لم يتم الإجابة بعد

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

  Question getCurrentQuestion() {
    return questions[currentQuestionIndex];
  }

  bool get isLastQuestion {
    return currentQuestionIndex == questions.length - 1;
  }

  bool get isQuizComplete {
    return selectedAnswers.every((answer) => answer != -1);
  }

  void selectAnswer(int answerIndex) {
    if (selectedAnswers[currentQuestionIndex] != -1) return; // تم الإجابة مسبقاً

    selectedAnswers[currentQuestionIndex] = answerIndex;

    if (answerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
      correctAnswers++;
    } else {
      wrongAnswers++;
    }
  }

  void nextQuestion() {
    if (!isLastQuestion) {
      currentQuestionIndex++;
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      currentQuestionIndex--;
    }
  }

  int getTotalQuestions() {
    return questions.length;
  }

  int getCurrentQuestionNumber() {
    return currentQuestionIndex + 1;
  }

  double getProgress() {
    return (currentQuestionIndex + 1) / questions.length;
  }

  bool isAnswerSelected(int index) {
    return selectedAnswers[currentQuestionIndex] == index;
  }

  bool isAnswerCorrect(int index) {
    return index == questions[currentQuestionIndex].correctAnswerIndex;
  }

  bool hasAnswered() {
    return selectedAnswers[currentQuestionIndex] != -1;
  }

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

  String getSolution() {
    return questions[currentQuestionIndex].solution;
  }

  String getOperationType() {
    return questions[currentQuestionIndex].operationType;
  }
}ndex: 0,
    solution: '⅓ ÷ ⅓ = ⅓ × 3/1 = (1×3)/(3×1) = 3/3 = 1',
    operationType: 'قسمة',
  ),
];