import 'dart:math';
import '../models/question.dart';

/// محرك الاختبار — يدير عمليات الاختبار لأي درس
class QuizEngine {
  // ===== المتغيرات =====
  final List<Question> questions;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  List<int> selectedAnswers = [];

  // ===== البداية =====
  QuizEngine({required List<Question> questions})
      : questions = List.from(questions) {
    try {
      _shuffleQuestions();
      selectedAnswers = List.filled(this.questions.length, -1);
    } catch (e) {
      print('خطأ في تهيئة المحرك: $e');
    }
  }

  // ===== خلط الأسئلة =====
  void _shuffleQuestions() {
    try {
      final random = Random();
      questions.shuffle(random);
    } catch (e) {
      print('خطأ في خلط الأسئلة: $e');
    }
  }

  // ===== السؤال الحالي =====
  Question getCurrentQuestion() {
    try {
      return questions[currentQuestionIndex];
    } catch (e) {
      return questions.first;
    }
  }

  // ===== هل هذا آخر سؤال؟ =====
  bool get isLastQuestion => currentQuestionIndex == questions.length - 1;

  // ===== هل الاختبار مكتمل؟ =====
  bool get isQuizComplete => selectedAnswers.every((answer) => answer != -1);

  // ===== اختيار إجابة =====
  void selectAnswer(int answerIndex) {
    try {
      if (selectedAnswers[currentQuestionIndex] != -1) return;
      selectedAnswers[currentQuestionIndex] = answerIndex;

      if (answerIndex == questions[currentQuestionIndex].correctAnswerIndex) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
    } catch (e) {
      print('خطأ في اختيار الإجابة: $e');
    }
  }

  // ===== السؤال التالي =====
  void nextQuestion() {
    try {
      if (!isLastQuestion) currentQuestionIndex++;
    } catch (e) {
      print('خطأ في الانتقال: $e');
    }
  }

  // ===== السؤال السابق =====
  void previousQuestion() {
    try {
      if (currentQuestionIndex > 0) currentQuestionIndex--;
    } catch (e) {
      print('خطأ في الرجوع: $e');
    }
  }

  // ===== عدد الأسئلة =====
  int getTotalQuestions() => questions.length;

  // ===== رقم السؤال الحالي =====
  int getCurrentQuestionNumber() => currentQuestionIndex + 1;

  // ===== نسبة التقدم =====
  double getProgress() {
    if (questions.isEmpty) return 0.0;
    return (currentQuestionIndex + 1) / questions.length;
  }

  // ===== هل الإجابة مختارة؟ =====
  bool isAnswerSelected(int index) =>
      selectedAnswers[currentQuestionIndex] == index;

  // ===== هل الإجابة صحيحة؟ =====
  bool isAnswerCorrect(int index) =>
      index == questions[currentQuestionIndex].correctAnswerIndex;

  // ===== هل تمت الإجابة؟ =====
  bool hasAnswered() => selectedAnswers[currentQuestionIndex] != -1;

  // ===== عدد الإجابات الصحيحة =====
  int getCorrectAnswers() => correctAnswers;

  // ===== عدد الإجابات الخاطئة =====
  int getWrongAnswers() => wrongAnswers;

  // ===== النسبة المئوية =====
  double getPercentage() {
    if (questions.isEmpty) return 0.0;
    return (correctAnswers / questions.length) * 100;
  }

  // ===== التقييم =====
  String getEvaluation() {
    double percentage = getPercentage();
    if (percentage >= 80) return 'ممتاز 🏆';
    if (percentage >= 60) return 'جيد 👍';
    if (percentage >= 40) return 'متوسط 📚';
    return 'ضعيف 💪';
  }

  // ===== رسالة التقييم =====
  String getEvaluationMessage() {
    double percentage = getPercentage();
    if (percentage >= 80) {
      return 'أداء رائع! أنت خبير في هذا الدرس!';
    } else if (percentage >= 60) {
      return 'أداء جيد! تحتاج إلى مراجعة بعض المفاهيم.';
    } else if (percentage >= 40) {
      return 'تحتاج إلى المزيد من التمارين. استمر في التعلم!';
    } else {
      return 'لا بأس! الجميع يبدأ من الصفر. تدرب أكثر وستتحسن.';
    }
  }

  // ===== إعادة الاختبار =====
  void reset() {
    try {
      currentQuestionIndex = 0;
      correctAnswers = 0;
      wrongAnswers = 0;
      selectedAnswers = List.filled(questions.length, -1);
      _shuffleQuestions();
    } catch (e) {
      print('خطأ في إعادة الاختبار: $e');
    }
  }

  // ===== الحل =====
  String getSolution() {
    try {
      return questions[currentQuestionIndex].solution;
    } catch (e) {
      return 'لا يوجد حل متاح';
    }
  }

  // ===== نوع العملية =====
  String getOperationType() {
    try {
      return questions[currentQuestionIndex].operationType;
    } catch (e) {
      return 'غير محدد';
    }
  }
}