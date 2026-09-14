import '../../models/lesson.dart';
import '../../models/question.dart';

/// ============================================================
/// الدرس 3: جمع وطرح الأعداد الصحيحة
/// ============================================================
/// 
/// الوحدة: الأعداد والعوامل والمضاعفات
/// الصفحات: 14-15
/// عدد الأسئلة: 25
/// 
/// ============================================================

Lesson lesson03 = Lesson(
  id: 'lesson_3',
  title: 'جمع وطرح الأعداد الصحيحة',
  description: 'تعرف على جمع وطرح الأعداد الصحيحة باستخدام خط الأعداد',
  unit: 'الوحدة 1: الأعداد والعوامل والمضاعفات',
  order: 3,

  // ============================================================
  // ===== الشرح (نقاط) =====
  // ============================================================
  sections: [
    '🔹 جمع الأعداد الصحيحة: عند جمع عددين لهما نفس الإشارة، اجمع القيمتين واحتفظ بالإشارة. (مثال: 3 + 5 = 8، -3 + (-5) = -8)',
    '🔹 جمع الأعداد المختلفة: عند جمع عددين مختلفين في الإشارة، اطرح الأصغر من الأكبر واحتفظ بإشارة الأكبر. (مثال: 5 + (-3) = 2)',
    '🔹 طرح الأعداد الصحيحة: طرح عدد = جمع معكوسه. (مثال: 5 - 3 = 5 + (-3) = 2)',
    '🔹 طرح عدد سالب = جمع العدد الموجب. (مثال: 7 - (-2) = 7 + 2 = 9)',
    '🔹 استخدام خط الأعداد: الجمع يحركنا لليمين (للموجب) أو لليسار (للسالب). الطرح عكس الجمع.',
    '🔹 مجموع عددين متعاكسين = صفر. (مثال: 5 + (-5) = 0)',
  ],

  // ============================================================
  // ===== الأمثلة المحلولة =====
  // ============================================================
  examples: [
    Example(
      question: 'أوجد ناتج 5 + (-3) باستخدام خط الأعداد.',
      solution: '5 + (-3) = 2 (نبدأ من 5، نتحرك 3 وحدات لليسار، نصل إلى 2)',
    ),
    Example(
      question: 'أوجد ناتج 3 - (-4).',
      solution: '3 - (-4) = 3 + 4 = 7 (طرح سالب = جمع موجب)',
    ),
    Example(
      question: 'ارتفعت درجة الحرارة من -3°س إلى 5°س. ما مقدار الارتفاع؟',
      solution: 'مقدار الارتفاع = 5 - (-3) = 5 + 3 = 8°س',
    ),
  ],

  // ============================================================
  // ===== الأسئلة (25 سؤال) =====
  // ============================================================
  questions: [
    // ---------- المجموعة 1: جمع الأعداد الصحيحة (8 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 3 + 5؟',
      options: ['8', '2', '-8', '-2'],
      correctAnswerIndex: 0,
      solution: '3 + 5 = 8 (نفس الإشارة، نجمع)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'نفس الإشارة، اجمع.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج -3 + (-5)؟',
      options: ['8', '2', '-8', '-2'],
      correctAnswerIndex: 2,
      solution: '-3 + (-5) = -8 (نفس الإشارة سالبة، نجمع ونحتفظ بالإشارة)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'نفس الإشارة السالبة، اجمع.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 5 + (-3)؟',
      options: ['8', '2', '-8', '-2'],
      correctAnswerIndex: 1,
      solution: '5 + (-3) = 2 (إشارات مختلفة، نطرح ونحتفظ بإشارة الأكبر)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'إشارات مختلفة، اطرح.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج -5 + 3؟',
      options: ['8', '2', '-8', '-2'],
      correctAnswerIndex: 3,
      solution: '-5 + 3 = -2 (إشارات مختلفة، نطرح ونحتفظ بإشارة الأكبر)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'إشارات مختلفة، اطرح.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج 7 + (-7)؟',
      options: ['14', '0', '-14', '7'],
      correctAnswerIndex: 1,
      solution: '7 + (-7) = 0 (عددين متعاكسين مجموعهما صفر)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'عددين متعاكسين = صفر.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج -4 + 9؟',
      options: ['13', '5', '-5', '-13'],
      correctAnswerIndex: 1,
      solution: '-4 + 9 = 5 (إشارات مختلفة، نطرح)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'إشارات مختلفة، اطرح.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج -6 + (-2)؟',
      options: ['8', '4', '-8', '-4'],
      correctAnswerIndex: 2,
      solution: '-6 + (-2) = -8 (نفس الإشارة سالبة)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'نفس الإشارة، اجمع.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 10 + (-15)؟',
      options: ['25', '5', '-5', '-25'],
      correctAnswerIndex: 2,
      solution: '10 + (-15) = -5 (إشارات مختلفة، نطرح)',
      operationType: 'جمع',
      lessonId: 'lesson_3',
      hint: 'إشارات مختلفة، اطرح.',
      difficulty: 3,
    ),

    // ---------- المجموعة 2: طرح الأعداد الصحيحة (8 أسئلة) ----------
    Question(
      questionText: 'ما ناتج 8 - 3؟',
      options: ['11', '5', '-5', '-11'],
      correctAnswerIndex: 1,
      solution: '8 - 3 = 5',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'اطرح مباشرة.',
      difficulty: 1,
    ),
    Question(
      questionText: 'ما ناتج 3 - 8؟',
      options: ['11', '5', '-5', '-11'],
      correctAnswerIndex: 2,
      solution: '3 - 8 = -5 (العدد الأكبر سالب)',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'النتيجة سلبية.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج 5 - (-3)؟',
      options: ['8', '2', '-8', '-2'],
      correctAnswerIndex: 0,
      solution: '5 - (-3) = 5 + 3 = 8 (طرح سالب = جمع موجب)',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'طرح سالب = جمع موجب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج -5 - 3؟',
      options: ['8', '2', '-8', '-2'],
      correctAnswerIndex: 2,
      solution: '-5 - 3 = -8',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'اطرح مباشرة.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج -5 - (-3)؟',
      options: ['8', '2', '-8', '-2'],
      correctAnswerIndex: 3,
      solution: '-5 - (-3) = -5 + 3 = -2',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'طرح سالب = جمع موجب.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما ناتج 7 - (-2)؟',
      options: ['9', '5', '-9', '-5'],
      correctAnswerIndex: 0,
      solution: '7 - (-2) = 7 + 2 = 9',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'طرح سالب = جمع موجب.',
      difficulty: 2,
    ),
    Question(
      questionText: 'ما ناتج -4 - (-9)؟',
      options: ['13', '5', '-5', '-13'],
      correctAnswerIndex: 1,
      solution: '-4 - (-9) = -4 + 9 = 5',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'طرح سالب = جمع موجب.',
      difficulty: 3,
    ),
    Question(
      questionText: 'ما ناتج 0 - 6؟',
      options: ['6', '0', '-6', '-12'],
      correctAnswerIndex: 2,
      solution: '0 - 6 = -6',
      operationType: 'طرح',
      lessonId: 'lesson_3',
      hint: 'النتيجة سلبية.',
      difficulty: 1,
    ),

    // ---------- المجموعة 3: خط الأعداد (4 أسئلة) ----------
    Question(
      questionText: 'عند جمع عدد موجب على خط الأعداد، نتحرك:',
      options: ['يمين', 'يسار', 'لا نتحرك', 'لا يمكن تحديده'],
      correctAnswerIndex: 0,
      solution: 'الموجب يحركنا لليمين على خط الأعداد.',
      operationType: 'خط الأعداد',
      lessonId: 'lesson_3',
      hint: 'الموجب = يمين.',
      difficulty: 1,
    ),
    Question(
      questionText: 'عند جمع عدد سالب على خط الأعداد، نتحرك:',
      options: ['يمين', 'يسار', 'لا نتحرك', 'لا يمكن تحديده'],
      correctAnswerIndex: 1,
      solution: 'السالب يحركنا لليسار على خط الأعداد.',
      operationType: 'خط الأعداد',
      lessonId: 'lesson_3',
      hint: 'السالب = يسار.',
      difficulty: 1,
    ),
    Question(
      questionText: 'عند طرح عدد موجب على خط الأعداد، نتحرك:',
      options: ['يمين', 'يسار', 'لا نتحرك', 'لا يمكن تحديده'],
      correctAnswerIndex: 1,
      solution: 'الطرح يحركنا لليسار (عكس الجمع).',
      operationType: 'خط الأعداد',
      lessonId: 'lesson_3',
      hint: 'الطرح = عكس الجمع.',
      difficulty: 2,
    ),
    Question(
      questionText: 'عند طرح عدد سالب على خط الأعداد، نتحرك:',
      options: ['يمين', 'يسار', 'لا نتحرك', 'لا يمكن تحديده'],
      correctAnswerIndex: 0,
      solution: 'طرح سالب = جمع موجب، يحركنا لليمين.',
      operationType: 'خط الأعداد',
      lessonId: 'lesson_3',
      hint: 'طرح سالب = يمين.',
      difficulty: 2,
    ),

    // ---------- المجموعة 4: مسائل حياتية (5 أسئلة) ----------
    Question(
      questionText: 'ارتفعت درجة الحرارة من -3°س إلى 5°س. ما مقدار الارتفاع؟',
      options: ['2', '5', '8', '-8'],
      correctAnswerIndex: 2,
      solution: 'مقدار الارتفاع = 5 - (-3) = 5 + 3 = 8°س',
      operationType: 'مسائل',
      lessonId: 'lesson_3',
      hint: 'اطرح: النهاية - البداية.',
      difficulty: 3,
    ),
    Question(
      questionText: 'انخفضت درجة الحرارة من 7°س إلى -2°س. ما مقدار الانخفاض؟',
      options: ['5', '7', '9', '-9'],
      correctAnswerIndex: 2,
      solution: 'مقدار الانخفاض = 7 - (-2) = 7 + 2 = 9°س',
      operationType: 'مسائل',
      lessonId: 'lesson_3',
      hint: 'اطرح: البداية - النهاية.',
      difficulty: 3,
    ),
    Question(
      questionText: 'كان رصيد أحمد 100 دينار، ثم سحب 150 دينار. ما رصيده الآن؟',
      options: ['50', '-50', '250', '-250'],
      correctAnswerIndex: 1,
      solution: '100 - 150 = -50 دينار',
      operationType: 'مسائل',
      lessonId: 'lesson_3',
      hint: 'السحب يعني طرح.',
      difficulty: 2,
    ),
    Question(
      questionText: 'غواصة على عمق -20 متر، ثم صعدت 15 متر. ما عمقها الآن؟',
      options: ['-5', '5', '-35', '35'],
      correctAnswerIndex: 0,
      solution: '-20 + 15 = -5 متر',
      operationType: 'مسائل',
      lessonId: 'lesson_3',
      hint: 'الصعود يعني جمع.',
      difficulty: 2,
    ),
    Question(
      questionText: 'درجة الحرارة في الصباح -5°س، وفي الظهر 8°س. ما الفرق؟',
      options: ['3', '13', '-13', '-3'],
      correctAnswerIndex: 1,
      solution: 'الفرق = 8 - (-5) = 8 + 5 = 13°س',
      operationType: 'مسائل',
      lessonId: 'lesson_3',
      hint: 'اطرح: الظهر - الصباح.',
      difficulty: 3,
    ),
  ],
);
