import '../models/question.dart';

List<Question> allQuestions = [
  // ===== جمع ===== (4 أسئلة)
  Question(
    questionText: 'ما ناتج ¼ + ¼؟',
    options: ['½', '¼', '1', '¾'],
    correctAnswerIndex: 0,
    solution: '¼ + ¼ = (1+1)/4 = 2/4 = ½',
    operationType: 'جمع',
  ),
  Question(
    questionText: 'ما ناتج ½ + ¼؟',
    options: ['¾', '½', '¼', '1'],
    correctAnswerIndex: 0,
    solution: '½ + ¼ = 2/4 + 1/4 = 3/4 = ¾',
    operationType: 'جمع',
  ),
  Question(
    questionText: 'ما ناتج ⅓ + ⅓؟',
    options: ['⅔', '⅓', '1', '½'],
    correctAnswerIndex: 0,
    solution: '⅓ + ⅓ = (1+1)/3 = 2/3 = ⅔',
    operationType: 'جمع',
  ),
  Question(
    questionText: 'ما ناتج ½ + ½؟',
    options: ['1', '½', '¾', '¼'],
    correctAnswerIndex: 0,
    solution: '½ + ½ = (1+1)/2 = 2/2 = 1',
    operationType: 'جمع',
  ),

  // ===== طرح ===== (4 أسئلة)
  Question(
    questionText: 'ما ناتج ¾ - ¼؟',
    options: ['½', '¼', '1', '¾'],
    correctAnswerIndex: 0,
    solution: '¾ - ¼ = (3-1)/4 = 2/4 = ½',
    operationType: 'طرح',
  ),
  Question(
    questionText: 'ما ناتج 1 - ½؟',
    options: ['½', '¼', '¾', '1'],
    correctAnswerIndex: 0,
    solution: '1 - ½ = 2/2 - 1/2 = 1/2 = ½',
    operationType: 'طرح',
  ),
  Question(
    questionText: 'ما ناتج ⅔ - ⅓؟',
    options: ['⅓', '⅔', '1', '½'],
    correctAnswerIndex: 0,
    solution: '⅔ - ⅓ = (2-1)/3 = 1/3 = ⅓',
    operationType: 'طرح',
  ),
  Question(
    questionText: 'ما ناتج ⅘ - ⅕؟',
    options: ['⅗', '⅘', '1', '½'],
    correctAnswerIndex: 0,
    solution: '⅘ - ⅕ = (4-1)/5 = 3/5 = ⅗',
    operationType: 'طرح',
  ),

  // ===== ضرب ===== (4 أسئلة)
  Question(
    questionText: 'ما ناتج ½ × ½؟',
    options: ['¼', '½', '¾', '1'],
    correctAnswerIndex: 0,
    solution: '½ × ½ = (1×1)/(2×2) = 1/4 = ¼',
    operationType: 'ضرب',
  ),
  Question(
    questionText: 'ما ناتج ⅓ × ½؟',
    options: ['⅙', '⅓', '½', '¼'],
    correctAnswerIndex: 0,
    solution: '⅓ × ½ = (1×1)/(3×2) = 1/6 = ⅙',
    operationType: 'ضرب',
  ),
  Question(
    questionText: 'ما ناتج ¾ × ⅓؟',
    options: ['¼', '½', '¾', '⅓'],
    correctAnswerIndex: 0,
    solution: '¾ × ⅓ = (3×1)/(4×3) = 3/12 = 1/4 = ¼',
    operationType: 'ضرب',
  ),
  Question(
    questionText: 'ما ناتج ⅔ × ¾؟',
    options: ['½', '⅓', '¼', '¾'],
    correctAnswerIndex: 0,
    solution: '⅔ × ¾ = (2×3)/(3×4) = 6/12 = 1/2 = ½',
    operationType: 'ضرب',
  ),

  // ===== قسمة ===== (3 أسئلة)
  Question(
    questionText: 'ما ناتج ½ ÷ ¼؟',
    options: ['2', '½', '¼', '1'],
    correctAnswerIndex: 0,
    solution: '½ ÷ ¼ = ½ × 4/1 = (1×4)/(2×1) = 4/2 = 2',
    operationType: 'قسمة',
  ),
  Question(
    questionText: 'ما ناتج ¾ ÷ ½؟',
    options: ['1½', '¾', '½', '1'],
    correctAnswerIndex: 0,
    solution: '¾ ÷ ½ = ¾ × 2/1 = (3×2)/(4×1) = 6/4 = 3/2 = 1½',
    operationType: 'قسمة',
  ),
  Question(
    questionText: 'ما ناتج ⅓ ÷ ⅓؟',
    options: ['1', '⅓', '⅙', '½'],
    correctAnswerIndex: 0,
    solution: '⅓ ÷ ⅓ = ⅓ × 3/1 = (1×3)/(3×1) = 3/3 = 1',
    operationType: 'قسمة',
  ),
];
