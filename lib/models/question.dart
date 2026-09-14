/// نموذج السؤال — يمثل سؤالاً واحداً في الاختبار
class Question {
  // ===== الحقول الأساسية =====
  final String questionText;      // نص السؤال
  final List<String> options;     // الخيارات (2-4 خيارات)
  final int correctAnswerIndex;   // رقم الإجابة الصحيحة (0-3)
  final String solution;          // خطوات الحل
  final String operationType;     // نوع العملية: جمع، طرح، ضرب، قسمة

  // ===== الحقول الإضافية =====
  final String? lessonId;         // معرف الدرس (اختياري)
  final String? hint;             // تلميح (اختياري)
  final int difficulty;           // مستوى الصعوبة: 1=سهل، 2=متوسط، 3=صعب

  // ===== البناء =====
  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.solution,
    required this.operationType,
    this.lessonId,
    this.hint,
    this.difficulty = 2,
  });

  // ===== التحقق من صحة البيانات =====
  bool get isValid {
    return questionText.isNotEmpty &&
        options.isNotEmpty &&
        correctAnswerIndex >= 0 &&
        correctAnswerIndex < options.length &&
        solution.isNotEmpty &&
        operationType.isNotEmpty;
  }

  // ===== عدد الخيارات =====
  int get optionsCount => options.length;

  // ===== هل السؤال صعب؟ =====
  bool get isHard => difficulty == 3;
  bool get isEasy => difficulty == 1;

  // ===== من JSON إلى Question =====
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['question_text'] ?? '',
      options: List<String>.from(json['options'] ?? []),
      correctAnswerIndex: json['correct_answer_index'] ?? 0,
      solution: json['solution'] ?? '',
      operationType: json['operation_type'] ?? '',
      lessonId: json['lesson_id'],
      hint: json['hint'],
      difficulty: json['difficulty'] ?? 2,
    );
  }

  // ===== من Question إلى JSON =====
  Map<String, dynamic> toJson() {
    return {
      'question_text': questionText,
      'options': options,
      'correct_answer_index': correctAnswerIndex,
      'solution': solution,
      'operation_type': operationType,
      'lesson_id': lessonId,
      'hint': hint,
      'difficulty': difficulty,
    };
  }

  // ===== نسخ السؤال مع تعديل بعض الحقول =====
  Question copyWith({
    String? questionText,
    List<String>? options,
    int? correctAnswerIndex,
    String? solution,
    String? operationType,
    String? lessonId,
    String? hint,
    int? difficulty,
  }) {
    return Question(
      questionText: questionText ?? this.questionText,
      options: options ?? this.options,
      correctAnswerIndex: correctAnswerIndex ?? this.correctAnswerIndex,
      solution: solution ?? this.solution,
      operationType: operationType ?? this.operationType,
      lessonId: lessonId ?? this.lessonId,
      hint: hint ?? this.hint,
      difficulty: difficulty ?? this.difficulty,
    );
  }

  // ===== للطباعة =====
  @override
  String toString() {
    return 'Question(questionText: $questionText, operationType: $operationType)';
  }
}