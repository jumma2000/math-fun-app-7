import 'package:flutter/material.dart';
import '../services/quiz_engine.dart';
import 'result_screen.dart';
import 'solution_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizEngine _quizEngine;

  @override
  void initState() {
    super.initState();
    _quizEngine = QuizEngine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اختبار الكسور'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: () {
              _showResetDialog();
            },
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            // شريط التقدم
            _buildProgressBar(),

            // نوع العملية ورقم السؤال
            _buildQuestionHeader(),

            // السؤال
            _buildQuestionCard(),

            // الخيارات
            Expanded(
              child: _buildOptionsList(),
            ),

            // أزرار التنقل
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'السؤال ${_quizEngine.getCurrentQuestionNumber()} من ${_quizEngine.getTotalQuestions()}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                '${(_quizEngine.getProgress() * 100).toInt()}%',
                style: const TextStyle(fontSize: 14),
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
              color: Colors.blue.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '✓ ${_quizEngine.correctAnswers} | ✗ ${_quizEngine.wrongAnswers}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Color _getOperationColor() {
    String type = _quizEngine.getOperationType();
    switch (type) {
      case 'جمع':
        return Colors.green;
      case 'طرح':
        return Colors.orange;
      case 'ضرب':
        return Colors.purple;
      case 'قسمة':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  Widget _buildQuestionCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
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
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              if (_quizEngine.hasAnswered())
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.lightbulb_outline, color: Colors.amber),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SolutionScreen(
                              solution: _quizEngine.getSolution(),
                              operationType: _quizEngine.getOperationType(),
                            ),
                          ),
                        );
                      },
                      tooltip: 'عرض الحل',
                    ),
                    const Text(
                      'عرض الحل',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildOptionButton(index);
        },
      ),
    );
  }

  Widget _buildOptionButton(int index) {
    final question = _quizEngine.getCurrentQuestion();
    final isSelected = _quizEngine.isAnswerSelected(index);
    final isCorrect = _quizEngine.isAnswerCorrect(index);
    final hasAnswered = _quizEngine.hasAnswered();

    Color? buttonColor;
    if (hasAnswered) {
      if (isCorrect) {
        buttonColor = Colors.green.shade100;
      } else if (isSelected && !isCorrect) {
        buttonColor = Colors.red.shade100;
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: hasAnswered
            ? null
            : () {
                setState(() {
                  _quizEngine.selectAnswer(index);
                });
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.grey.shade50,
          foregroundColor: Colors.black,
          elevation: hasAnswered ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? Colors.blue.shade700
                    : Colors.grey.shade300,
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index), // A, B, C, D
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                question.options[index],
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (hasAnswered && isCorrect)
              const Icon(Icons.check_circle, color: Colors.green),
            if (hasAnswered && isSelected && !isCorrect)
              const Icon(Icons.cancel, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
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
            icon: const Icon(Icons.arrow_forward_ios),
            label: const Text('السابق'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
          if (_quizEngine.isLastQuestion)
            ElevatedButton.icon(
              onPressed: _quizEngine.isQuizComplete
                  ? () {
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
                    }
                  : null,
              icon: const Icon(Icons.flag),
              label: const Text('إنهاء'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
              icon: const Icon(Icons.arrow_back_ios),
              label: const Text('التالي'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
        ],
      ),
    );
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إعادة الاختبار'),
        content: const Text('هل أنت متأكد من إعادة الاختبار؟ سيتم فقدان التقدم الحالي.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _quizEngine.reset();
              });
              Navigator.pop(context);
            },
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}