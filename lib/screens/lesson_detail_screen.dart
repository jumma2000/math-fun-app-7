import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../data/lessons_data.dart';
import 'contact_screen.dart';           // ✅ جديد
import 'quiz_screen.dart';

/// ============================================================
/// شاشة تفاصيل الدرس — تعرض الشرح والأمثلة
/// ============================================================
class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // ✅ فحص إذا الدرس مقفول
    bool isLocked = false;
    try {
      isLocked = isLessonLocked(lesson.id);
    } catch (e) {
      isLocked = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Column(
            children: [
              // ===== المحتوى (قابل للتمرير) =====
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ===== معلومات الدرس =====
                      _buildHeader(context),
                      const SizedBox(height: 20),

                      // ===== الشرح =====
                      _buildSectionTitle(context, '📖 الشرح', colorScheme.primary),
                      const SizedBox(height: 10),
                      ...lesson.sections.map(
                        (section) => _buildSectionPoint(context, section),
                      ),
                      const SizedBox(height: 25),

                      // ===== الأمثلة المحلولة =====
                      if (lesson.examples.isNotEmpty) ...[
                        _buildSectionTitle(
                          context,
                          '💡 أمثلة محلولة',
                          Colors.amber.shade800,
                        ),
                        const SizedBox(height: 10),
                        ...lesson.examples.asMap().entries.map(
                              (entry) => _buildExampleCard(
                                context,
                                entry.value,
                                entry.key + 1,
                              ),
                            ),
                        const SizedBox(height: 25),
                      ],
                    ],
                  ),
                ),
              ),

              // ===== زر "ابدأ الاختبار" =====
              _buildStartButton(context, isLocked),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ===== رأس الدرس =====
  // ============================================================
  Widget _buildHeader(BuildContext context) {
    try {
      final colorScheme = Theme.of(context).colorScheme;

      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      lesson.unit,
                      style: TextStyle(
                        fontSize: 13,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(Icons.quiz, size: 18, color: colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        '${lesson.questionsCount} سؤال',
                        style: TextStyle(
                          fontSize: 14,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                lesson.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade700,
                  height: 1.5,
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
  // ===== عنوان قسم =====
  // ============================================================
  Widget _buildSectionTitle(BuildContext context, String title, Color color) {
    try {
      return Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== نقطة شرح =====
  // ============================================================
  Widget _buildSectionPoint(BuildContext context, String text) {
    try {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.7,
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
  // ===== بطاقة المثال =====
  // ============================================================
  Widget _buildExampleCard(BuildContext context, Example example, int number) {
    try {
      return Card(
        elevation: 1,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.amber.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'مثال $number',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                example.question,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green.shade700,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'الحل:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      example.solution,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                  ],
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
  // ===== زر "ابدأ الاختبار" (محسّن مع القفل) =====
  // ============================================================
  Widget _buildStartButton(BuildContext context, bool isLocked) {
    try {
      final colorScheme = Theme.of(context).colorScheme;

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
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _startQuiz(context, isLocked),
            icon: Icon(
              isLocked ? Icons.lock : Icons.play_arrow,
              color: Colors.white,
            ),
            label: Text(
              isLocked ? 'الدرس مقفول' : 'ابدأ الاختبار',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: isLocked
                  ? Colors.grey.shade500
                  : colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
            ),
          ),
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== بدء الاختبار =====
  // ============================================================
  void _startQuiz(BuildContext context, bool isLocked) {
    try {
      // ✅ إذا الدرس مقفول، اعرض رسالة
      if (isLocked) {
        _showLockedDialog(context);
        return;
      }

      // ✅ إذا مفتوح، ابدأ الاختبار
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(lesson: lesson),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في بدء الاختبار: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ============================================================
  // ===== رسالة الدرس المقفول (معدّلة) =====
  // ============================================================
  void _showLockedDialog(BuildContext context) {
    try {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.lock, color: Colors.orange.shade700, size: 28),
              const SizedBox(width: 10),
              const Text(
                'الدرس مقفول',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: const Text(
            '🔒 هذا الدرس غير متاح حالياً.\n\n'
            '📚 للحصول على المنهج كامل (جميع الدروس والمواد)، '
            'تواصل معنا عبر:\n\n'
            '📱 واتساب: 00218911313949\n'
            '📧 البريد: dwjmt22@gmail.com',
            style: TextStyle(fontSize: 15, height: 1.6),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);       // ✅ أغلق الرسالة
                _goToContactScreen(context);        // ✅ اذهب لـ "اتصل بنا"
              },
              child: const Text(
                'حسناً',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      print('خطأ في عرض الرسالة: $e');
    }
  }

  // ============================================================
  // ===== الانتقال لـ "اتصل بنا" =====
  // ============================================================
  void _goToContactScreen(BuildContext context) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ContactScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في الانتقال: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}