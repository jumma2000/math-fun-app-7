import '../../models/lesson.dart';
import '../../models/question.dart';

/// ============================================================
/// الدرس 7: خواص العمليات الأربع
/// ============================================================
/// 
/// الوحدة: الأعداد والعوامل والمضاعفات
/// الصفحات: 21-22
/// عدد الأسئلة: 20
/// 
/// ============================================================

Lesson lesson07 = Lesson(
  id: 'lesson_7',
  title: 'خواص العمليات الأربع',
  description: 'تعرف على الإبدال، الدمج، التوزيع، والعنصر المحايد',
  unit: 'الوحدة 1: الأعداد والعوامل والمضاعفات',
  order: 7,

  // ============================================================
  // ===== الشرح (نقاط) =====
  // ============================================================
  sections: [
    '🔹 الإبدال: الجمع (أ + ب = ب + أ) والضرب (أ × ب = ب × أ) — لا ينطبق على الطرح والقسمة.',
    '🔹 الدمج: الجمع ((أ + ب) + ج = أ + (ب + ج)) والضرب ((أ × ب) × ج = أ × (ب × ج)).',
    '🔹 التوزيع: أ × (ب + ج) = (أ × ب) + (أ × ج).',
    '🔹 التوزيع مع الطرح: أ × (ب - ج) = (أ × ب) - (أ × ج).',
    '🔹 العنصر المحايد: في الجمع = 0 (أ + 0 = أ)، في الضرب = 1 (أ × 1 = أ).',
    '🔹 المعكوس: في الجمع = -أ (أ + (-أ) = 0).',
  ],

  // ============================================================
  // ===== الأمثلة المحلولة =====
  // ============================================================
  examples: [
    Example(
      question: 'أكمل باستخدام خاصية الإبدال: 5 + 8 = ___ + 5',
      solution: '5 + 8 = 8 + 5 = 13',
    ),
    Example(
      question: 'احسب باستخدام خاصية التوزيع: 4 × (6 + 3)',
      solution: '4 × (6 + 3) = (4 × 6) + (4 × 3) = 24 + 12 = 36',
    ),
    Example(
      question: 'احسب باستخدام خاصية الدمج: (2 × 3) × 5',
      solution: '(2 × 3) × 5 = 2 × (3 × 5) = 2 × 15 = 30',
    ),
  ],

  // ============================================================
  // ===== الأسئلة (20 سؤال - 3 خيارات) =====
  // ============================================================
  questions: [
    // ---------- المجموعة 1: خاصية الإبدال (5 أسئلة) ----------
    Question(
      questionText: 'أي عملية تنطبق عليها خاصية الإبدال؟',
      options: ['الجمع والضرب', 'الطرح والقسمة', 'الطرح فقط'],
      correctAnswerIndex: 0,
      solution: 'الإبدال ينطبق على الجمع والضرب فقط.',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'الإبدال = تغيير الترتيب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'أكمل: 7 + 4 = ___ + 7',
      options: ['4', '7', '11'],
      correctAnswerIndex: 0,
      solution: '7 + 4 = 4 + 7 = 11 (خاصية الإبدال)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'خاصية الإبدال في الجمع.',
      difficulty: 1,
    ),
    Question(
      questionText: 'أكمل: 6 × 3 = 3 × ___',
      options: ['6', '3', '18'],
      correctAnswerIndex: 0,
      solution: '6 × 3 = 3 × 6 = 18 (خاصية الإبدال)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'خاصية الإبدال في الضرب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 5 + 8؟',
      options: ['13', '3', '40'],
      correctAnswerIndex: 0,
      solution: '5 + 8 = 13 (ونفس ناتج 8 + 5)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'نفس ناتج 8 + 5.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 4 × 9؟',
      options: ['36', '13', '5'],
      correctAnswerIndex: 0,
      solution: '4 × 9 = 36 (ونفس ناتج 9 × 4)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'نفس ناتج 9 × 4.',
      difficulty: 1,
    ),

    // ---------- المجموعة 2: خاصية الدمج (5 أسئلة) ----------
    Question(
      questionText: 'احسب: (2 + 3) + 5',
      options: ['10', '8', '6'],
      correctAnswerIndex: 0,
      solution: '(2 + 3) + 5 = 5 + 5 = 10',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'ابدأ بالأقواس.',
      difficulty: 2,
    ),
    Question(
      questionText: 'احسب: 2 + (3 + 5)',
      options: ['10', '8', '6'],
      correctAnswerIndex: 0,
      solution: '2 + (3 + 5) = 2 + 8 = 10 (نفس الناتج)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'خاصية الدمج.',
      difficulty: 2,
    ),
    Question(
      questionText: 'احسب: (4 × 2) × 3',
      options: ['24', '9', '14'],
      correctAnswerIndex: 0,
      solution: '(4 × 2) × 3 = 8 × 3 = 24',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'ابدأ بالأقواس.',
      difficulty: 2,
    ),
    Question(
      questionText: 'احسب: 4 × (2 × 3)',
      options: ['24', '9', '14'],
      correctAnswerIndex: 0,
      solution: '4 × (2 × 3) = 4 × 6 = 24 (نفس الناتج)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'خاصية الدمج.',
      difficulty: 2,
    ),
    Question(
      questionText: 'أي عملية تنطبق عليها خاصية الدمج؟',
      options: ['الجمع والضرب', 'الطرح فقط', 'القسمة فقط'],
      correctAnswerIndex: 0,
      solution: 'الدمج ينطبق على الجمع والضرب.',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'مثل الإبدال.',
      difficulty: 2,
    ),

    // ---------- المجموعة 3: خاصية التوزيع (5 أسئلة) ----------
    Question(
      questionText: 'احسب: 3 × (4 + 5)',
      options: ['27', '17', '12'],
      correctAnswerIndex: 0,
      solution: '3 × (4 + 5) = 3 × 9 = 27',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'ابدأ بالأقواس.',
      difficulty: 2,
    ),
    Question(
      questionText: 'احسب: (3 × 4) + (3 × 5)',
      options: ['27', '17', '12'],
      correctAnswerIndex: 0,
      solution: '(3 × 4) + (3 × 5) = 12 + 15 = 27 (نفس الناتج)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'خاصية التوزيع.',
      difficulty: 2,
    ),
    Question(
      questionText: 'احسب: 5 × (6 - 2)',
      options: ['20', '28', '13'],
      correctAnswerIndex: 0,
      solution: '5 × (6 - 2) = 5 × 4 = 20',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'ابدأ بالأقواس.',
      difficulty: 2,
    ),
    Question(
      questionText: 'احسب: (5 × 6) - (5 × 2)',
      options: ['20', '28', '13'],
      correctAnswerIndex: 0,
      solution: '(5 × 6) - (5 × 2) = 30 - 10 = 20 (نفس الناتج)',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'خاصية التوزيع.',
      difficulty: 2,
    ),
    Question(
      questionText: 'أي خاصية: 2 × (3 + 4) = (2 × 3) + (2 × 4)؟',
      options: ['التوزيع', 'الإبدال', 'الدمج'],
      correctAnswerIndex: 0,
      solution: 'هذه خاصية التوزيع.',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'الضرب يتوزع على الجمع.',
      difficulty: 2,
    ),

    // ---------- المجموعة 4: العنصر المحايد والمعكوس (5 أسئلة) ----------
    Question(
      questionText: 'ما العنصر المحايد في الجمع؟',
      options: ['0', '1', '-1'],
      correctAnswerIndex: 0,
      solution: 'العنصر المحايد في الجمع = 0 (أ + 0 = أ).',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'لا يغير الناتج.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما العنصر المحايد في الضرب؟',
      options: ['0', '1', '-1'],
      correctAnswerIndex: 1,
      solution: 'العنصر المحايد في الضرب = 1 (أ × 1 = أ).',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'لا يغير الناتج.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما معكوس 5 في الجمع؟',
      options: ['-5', '5', '0'],
      correctAnswerIndex: 0,
      solution: 'معكوس 5 في الجمع = -5 (5 + (-5) = 0).',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'مجموعهما = 0.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما معكوس 7 في الجمع؟',
      options: ['-7', '7', '0'],
      correctAnswerIndex: 0,
      solution: 'معكوس 7 في الجمع = -7 (7 + (-7) = 0).',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'مجموعهما = 0.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج 8 + (-8)؟',
      options: ['16', '0', '-16'],
      correctAnswerIndex: 1,
      solution: '8 + (-8) = 0 (عددين متعاكسين).',
      operationType: 'خواص',
      lessonId: 'lesson_7',
      hint: 'عددين متعاكسين = 0.',
      difficulty: 2,
    ),
  ],
);