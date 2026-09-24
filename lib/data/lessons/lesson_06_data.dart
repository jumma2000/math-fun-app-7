import '../../models/lesson.dart';
import '../../models/question.dart';

/// ============================================================
/// الدرس 6: ترتيب العمليات الحسابية
/// ============================================================
/// 
/// الوحدة: الأعداد والعوامل والمضاعفات
/// الصفحات: 19-20
/// عدد الأسئلة: 20
/// 
/// ============================================================

Lesson lesson06 = Lesson(
  id: 'lesson_6',
  title: 'ترتيب العمليات الحسابية',
  description: 'تعرف على ترتيب العمليات الحسابية والأقواس',
  unit: 'الوحدة 1: الأعداد والعوامل والمضاعفات',
  order: 6,

  // ============================================================
  // ===== الشرح (نقاط) =====
  // ============================================================
  sections: [
    '🔹 ترتيب العمليات: 1. الأقواس، 2. الأس، 3. الضرب والقسمة، 4. الجمع والطرح.',
    '🔹 الأقواس: نبدأ بالأقواس الداخلية. مثال: 5 + (3 × 2) = 5 + 6 = 11',
    '🔹 الضرب والقسمة قبل الجمع والطرح. مثال: 3 + 4 × 2 = 3 + 8 = 11',
    '🔹 من اليسار إلى اليمين عند نفس المستوى. مثال: 20 ÷ 4 × 2 = 5 × 2 = 10',
    '🔹 الضرب والقسمة لهما نفس الأولوية.',
    '🔹 الجمع والطرح لهما نفس الأولوية.',
  ],

  // ============================================================
  // ===== الأمثلة المحلولة =====
  // ============================================================
  examples: [
    Example(
      question: 'أوجد قيمة: 5 + 3 × 2',
      solution: 'أولاً: 3 × 2 = 6، ثانياً: 5 + 6 = 11. الناتج = 11',
    ),
    Example(
      question: 'أوجد قيمة: (5 + 3) × 2',
      solution: 'أولاً: 5 + 3 = 8 (الأقواس)، ثانياً: 8 × 2 = 16. الناتج = 16',
    ),
    Example(
      question: 'أوجد قيمة: 20 ÷ 4 + 3 × 2',
      solution: 'أولاً: 20 ÷ 4 = 5، ثانياً: 3 × 2 = 6، ثالثاً: 5 + 6 = 11. الناتج = 11',
    ),
  ],

  // ============================================================
  // ===== الأسئلة (20 سؤال - 3 خيارات) =====
  // ============================================================
  questions: [
    // ---------- المجموعة 1: بدون أقواس (5 أسئلة) ----------
    Question(
      questionText: 'ما قيمة 5 + 3 × 2؟',
      options: ['16', '11', '13'],
      correctAnswerIndex: 1,
      solution: '5 + 3 × 2 = 5 + 6 = 11',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الضرب قبل الجمع.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما قيمة 10 - 6 ÷ 2؟',
      options: ['7', '2', '8'],
      correctAnswerIndex: 0,
      solution: '10 - 6 ÷ 2 = 10 - 3 = 7',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'القسمة قبل الطرح.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما قيمة 4 × 3 + 2؟',
      options: ['20', '14', '24'],
      correctAnswerIndex: 1,
      solution: '4 × 3 + 2 = 12 + 2 = 14',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الضرب قبل الجمع.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما قيمة 12 ÷ 4 + 5؟',
      options: ['8', '3', '17'],
      correctAnswerIndex: 0,
      solution: '12 ÷ 4 + 5 = 3 + 5 = 8',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'القسمة قبل الجمع.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما قيمة 7 + 2 × 4؟',
      options: ['36', '15', '13'],
      correctAnswerIndex: 1,
      solution: '7 + 2 × 4 = 7 + 8 = 15',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الضرب قبل الجمع.',
      difficulty: 1,
    ),

    // ---------- المجموعة 2: مع الأقواس (5 أسئلة) ----------
    Question(
      questionText: 'ما قيمة (5 + 3) × 2؟',
      options: ['16', '11', '13'],
      correctAnswerIndex: 0,
      solution: '(5 + 3) × 2 = 8 × 2 = 16',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الأقواس أولاً.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما قيمة (10 - 6) ÷ 2؟',
      options: ['7', '2', '8'],
      correctAnswerIndex: 1,
      solution: '(10 - 6) ÷ 2 = 4 ÷ 2 = 2',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الأقواس أولاً.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما قيمة 4 × (3 + 2)؟',
      options: ['20', '14', '24'],
      correctAnswerIndex: 0,
      solution: '4 × (3 + 2) = 4 × 5 = 20',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الأقواس أولاً.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما قيمة 12 ÷ (4 + 2)؟',
      options: ['8', '2', '17'],
      correctAnswerIndex: 1,
      solution: '12 ÷ (4 + 2) = 12 ÷ 6 = 2',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الأقواس أولاً.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما قيمة (7 + 2) × 4؟',
      options: ['36', '15', '13'],
      correctAnswerIndex: 0,
      solution: '(7 + 2) × 4 = 9 × 4 = 36',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الأقواس أولاً.',
      difficulty: 2,
    ),

    // ---------- المجموعة 3: من اليسار إلى اليمين (5 أسئلة) ----------
    Question(
      questionText: 'ما قيمة 20 ÷ 4 × 2؟',
      options: ['10', '2.5', '40'],
      correctAnswerIndex: 0,
      solution: '20 ÷ 4 × 2 = 5 × 2 = 10',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'من اليسار إلى اليمين.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما قيمة 10 - 3 + 2؟',
      options: ['5', '9', '11'],
      correctAnswerIndex: 1,
      solution: '10 - 3 + 2 = 7 + 2 = 9',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'من اليسار إلى اليمين.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما قيمة 24 ÷ 6 × 2؟',
      options: ['8', '2', '72'],
      correctAnswerIndex: 0,
      solution: '24 ÷ 6 × 2 = 4 × 2 = 8',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'من اليسار إلى اليمين.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما قيمة 8 + 5 - 3؟',
      options: ['10', '16', '0'],
      correctAnswerIndex: 0,
      solution: '8 + 5 - 3 = 13 - 3 = 10',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'من اليسار إلى اليمين.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما قيمة 36 ÷ 9 × 2؟',
      options: ['8', '2', '162'],
      correctAnswerIndex: 0,
      solution: '36 ÷ 9 × 2 = 4 × 2 = 8',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'من اليسار إلى اليمين.',
      difficulty: 2,
    ),

    // ---------- المجموعة 4: تحديات متقدمة (5 أسئلة) ----------
    Question(
      questionText: 'ما قيمة 2 + 3 × 4 - 5؟',
      options: ['9', '15', '5'],
      correctAnswerIndex: 0,
      solution: '2 + 3 × 4 - 5 = 2 + 12 - 5 = 14 - 5 = 9',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الضرب قبل الجمع والطرح.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما قيمة (2 + 3) × (4 - 1)؟',
      options: ['15', '11', '20'],
      correctAnswerIndex: 0,
      solution: '(2 + 3) × (4 - 1) = 5 × 3 = 15',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الأقواس أولاً.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما قيمة 10 + 2 × (3 + 4)؟',
      options: ['24', '84', '20'],
      correctAnswerIndex: 0,
      solution: '10 + 2 × (3 + 4) = 10 + 2 × 7 = 10 + 14 = 24',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الأقواس أولاً ثم الضرب.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما قيمة 18 ÷ 3 + 2 × 4؟',
      options: ['14', '20', '32'],
      correctAnswerIndex: 0,
      solution: '18 ÷ 3 + 2 × 4 = 6 + 8 = 14',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'القسمة والضرب أولاً.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما قيمة 5 × 2 + 12 ÷ 4 - 3؟',
      options: ['10', '13', '7'],
      correctAnswerIndex: 0,
      solution: '5 × 2 + 12 ÷ 4 - 3 = 10 + 3 - 3 = 10',
      operationType: 'ترتيب العمليات',
      lessonId: 'lesson_6',
      hint: 'الضرب والقسمة أولاً.',
      difficulty: 3,
    ),
  ],
);