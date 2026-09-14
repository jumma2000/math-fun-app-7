import '../models/question.dart';

/// ============================================================
/// قائمة الأسئلة الكاملة — 15 سؤالاً متنوعاً
/// ============================================================
/// 
/// ملاحظة: تم توزيع الإجابات الصحيحة على خانات مختلفة
/// (0, 1, 2, 3) عشان الطالب ما يحفظش مكان الإجابة.
/// 
/// ============================================================

List<Question> allQuestions = [
  // ==========================================================
  // ===== جمع ===== (4 أسئلة)
  // ==========================================================
  
  Question(
    questionText: 'ما ناتج ¼ + ¼؟',
    options: ['½', '¼', '1', '¾'],
    correctAnswerIndex: 0, // الإجابة الصحيحة: ½
    solution: '¼ + ¼ = (1+1)/4 = 2/4 = ½',
    operationType: 'جمع',
    lessonId: 'lesson_1',
    hint: 'اجمع البسط (1+1)',
    difficulty: 1,
  ),
  Question(
    questionText: 'ما ناتج ½ + ¼؟',
    options: ['½', '¾', '¼', '1'],
    correctAnswerIndex: 1, // الإجابة الصحيحة: ¾
    solution: '½ + ¼ = 2/4 + 1/4 = 3/4 = ¾',
    operationType: 'جمع',
    lessonId: 'lesson_1',
    hint: 'وحّد المقامات أولاً',
    difficulty: 2,
  ),
  Question(
    questionText: 'ما ناتج ⅓ + ⅓؟',
    options: ['⅓', '1', '⅔', '½'],
    correctAnswerIndex: 2, // الإجابة الصحيحة: ⅔
    solution: '⅓ + ⅓ = (1+1)/3 = 2/3 = ⅔',
    operationType: 'جمع',
    lessonId: 'lesson_1',
    hint: 'المقامات متساوية، اجمع البسط فقط',
    difficulty: 1,
  ),
  Question(
    questionText: 'ما ناتج ½ + ½؟',
    options: ['½', '¼', '¾', '1'],
    correctAnswerIndex: 3, // الإجابة الصحيحة: 1
    solution: '½ + ½ = (1+1)/2 = 2/2 = 1',
    operationType: 'جمع',
    lessonId: 'lesson_1',
    hint: 'نصف + نصف = واحد كامل',
    difficulty: 1,
  ),

  // ==========================================================
  // ===== طرح ===== (4 أسئلة)
  // ==========================================================

  Question(
    questionText: 'ما ناتج ¾ - ¼؟',
    options: ['½', '¼', '1', '¾'],
    correctAnswerIndex: 0, // الإجابة الصحيحة: ½
    solution: '¾ - ¼ = (3-1)/4 = 2/4 = ½',
    operationType: 'طرح',
    lessonId: 'lesson_2',
    hint: 'اطرح البسط (3-1)',
    difficulty: 1,
  ),
  Question(
    questionText: 'ما ناتج 1 - ½؟',
    options: ['½', '¼', '¾', '1'],
    correctAnswerIndex: 0, // الإجابة الصحيحة: ½
    solution: '1 - ½ = 2/2 - 1/2 = 1/2 = ½',
    operationType: 'طرح',
    lessonId: 'lesson_2',
    hint: 'حوّل 1 إلى 2/2',
    difficulty: 2,
  ),
  Question(
    questionText: 'ما ناتج ⅔ - ⅓؟',
    options: ['⅔', '⅓', '1', '½'],
    correctAnswerIndex: 1, // الإجابة الصحيحة: ⅓
    solution: '⅔ - ⅓ = (2-1)/3 = 1/3 = ⅓',
    operationType: 'طرح',
    lessonId: 'lesson_2',
    hint: 'اطرح البسط (2-1)',
    difficulty: 1,
  ),
  Question(
    questionText: 'ما ناتج ⅘ - ⅕؟',
    options: ['⅘', '1', '⅗', '½'],
    correctAnswerIndex: 2, // الإجابة الصحيحة: ⅗
    solution: '⅘ - ⅕ = (4-1)/5 = 3/5 = ⅗',
    operationType: 'طرح',
    lessonId: 'lesson_2',
    hint: 'اطرح البسط (4-1)',
    difficulty: 1,
  ),

  // ==========================================================
  // ===== ضرب ===== (4 أسئلة)
  // ==========================================================

  Question(
    questionText: 'ما ناتج ½ × ½؟',
    options: ['¼', '½', '¾', '1'],
    correctAnswerIndex: 0, // الإجابة الصحيحة: ¼
    solution: '½ × ½ = (1×1)/(2×2) = 1/4 = ¼',
    operationType: 'ضرب',
    lessonId: 'lesson_3',
    hint: 'اضرب البسط في البسط والمقام في المقام',
    difficulty: 1,
  ),
  Question(
    questionText: 'ما ناتج ⅓ × ½؟',
    options: ['½', '⅙', '⅓', '¼'],
    correctAnswerIndex: 1, // الإجابة الصحيحة: ⅙
    solution: '⅓ × ½ = (1×1)/(3×2) = 1/6 = ⅙',
    operationType: 'ضرب',
    lessonId: 'lesson_3',
    hint: 'اضرب البسط × البسط، والمقام × المقام',
    difficulty: 2,
  ),
  Question(
    questionText: 'ما ناتج ¾ × ⅓؟',
    options: ['½', '¾', '¼', '⅓'],
    correctAnswerIndex: 2, // الإجابة الصحيحة: ¼
    solution: '¾ × ⅓ = (3×1)/(4×3) = 3/12 = 1/4 = ¼',
    operationType: 'ضرب',
    lessonId: 'lesson_3',
    hint: 'بسّط الناتج بعد الضرب',
    difficulty: 2,
  ),
  Question(
    questionText: 'ما ناتج ⅔ × ¾؟',
    options: ['⅓', '¼', '¾', '½'],
    correctAnswerIndex: 3, // الإجابة الصحيحة: ½
    solution: '⅔ × ¾ = (2×3)/(3×4) = 6/12 = 1/2 = ½',
    operationType: 'ضرب',
    lessonId: 'lesson_3',
    hint: 'بسّط قبل الضرب (احذف العوامل المشتركة)',
    difficulty: 3,
  ),

  // ==========================================================
  // ===== قسمة ===== (3 أسئلة)
  // ==========================================================

  Question(
    questionText: 'ما ناتج ½ ÷ ¼؟',
    options: ['2', '½', '¼', '1'],
    correctAnswerIndex: 0, // الإجابة الصحيحة: 2
    solution: '½ ÷ ¼ = ½ × 4/1 = (1×4)/(2×1) = 4/2 = 2',
    operationType: 'قسمة',
    lessonId: 'lesson_4',
    hint: 'اقلب الكسر الثاني واضرب',
    difficulty: 2,
  ),
  Question(
    questionText: 'ما ناتج ¾ ÷ ½؟',
    options: ['¾', '1½', '½', '1'],
    correctAnswerIndex: 1, // الإجابة الصحيحة: 1½
    solution: '¾ ÷ ½ = ¾ × 2/1 = (3×2)/(4×1) = 6/4 = 3/2 = 1½',
    operationType: 'قسمة',
    lessonId: 'lesson_4',
    hint: 'اقلب ½ إلى 2/1 ثم اضرب',
    difficulty: 3,
  ),
  Question(
    questionText: 'ما ناتج ⅓ ÷ ⅓؟',
    options: ['⅓', '⅙', '1', '½'],
    correctAnswerIndex: 2, // الإجابة الصحيحة: 1
    solution: '⅓ ÷ ⅓ = ⅓ × 3/1 = (1×3)/(3×1) = 3/3 = 1',
    operationType: 'قسمة',
    lessonId: 'lesson_4',
    hint: 'أي عدد ÷ نفسه = 1',
    difficulty: 1,
  ),
];

// ============================================================
// ===== دوال مساعدة =====
// ============================================================

/// الحصول على الأسئلة حسب نوع العملية
List<Question> getQuestionsByType(String operationType) {
  try {
    return allQuestions
        .where((q) => q.operationType == operationType)
        .toList();
  } catch (e) {
    return [];
  }
}

/// الحصول على أسئلة درس معين
List<Question> getQuestionsByLesson(String lessonId) {
  try {
    return allQuestions
        .where((q) => q.lessonId == lessonId)
        .toList();
  } catch (e) {
    return [];
  }
}

/// الحصول على الأسئلة حسب الصعوبة
List<Question> getQuestionsByDifficulty(int difficulty) {
  try {
    return allQuestions
        .where((q) => q.difficulty == difficulty)
        .toList();
  } catch (e) {
    return [];
  }
}

/// الحصول على عدد الأسئلة
int getTotalQuestionsCount() {
  return allQuestions.length;
}

/// الحصول على قائمة أنواع العمليات
List<String> getOperationTypes() {
  return ['جمع', 'طرح', 'ضرب', 'قسمة'];
}