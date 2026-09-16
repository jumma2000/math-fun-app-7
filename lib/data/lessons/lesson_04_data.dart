import '../../models/lesson.dart';
import '../../models/question.dart';

/// ============================================================
/// الدرس 4: ضرب الأعداد الصحيحة
/// ============================================================
/// 
/// الوحدة: الأعداد والعوامل والمضاعفات
/// الصفحات: 16-17
/// عدد الأسئلة: 20
/// 
/// ============================================================

Lesson lesson04 = Lesson(
  id: 'lesson_4',
  title: 'ضرب الأعداد الصحيحة',
  description: 'تعرف على قواعد ضرب الأعداد الصحيحة والإشارات',
  unit: 'الوحدة 1: الأعداد والعوامل والمضاعفات',
  order: 4,

  // ============================================================
  // ===== الشرح (نقاط) =====
  // ============================================================
  sections: [
    '🔹 عند ضرب عددين لهما نفس الإشارة: الناتج موجب. (موجب × موجب = موجب، سالب × سالب = موجب)',
    '🔹 عند ضرب عددين مختلفين في الإشارة: الناتج سالب. (موجب × سالب = سالب، سالب × موجب = سالب)',
    '🔹 قاعدة الإشارات: (+) × (+) = (+)، (-) × (-) = (+)، (+) × (-) = (-)، (-) × (+) = (-)',
    '🔹 الإبدال: أ × ب = ب × أ',
    '🔹 الدمج: (أ × ب) × ج = أ × (ب × ج)',
    '🔹 التوزيع: أ × (ب + ج) = (أ × ب) + (أ × ج)',
    '🔹 أي عدد × صفر = صفر. أي عدد × 1 = نفس العدد. أي عدد × (-1) = معكوسه.',
  ],

  // ============================================================
  // ===== الأمثلة المحلولة =====
  // ============================================================
  examples: [
    Example(
      question: 'أوجد ناتج 3 × (-4).',
      solution: '3 × (-4) = -12 (إشارات مختلفة = سالب)',
    ),
    Example(
      question: 'أوجد ناتج (-5) × (-2).',
      solution: '(-5) × (-2) = 10 (نفس الإشارة = موجب)',
    ),
    Example(
      question: 'أوجد ناتج (-3) × 4 × (-2).',
      solution: 'أولاً: (-3) × 4 = -12، ثانياً: -12 × (-2) = 24. الناتج = 24',
    ),
  ],

  // ============================================================
  // ===== الأسئلة (20 سؤال - 3 خيارات) =====
  // ============================================================
  questions: [
    // ---------- المجموعة 1: نفس الإشارة (5 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 3 × 4؟',
      options: ['12', '-12', '7'],
      correctAnswerIndex: 0,
      solution: '3 × 4 = 12 (موجب × موجب = موجب)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'موجب × موجب = موجب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج (-3) × (-4)؟',
      options: ['12', '-12', '7'],
      correctAnswerIndex: 0,
      solution: '(-3) × (-4) = 12 (سالب × سالب = موجب)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'سالب × سالب = موجب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 5 × 6؟',
      options: ['30', '-30', '11'],
      correctAnswerIndex: 0,
      solution: '5 × 6 = 30',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'موجب × موجب = موجب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج (-5) × (-6)؟',
      options: ['30', '-30', '11'],
      correctAnswerIndex: 0,
      solution: '(-5) × (-6) = 30',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'سالب × سالب = موجب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-2) × (-8)؟',
      options: ['16', '-16', '10'],
      correctAnswerIndex: 0,
      solution: '(-2) × (-8) = 16',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'سالب × سالب = موجب.',
      difficulty: 2,
    ),

    // ---------- المجموعة 2: إشارات مختلفة (5 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 3 × (-4)؟',
      options: ['12', '-12', '7'],
      correctAnswerIndex: 1,
      solution: '3 × (-4) = -12 (إشارات مختلفة = سالب)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'موجب × سالب = سالب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج (-3) × 4؟',
      options: ['12', '-12', '7'],
      correctAnswerIndex: 1,
      solution: '(-3) × 4 = -12 (إشارات مختلفة = سالب)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'سالب × موجب = سالب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 5 × (-6)؟',
      options: ['30', '-30', '11'],
      correctAnswerIndex: 1,
      solution: '5 × (-6) = -30',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'إشارات مختلفة = سالب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-7) × 2؟',
      options: ['14', '-14', '9'],
      correctAnswerIndex: 1,
      solution: '(-7) × 2 = -14',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'إشارات مختلفة = سالب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج 8 × (-3)؟',
      options: ['24', '-24', '11'],
      correctAnswerIndex: 1,
      solution: '8 × (-3) = -24',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'إشارات مختلفة = سالب.',
      difficulty: 2,
    ),

    // ---------- المجموعة 3: خواص الضرب (5 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 7 × 1؟',
      options: ['7', '-7', '0'],
      correctAnswerIndex: 0,
      solution: '7 × 1 = 7 (أي عدد × 1 = نفس العدد)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'الضرب في 1.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 7 × 0؟',
      options: ['7', '-7', '0'],
      correctAnswerIndex: 2,
      solution: '7 × 0 = 0 (أي عدد × 0 = 0)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'الضرب في 0.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 5 × (-1)؟',
      options: ['5', '-5', '0'],
      correctAnswerIndex: 1,
      solution: '5 × (-1) = -5 (أي عدد × (-1) = معكوسه)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'الضرب في -1.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-5) × (-1)؟',
      options: ['5', '-5', '0'],
      correctAnswerIndex: 0,
      solution: '(-5) × (-1) = 5 (سالب × سالب = موجب)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'سالب × سالب = موجب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-1) × (-1)؟',
      options: ['1', '-1', '0'],
      correctAnswerIndex: 0,
      solution: '(-1) × (-1) = 1 (سالب × سالب = موجب)',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'سالب × سالب = موجب.',
      difficulty: 2,
    ),

    // ---------- المجموعة 4: ضرب أكثر من عددين (5 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 2 × 3 × 4؟',
      options: ['24', '-24', '9'],
      correctAnswerIndex: 0,
      solution: '2 × 3 = 6، ثم 6 × 4 = 24',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'اضرب اثنين اثنين.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-2) × 3 × 4؟',
      options: ['24', '-24', '9'],
      correctAnswerIndex: 1,
      solution: '(-2) × 3 = -6، ثم -6 × 4 = -24',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'إشارة واحدة سالبة = سالب.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما ناتج (-2) × (-3) × 4؟',
      options: ['24', '-24', '9'],
      correctAnswerIndex: 0,
      solution: '(-2) × (-3) = 6، ثم 6 × 4 = 24',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'إشارتين سالبتين = موجب.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما ناتج (-2) × (-3) × (-4)؟',
      options: ['24', '-24', '9'],
      correctAnswerIndex: 1,
      solution: '(-2) × (-3) = 6، ثم 6 × (-4) = -24',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'ثلاث إشارات سالبة = سالب.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما ناتج (-1) × (-1) × (-1)؟',
      options: ['1', '-1', '0'],
      correctAnswerIndex: 1,
      solution: '(-1) × (-1) = 1، ثم 1 × (-1) = -1',
      operationType: 'ضرب',
      lessonId: 'lesson_4',
      hint: 'ثلاث إشارات سالبة = سالب.',
      difficulty: 3,
    ),
  ],
);
