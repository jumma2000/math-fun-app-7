import '../../models/lesson.dart';
import '../../models/question.dart';

/// ============================================================
/// الدرس 2: ترتيب الأعداد
/// ============================================================
/// 
/// الوحدة: الأعداد والعوامل والمضاعفات
/// الصفحات: 12-13
/// عدد الأسئلة: 20
/// 
/// ============================================================

Lesson lesson02 = Lesson(
  id: 'lesson_2',
  title: 'ترتيب الأعداد',
  description: 'تعرف على خط الأعداد، الترتيب التصاعدي والتنازلي، والمقارنة',
  unit: 'الوحدة 1: الأعداد والعوامل والمضاعفات',
  order: 2,

  // ============================================================
  // ===== الشرح (نقاط) =====
  // ============================================================
  sections: [
    '🔹 خط الأعداد: هو خط مستقيم يمثل الأعداد بشكل مرتب. الأعداد على اليمين أكبر من الأعداد على اليسار.',
    '🔹 الترتيب التصاعدي: هو ترتيب الأعداد من الأصغر إلى الأكبر. مثال: -5, -3, -1, 0, 2, 4, 7',
    '🔹 الترتيب التنازلي: هو ترتيب الأعداد من الأكبر إلى الأصغر. مثال: 7, 4, 2, 0, -1, -3, -5',
    '🔹 الرموز: > تعني "أكبر من"، < تعني "أصغر من"، = تعني "يساوي".',
    '🔹 الأعداد الموجبة دائماً أكبر من الأعداد السالبة.',
    '🔹 الصفر أكبر من الأعداد السالبة وأصغر من الأعداد الموجبة.',
  ],

  // ============================================================
  // ===== الأمثلة المحلولة =====
  // ============================================================
  examples: [
    Example(
      question: 'رتب الأعداد التالية تصاعدياً: 5, -2, 7, 1, -4, 0, 3',
      solution: 'الترتيب التصاعدي: -4, -2, 0, 1, 3, 5, 7',
    ),
    Example(
      question: 'رتب الأعداد التالية تنازلياً: -1, 6, -3, 4, 0, -5',
      solution: 'الترتيب التنازلي: 6, 4, 0, -1, -3, -5',
    ),
    Example(
      question: 'أكمل: -3 ___ 2',
      solution: '-3 < 2 (-3 أصغر من 2 لأنها سالبة)',
    ),
  ],

  // ============================================================
  // ===== الأسئلة (20 سؤال) =====
  // ============================================================
  questions: [
    // ---------- المجموعة 1: خط الأعداد (4 أسئلة) ----------
    Question(
      questionText: 'على خط الأعداد، الأعداد على اليمين تكون:',
      options: ['أصغر', 'أكبر', 'مساوية', 'لا يمكن تحديدها'],
      correctAnswerIndex: 1,
      solution: 'على خط الأعداد، الأعداد على اليمين أكبر من الأعداد على اليسار.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'تذكر اتجاه خط الأعداد.',
      difficulty: 1,
    ),
    Question(
      questionText: 'أي عدد يقع على يمين العدد 0؟',
      options: ['-1', '-3', '2', '-5'],
      correctAnswerIndex: 2,
      solution: 'العدد 2 موجب، لذلك يقع على يمين 0 على خط الأعداد.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'الأعداد الموجبة على يمين الصفر.',
      difficulty: 1,
    ),
    Question(
      questionText: 'أي عدد يقع على يسار العدد 0؟',
      options: ['1', '-2', '3', '5'],
      correctAnswerIndex: 1,
      solution: 'العدد -2 سالب، لذلك يقع على يسار 0 على خط الأعداد.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'الأعداد السالبة على يسار الصفر.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما هو العدد الذي يقع بين -1 و 1 على خط الأعداد؟',
      options: ['-2', '0', '2', '-3'],
      correctAnswerIndex: 1,
      solution: 'العدد 0 يقع بين -1 و 1 على خط الأعداد.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ما هو العدد المحايد؟',
      difficulty: 2,
    ),

    // ---------- المجموعة 2: الرموز (4 أسئلة) ----------
    Question(
      questionText: 'ماذا يعني الرمز >؟',
      options: ['أصغر من', 'أكبر من', 'يساوي', 'لا يساوي'],
      correctAnswerIndex: 1,
      solution: 'الرمز > يعني "أكبر من".',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: 'الرمز يفتح باتجاه العدد الأكبر.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ماذا يعني الرمز <؟',
      options: ['أصغر من', 'أكبر من', 'يساوي', 'لا يساوي'],
      correctAnswerIndex: 0,
      solution: 'الرمز < يعني "أصغر من".',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: 'الرمز يفتح باتجاه العدد الأكبر.',
      difficulty: 1,
    ),
    Question(
      questionText: 'أكمل: 5 ___ 3',
      options: ['>', '<', '=', '≠'],
      correctAnswerIndex: 0,
      solution: '5 > 3 (5 أكبر من 3).',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: '5 أكبر من 3.',
      difficulty: 1,
    ),
    Question(
      questionText: 'أكمل: -2 ___ 1',
      options: ['>', '<', '=', '≠'],
      correctAnswerIndex: 1,
      solution: '-2 < 1 (-2 أصغر من 1 لأنها سالبة).',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: 'الأعداد السالبة أصغر من الموجبة.',
      difficulty: 2,
    ),

    // ---------- المجموعة 3: المقارنة (4 أسئلة) ----------
    Question(
      questionText: 'أي عدد أكبر؟',
      options: ['-5', '-2', '-8', '-10'],
      correctAnswerIndex: 1,
      solution: '-2 أكبر من -5 و -8 و -10 (الأقرب للصفر أكبر).',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: 'الأعداد السالبة الأقرب للصفر أكبر.',
      difficulty: 2,
    ),
    Question(
      questionText: 'أي عدد أصغر؟',
      options: ['3', '-1', '0', '2'],
      correctAnswerIndex: 1,
      solution: '-1 أصغر من 3 و 0 و 2 (الأعداد السالبة أصغر).',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: 'الأعداد السالبة أصغر من الموجبة والصفر.',
      difficulty: 2,
    ),
    Question(
      questionText: 'هل -3 أكبر من -7؟',
      options: ['نعم', 'لا', 'متساويان', 'لا يمكن تحديد'],
      correctAnswerIndex: 0,
      solution: 'نعم، -3 أكبر من -7 لأنها أقرب للصفر.',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: 'الأقرب للصفر أكبر.',
      difficulty: 2,
    ),
    Question(
      questionText: 'أي عدد أكبر: 0 أم -1؟',
      options: ['0', '-1', 'متساويان', 'لا يمكن تحديد'],
      correctAnswerIndex: 0,
      solution: '0 أكبر من -1 (الصفر أكبر من الأعداد السالبة).',
      operationType: 'مقارنة',
      lessonId: 'lesson_2',
      hint: 'الصفر أكبر من السالب.',
      difficulty: 1,
    ),

    // ---------- المجموعة 4: الترتيب التصاعدي (4 أسئلة) ----------
    Question(
      questionText: 'رتب تصاعدياً: 5, 2, 8, 1',
      options: ['1, 2, 5, 8', '8, 5, 2, 1', '5, 2, 1, 8', '2, 5, 8, 1'],
      correctAnswerIndex: 0,
      solution: 'الترتيب التصاعدي: 1, 2, 5, 8 (من الأصغر للأكبر).',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأصغر.',
      difficulty: 1,
    ),
    Question(
      questionText: 'رتب تصاعدياً: -3, 0, -1, 2',
      options: ['0, -1, -3, 2', '-3, -1, 0, 2', '2, 0, -1, -3', '-1, -3, 0, 2'],
      correctAnswerIndex: 1,
      solution: 'الترتيب التصاعدي: -3, -1, 0, 2.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأصغر (الأكثر سالبية).',
      difficulty: 2,
    ),
    Question(
      questionText: 'رتب تصاعدياً: 4, -2, 1, -5, 3',
      options: [
        '4, 3, 1, -2, -5',
        '-5, -2, 1, 3, 4',
        '1, 3, 4, -2, -5',
        '3, 1, -2, -5, 4',
      ],
      correctAnswerIndex: 1,
      solution: 'الترتيب التصاعدي: -5, -2, 1, 3, 4.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأصغر (الأكثر سالبية).',
      difficulty: 3,
    ),
    Question(
      questionText: 'رتب تصاعدياً: 7, 3, 9, 1, 5',
      options: ['1, 3, 5, 7, 9', '9, 7, 5, 3, 1', '7, 3, 9, 1, 5', '5, 7, 3, 9, 1'],
      correctAnswerIndex: 0,
      solution: 'الترتيب التصاعدي: 1, 3, 5, 7, 9.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأصغر.',
      difficulty: 2,
    ),

    // ---------- المجموعة 5: الترتيب التنازلي (4 أسئلة) ----------
    Question(
      questionText: 'رتب تنازلياً: 3, 7, 1, 5',
      options: ['1, 3, 5, 7', '7, 5, 3, 1', '3, 7, 1, 5', '5, 3, 7, 1'],
      correctAnswerIndex: 1,
      solution: 'الترتيب التنازلي: 7, 5, 3, 1 (من الأكبر للأصغر).',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأكبر.',
      difficulty: 1,
    ),
    Question(
      questionText: 'رتب تنازلياً: -1, 4, -3, 0',
      options: ['4, 0, -1, -3', '-3, -1, 0, 4', '0, -1, 4, -3', '-1, 0, -3, 4'],
      correctAnswerIndex: 0,
      solution: 'الترتيب التنازلي: 4, 0, -1, -3.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأكبر (الموجب).',
      difficulty: 2,
    ),
    Question(
      questionText: 'رتب تنازلياً: 6, -2, 8, -5, 1',
      options: [
        '-5, -2, 1, 6, 8',
        '8, 6, 1, -2, -5',
        '6, 8, 1, -2, -5',
        '-2, -5, 1, 6, 8',
      ],
      correctAnswerIndex: 1,
      solution: 'الترتيب التنازلي: 8, 6, 1, -2, -5.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأكبر (الموجب).',
      difficulty: 3,
    ),
    Question(
      questionText: 'رتب تنازلياً: 2, 9, 4, 7, 0',
      options: ['9, 7, 4, 2, 0', '0, 2, 4, 7, 9', '2, 9, 4, 7, 0', '4, 7, 2, 9, 0'],
      correctAnswerIndex: 0,
      solution: 'الترتيب التنازلي: 9, 7, 4, 2, 0.',
      operationType: 'ترتيب',
      lessonId: 'lesson_2',
      hint: 'ابدأ بالأكبر.',
      difficulty: 2,
    ),
  ],
);
