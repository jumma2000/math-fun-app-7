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
        title: Text(
          widget.lesson.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
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
              _buildProgressBar(),
              _buildQuestionHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Column(
                    children: [
                      _buildQuestionCard(),
                      const SizedBox(height: 6),
                      ...List.generate(
                        _quizEngine.getCurrentQuestion().options.length,
                        (index) => _buildOptionButton(index),
                      ),
                    ],
                  ),
                ),
              ),
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
      final colorScheme = theme.colorScheme;
      final progress = _quizEngine.getProgress();

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.quiz_outlined,
                      color: colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'السؤال ${_quizEngine.getCurrentQuestionNumber()} من ${_quizEngine.getTotalQuestions()}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${(progress * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 12,
                backgroundColor: Colors.grey.shade200,
                color: colorScheme.primary,
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ===== نوع العملية =====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _getOperationColor(),
                    _getOperationColor().withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: _getOperationColor().withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.category,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _quizEngine.getOperationType(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // ===== عداد الإجابات =====
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _buildScoreBadge(
                    icon: Icons.check_circle,
                    count: _quizEngine.correctAnswers,
                    color: Colors.green.shade600,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 1,
                    height: 18,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 10),
                  _buildScoreBadge(
                    icon: Icons.cancel,
                    count: _quizEngine.wrongAnswers,
                    color: Colors.red.shade600,
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

  Widget _buildScoreBadge({
    required IconData icon,
    required int count,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 4),
        Text(
          '$count',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: color,
          ),
        ),
      ],
    );
  }

  Color _getOperationColor() {
    try {
      String type = _quizEngine.getOperationType();
      if (type.contains('جمع')) return Colors.green.shade600;
      if (type.contains('طرح')) return Colors.orange.shade700;
      if (type.contains('ضرب')) return Colors.purple.shade600;
      if (type.contains('قسمة')) return Colors.red.shade600;
      if (type.contains('زوجية') || type.contains('فردية')) {
        return Colors.blue.shade600;
      }
      if (type.contains('مقارنة')) return Colors.teal.shade600;
      return Colors.blue.shade600;
    } catch (e) {
      return Colors.blue.shade600;
    }
  }

  // ============================================================
  // ===== بطاقة السؤال (مصغّرة + بدون تلميح) =====
  // ============================================================
  Widget _buildQuestionCard() {
    try {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.primary.withOpacity(0.05),
              Colors.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: colorScheme.primary.withOpacity(0.15),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,   // ✅ مصغّر
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== أيقونة "السؤال" =====
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.help_outline,
                      color: colorScheme.primary,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'السؤال',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // ===== نص السؤال =====
              Text(
                _quizEngine.getCurrentQuestion().questionText,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),

              // ❌ تم حذف التلميح

              // ===== زر عرض الحل =====
              if (_quizEngine.hasAnswered())
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: InkWell(
                    onTap: _showSolution,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.amber.shade400,
                            Colors.amber.shade600,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.amber.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.lightbulb,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'عرض الحل',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
      final colorScheme = Theme.of(context).colorScheme;

      Color? buttonColor;
      Color? borderColor;
      Color? iconColor;
      IconData? icon;

      if (hasAnswered) {
        if (isCorrect) {
          buttonColor = Colors.green.shade50;
          borderColor = Colors.green.shade400;
          iconColor = Colors.green.shade600;
          icon = Icons.check_circle;
        } else if (isSelected && !isCorrect) {
          buttonColor = Colors.red.shade50;
          borderColor = Colors.red.shade400;
          iconColor = Colors.red.shade600;
          icon = Icons.cancel;
        } else {
          buttonColor = Colors.grey.shade50;
          borderColor = Colors.grey.shade200;
        }
      } else {
        buttonColor = Colors.white;
        borderColor =
            isSelected ? colorScheme.primary : Colors.grey.shade200;
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: borderColor ?? Colors.grey.shade300,
              width: isSelected ? 2 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: hasAnswered
                    ? Colors.transparent
                    : (isSelected
                        ? colorScheme.primary.withOpacity(0.2)
                        : Colors.black.withOpacity(0.05)),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: hasAnswered
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
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    // ===== دائرة الحرف =====
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: isSelected
                            ? LinearGradient(
                                colors: [
                                  colorScheme.primary,
                                  colorScheme.primary.withOpacity(0.7),
                                ],
                              )
                            : null,
                        color: isSelected ? null : Colors.grey.shade100,
                        shape: BoxShape.circle,
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: colorScheme.primary
                                      .withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ]
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          String.fromCharCode(65 + index),
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),

                    // ===== نص الخيار =====
                    Expanded(
                      child: Text(
                        question.options[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),

                    // ===== أيقونة النتيجة =====
                    if (icon != null)
                      Icon(icon, color: iconColor, size: 30),
                  ],
                ),
              ),
            ),
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
      final colorScheme = Theme.of(context).colorScheme;

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, -3),
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
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
              label: const Text(
                'السابق',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade100,
                foregroundColor: Colors.grey.shade700,
                disabledBackgroundColor: Colors.grey.shade100,
                disabledForegroundColor: Colors.grey.shade400,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
            ),
            if (_quizEngine.isLastQuestion)
              ElevatedButton.icon(
                onPressed:
                    _quizEngine.isQuizComplete ? _goToResultScreen : null,
                icon: const Icon(Icons.flag, size: 20),
                label: const Text(
                  'إنهاء',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.green.shade200,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  shadowColor: Colors.green.withOpacity(0.4),
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
                icon: const Icon(Icons.arrow_back_ios, size: 16),
                label: const Text(
                  'التالي',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade200,
                  disabledForegroundColor: Colors.grey.shade400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  shadowColor: colorScheme.primary.withOpacity(0.4),
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