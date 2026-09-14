import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../services/quiz_engine.dart';
import 'result_screen.dart';
import 'solution_screen.dart';

/// ============================================================
/// شاشة الاختبار — تعرض الأسئلة الخاصة بدرس معين
/// ============================================================
class QuizScreen extends StatefulWidget {
  final Lesson lesson;

  const QuizScreen({super.key, required this.lesson});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizEngine _quizEngine;

  @override
  void initState() {
    super.initState();
    try {
      _quizEngine = QuizEngine(questions: widget.lesson.questions);
    } catch (e) {
      print('خطأ في تهيئة المحرك: $e');
    }
  }

  // ============================================================
  // ===== بناء الواجهة =====
  // ============================================================
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: _showResetDialog,
            tooltip: 'إعادة الاختبار',
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            children: [
              // ===== شريط التقدم =====
              _buildProgressBar(),

              // ===== رأس السؤال =====
              _buildQuestionHeader(),

              // ===== السؤال + الخيارات (قابل للتمرير) =====
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      _buildQuestionCard(),
                      const SizedBox(height: 10),
                      ...List.generate(
                        _quizEngine.getCurrentQuestion().options.length,
                        (index) => _buildOptionButton(index),
                      ),
                    ],
                  ),
                ),
              ),

              // ===== أزرار التنقل =====
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ===== شريط التقدم =====
  // ============================================================
  Widget _buildProgressBar() {
    try {
      final theme = Theme.of(context);
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'السؤال ${_quizEngine.getCurrentQuestionNumber()} من ${_quizEngine.getTotalQuestions()}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${(_quizEngine.getProgress() * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: _quizEngine.getProgress(),
                minHeight: 10,
                backgroundColor: Colors.grey.shade200,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== رأس السؤال =====
  // ============================================================
  Widget _buildQuestionHeader() {
    try {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: _getOperationColor(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _quizEngine.getOperationType(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green.shade700, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${_quizEngine.correctAnswers}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                  Icon(Icons.cancel, color: Colors.red.shade700, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '${_quizEngine.wrongAnswers}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== لون العملية =====
  // ============================================================
  Color _getOperationColor() {
    try {
      String type = _quizEngine.getOperationType();
      if (type.contains('جمع')) return Colors.green.shade700;
      if (type.contains('طرح')) return Colors.orange.shade700;
      if (type.contains('ضرب')) return Colors.purple.shade700;
      if (type.contains('قسمة')) return Colors.red.shade700;
      if (type.contains('زوجية') || type.contains('فردية')) return Colors.blue.shade700;
      if (type.contains('مقارنة')) return Colors.teal.shade700;
      return Colors.blue.shade700;
    } catch (e) {
      return Colors.blue.shade700;
    }
  }

  // ============================================================
  // ===== بطاقة السؤال =====
  // ============================================================
  Widget _buildQuestionCard() {
    try {
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _quizEngine.getCurrentQuestion().questionText,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              // التلميح
              if (_quizEngine.getCurrentQuestion().hint != null &&
                  !_quizEngine.hasAnswered())
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb_outline,
                          color: Colors.amber.shade700, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'تلميح: ${_quizEngine.getCurrentQuestion().hint}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // زر عرض الحل
              if (_quizEngine.hasAnswered())
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: InkWell(
                    onTap: _showSolution,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.amber.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lightbulb,
                              color: Colors.amber.shade700, size: 22),
                          const SizedBox(width: 8),
                          Text(
                            'عرض الحل',
                            style: TextStyle(
                              color: Colors.amber.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== عرض الحل =====
  // ============================================================
  void _showSolution() {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SolutionScreen(
            solution: _quizEngine.getSolution(),
            operationType: _quizEngine.getOperationType(),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في عرض الحل: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ============================================================
  // ===== زر الخيار =====
  // ============================================================
  Widget _buildOptionButton(int index) {
    try {
      final question = _quizEngine.getCurrentQuestion();
      final isSelected = _quizEngine.isAnswerSelected(index);
      final isCorrect = _quizEngine.isAnswerCorrect(index);
      final hasAnswered = _quizEngine.hasAnswered();

      Color? buttonColor;
      Color? borderColor;
      if (hasAnswered) {
        if (isCorrect) {
          buttonColor = Colors.green.shade50;
          borderColor = Colors.green;
        } else if (isSelected && !isCorrect) {
          buttonColor = Colors.red.shade50;
          borderColor = Colors.red;
        } else {
          buttonColor = Colors.grey.shade50;
          borderColor = Colors.grey.shade300;
        }
      } else {
        buttonColor = Colors.white;
        borderColor = isSelected ? Colors.blue : Colors.grey.shade300;
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: ElevatedButton(
          onPressed: hasAnswered
              ? null
              : () {
                  try {
                    setState(() {
                      _quizEngine.selectAnswer(index);
                    });
                  } catch (e) {
                    print('خطأ: $e');
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.black87,
            elevation: hasAnswered ? 0 : 2,
            shadowColor: Colors.black.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: borderColor, width: 1.5),
            ),
            minimumSize: const Size(double.infinity, 64),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          child: Row(
            children: [
              // ✅ دائرة الحرف (A, B, C, D) — مكبّرة
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? Colors.blue.shade700
                      : Colors.grey.shade300,
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(65 + index),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  question.options[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (hasAnswered && isCorrect)
                Icon(Icons.check_circle, color: Colors.green.shade700, size: 28),
              if (hasAnswered && isSelected && !isCorrect)
                Icon(Icons.cancel, color: Colors.red.shade700, size: 28),
            ],
          ),
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== أزرار التنقل =====
  // ============================================================
  Widget _buildNavigationButtons() {
    try {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: _quizEngine.currentQuestionIndex == 0
                  ? null
                  : () {
                      setState(() {
                        _quizEngine.previousQuestion();
                      });
                    },
              icon: const Icon(Icons.arrow_forward_ios, size: 18),
              label: const Text('السابق'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade200,
                foregroundColor: Colors.black87,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            if (_quizEngine.isLastQuestion)
              ElevatedButton.icon(
                onPressed: _quizEngine.isQuizComplete ? _goToResultScreen : null,
                icon: const Icon(Icons.flag),
                label: const Text('إنهاء'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )
            else
              ElevatedButton.icon(
                onPressed: _quizEngine.hasAnswered()
                    ? () {
                        setState(() {
                          _quizEngine.nextQuestion();
                        });
                      }
                    : null,
                icon: const Icon(Icons.arrow_back_ios, size: 18),
                label: const Text('التالي'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
          ],
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== الانتقال لشاشة النتيجة =====
  // ============================================================
  void _goToResultScreen() {
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            correctAnswers: _quizEngine.getCorrectAnswers(),
            wrongAnswers: _quizEngine.getWrongAnswers(),
            totalQuestions: _quizEngine.getTotalQuestions(),
            evaluation: _quizEngine.getEvaluation(),
            evaluationMessage: _quizEngine.getEvaluationMessage(),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ============================================================
  // ===== نافذة إعادة الاختبار =====
  // ============================================================
  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(Icons.restart_alt, color: Colors.orange),
            SizedBox(width: 10),
            Text('إعادة الاختبار'),
          ],
        ),
        content: const Text(
          'هل أنت متأكد من إعادة الاختبار؟ سيتم فقدان التقدم الحالي.',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _quizEngine.reset();
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange.shade700,
              foregroundColor: Colors.white,
            ),
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}