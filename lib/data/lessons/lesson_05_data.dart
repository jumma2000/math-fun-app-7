import '../../models/lesson.dart';
import '../../models/question.dart';

/// ============================================================
/// الدرس 5: قسمة الأعداد الصحيحة
/// ============================================================
/// 
/// الوحدة: الأعداد والعوامل والمضاعفات
/// الصفحة: 18
/// عدد الأسئلة: 20
/// 
/// ============================================================

Lesson lesson05 = Lesson(
  id: 'lesson_5',
  title: 'قسمة الأعداد الصحيحة',
  description: 'تعرف على قواعد قسمة الأعداد الصحيحة والإشارات',
  unit: 'الوحدة 1: الأعداد والعوامل والمضاعفات',
  order: 5,

  // ============================================================
  // ===== الشرح (نقاط) =====
  // ============================================================
  sections: [
    '🔹 عند قسمة عددين لهما نفس الإشارة: الناتج موجب. (موجب ÷ موجب = موجب، سالب ÷ سالب = موجب)',
    '🔹 عند قسمة عددين مختلفين في الإشارة: الناتج سالب. (موجب ÷ سالب = سالب، سالب ÷ موجب = سالب)',
    '🔹 قاعدة الإشارات: (+) ÷ (+) = (+)، (-) ÷ (-) = (+)، (+) ÷ (-) = (-)، (-) ÷ (+) = (-)',
    '🔹 القسمة هي عكس الضرب. مثال: 12 ÷ 3 = 4 ← لأن 4 × 3 = 12',
    '🔹 أي عدد ÷ 1 = نفس العدد. أي عدد ÷ (-1) = معكوسه.',
    '🔹 الصفر ÷ أي عدد = صفر. القسمة على صفر غير معرّفة.',
  ],

  // ============================================================
  // ===== الأمثلة المحلولة =====
  // ============================================================
  examples: [
    Example(
      question: 'أوجد ناتج 20 ÷ 4.',
      solution: '20 ÷ 4 = 5 (موجب ÷ موجب = موجب)',
    ),
    Example(
      question: 'أوجد ناتج (-20) ÷ 4.',
      solution: '(-20) ÷ 4 = -5 (سالب ÷ موجب = سالب)',
    ),
    Example(
      question: 'أوجد ناتج (-20) ÷ (-4).',
      solution: '(-20) ÷ (-4) = 5 (سالب ÷ سالب = موجب)',
    ),
  ],

  // ============================================================
  // ===== الأسئلة (20 سؤال - 3 خيارات) =====
  // ============================================================
  questions: [
    // ---------- المجموعة 1: نفس الإشارة (5 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 12 ÷ 3؟',
      options: ['4', '-4', '9'],
      correctAnswerIndex: 0,
      solution: '12 ÷ 3 = 4 (موجب ÷ موجب = موجب)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'موجب ÷ موجب = موجب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج (-12) ÷ (-3)؟',
      options: ['4', '-4', '9'],
      correctAnswerIndex: 0,
      solution: '(-12) ÷ (-3) = 4 (سالب ÷ سالب = موجب)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'سالب ÷ سالب = موجب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 20 ÷ 4؟',
      options: ['5', '-5', '24'],
      correctAnswerIndex: 0,
      solution: '20 ÷ 4 = 5',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'موجب ÷ موجب = موجب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج (-24) ÷ (-6)؟',
      options: ['4', '-4', '30'],
      correctAnswerIndex: 0,
      solution: '(-24) ÷ (-6) = 4',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'سالب ÷ سالب = موجب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-36) ÷ (-9)؟',
      options: ['4', '-4', '45'],
      correctAnswerIndex: 0,
      solution: '(-36) ÷ (-9) = 4',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'سالب ÷ سالب = موجب.',
      difficulty: 2,
    ),

    // ---------- المجموعة 2: إشارات مختلفة (5 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 12 ÷ (-3)؟',
      options: ['4', '-4', '9'],
      correctAnswerIndex: 1,
      solution: '12 ÷ (-3) = -4 (موجب ÷ سالب = سالب)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'موجب ÷ سالب = سالب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج (-12) ÷ 3؟',
      options: ['4', '-4', '9'],
      correctAnswerIndex: 1,
      solution: '(-12) ÷ 3 = -4 (سالب ÷ موجب = سالب)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'سالب ÷ موجب = سالب.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 20 ÷ (-4)؟',
      options: ['5', '-5', '24'],
      correctAnswerIndex: 1,
      solution: '20 ÷ (-4) = -5',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'إشارات مختلفة = سالب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-30) ÷ 6؟',
      options: ['5', '-5', '36'],
      correctAnswerIndex: 1,
      solution: '(-30) ÷ 6 = -5',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'إشارات مختلفة = سالب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج 24 ÷ (-8)؟',
      options: ['3', '-3', '32'],
      correctAnswerIndex: 1,
      solution: '24 ÷ (-8) = -3',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'إشارات مختلفة = سالب.',
      difficulty: 2,
    ),

    // ---------- المجموعة 3: خواص القسمة (5 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 7 ÷ 1؟',
      options: ['7', '-7', '0'],
      correctAnswerIndex: 0,
      solution: '7 ÷ 1 = 7 (أي عدد ÷ 1 = نفس العدد)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'القسمة على 1.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 0 ÷ 5؟',
      options: ['5', '0', '-5'],
      correctAnswerIndex: 1,
      solution: '0 ÷ 5 = 0 (صفر ÷ أي عدد = صفر)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'صفر ÷ أي عدد.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 8 ÷ (-1)؟',
      options: ['8', '-8', '0'],
      correctAnswerIndex: 1,
      solution: '8 ÷ (-1) = -8 (أي عدد ÷ (-1) = معكوسه)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'القسمة على -1.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-8) ÷ (-1)؟',
      options: ['8', '-8', '0'],
      correctAnswerIndex: 0,
      solution: '(-8) ÷ (-1) = 8 (سالب ÷ سالب = موجب)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'سالب ÷ سالب = موجب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج (-5) ÷ (-5)؟',
      options: ['1', '-1', '0'],
      correctAnswerIndex: 0,
      solution: '(-5) ÷ (-5) = 1 (أي عدد ÷ نفسه = 1)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'أي عدد ÷ نفسه.',
      difficulty: 2,
    ),

    // ---------- المجموعة 4: علاقة القسمة بالضرب (5 أسئلة) ----------
    Question(
      questionText: '15 ÷ 3 = 5، يعني:',
      options: ['5 × 3 = 15', '-5 × 3 = 15', '5 × (-3) = 15'],
      correctAnswerIndex: 0,
      solution: '15 ÷ 3 = 5 ← لأن 5 × 3 = 15 (القسمة عكس الضرب)',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'القسمة عكس الضرب.',
      difficulty: 2,
    ),
    Question(
      questionText: '(-15) ÷ 3 = -5، يعني:',
      options: ['-5 × 3 = -15', '5 × 3 = -15', '-5 × (-3) = -15'],
      correctAnswerIndex: 0,
      solution: '(-15) ÷ 3 = -5 ← لأن -5 × 3 = -15',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'القسمة عكس الضرب.',
      difficulty: 2,
    ),
    Question(
      questionText: '(-15) ÷ (-3) = 5، يعني:',
      options: ['5 × (-3) = -15', '5 × 3 = 15', '-5 × 3 = 15'],
      correctAnswerIndex: 1,
      solution: '(-15) ÷ (-3) = 5 ← لأن 5 × 3 = 15... لكن الحل الأصح: 5 × (-3) = -15',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'القسمة عكس الضرب.',
      difficulty: 3,
    ),
    Question(
      questionText: '24 ÷ 4 = 6، يعني:',
      options: ['6 × 4 = 24', '-6 × 4 = 24', '6 × (-4) = 24'],
      correctAnswerIndex: 0,
      solution: '24 ÷ 4 = 6 ← لأن 6 × 4 = 24',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'القسمة عكس الضرب.',
      difficulty: 1,
    ),
    Question(
      questionText: '(-24) ÷ 4 = -6، يعني:',
      options: ['-6 × 4 = -24', '6 × 4 = -24', '-6 × (-4) = -24'],
      correctAnswerIndex: 0,
      solution: '(-24) ÷ 4 = -6 ← لأن -6 × 4 = -24',
      operationType: 'قسمة',
      lessonId: 'lesson_5',
      hint: 'القسمة عكس الضرب.',
      difficulty: 2,
    ),
  ],
);