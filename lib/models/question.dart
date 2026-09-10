class Question {
  final String questionText;      // نص السؤال
  final List<String> options;     // الخيارات (4 خيارات)
  final int correctAnswerIndex;   // رقم الإجابة الصحيحة (0-3)
  final String solution;          // خطوات الحل
  final String operationType;     // نوع العملية: جمع، طرح، ضرب، قسمة

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.solution,
    required this.operationType,
  });
}