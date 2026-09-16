import 'package:flutter/material.dart';
import '../data/lessons_data.dart';
import '../models/lesson.dart';
import 'contact_screen.dart';           // ✅ جديد
import 'lesson_detail_screen.dart';

/// ============================================================
/// شاشة قائمة الدروس — تعرض كل الدروس المتاحة
/// ============================================================
class LessonsListScreen extends StatelessWidget {
  const LessonsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // ✅ الحصول على الدروس (مع معالجة الأخطاء)
    List<Lesson> lessons = [];
    try {
      lessons = getLessonsSortedByOrder();
    } catch (e) {
      print('خطأ في تحميل الدروس: $e');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة الدروس'),
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: lessons.isEmpty
              ? _buildEmptyState(context)
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: lessons.length,
                  itemBuilder: (context, index) {
                    return _buildLessonCard(context, lessons[index], index);
                  },
                ),
        ),
      ),
    );
  }

  // ============================================================
  // ===== بطاقة الدرس (محسّنة مع القفل) =====
  // ============================================================
  Widget _buildLessonCard(BuildContext context, Lesson lesson, int index) {
    try {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;

      // ✅ فحص إذا الدرس مقفول
      bool isLocked = false;
      try {
        isLocked = isLessonLocked(lesson.id);
      } catch (e) {
        isLocked = false;
      }

      return Card(
        elevation: isLocked ? 1 : 3,
        margin: const EdgeInsets.only(bottom: 16),
        color: isLocked ? Colors.grey.shade100 : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: isLocked
              ? BorderSide(color: Colors.grey.shade300, width: 1.5)
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: () => _openLesson(context, lesson, isLocked),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // ===== رقم الدرس =====
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isLocked
                        ? Colors.grey.shade400
                        : colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: isLocked
                        ? const Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 28,
                          )
                        : Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 16),

                // ===== معلومات الدرس =====
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              lesson.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isLocked
                                    ? Colors.grey.shade700
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          // ✅ شارة "مجاني" أو "للطلب"
                          if (!isLocked)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'مجاني',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade800,
                                ),
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'للطلب',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange.shade800,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        lesson.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: isLocked
                              ? Colors.grey.shade600
                              : Colors.grey.shade700,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.quiz,
                            size: 16,
                            color: isLocked
                                ? Colors.grey.shade500
                                : colorScheme.primary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${lesson.questionsCount} سؤال',
                            style: TextStyle(
                              fontSize: 13,
                              color: isLocked
                                  ? Colors.grey.shade500
                                  : colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ===== أيقونة القفل/السهم =====
                Icon(
                  isLocked ? Icons.lock_outline : Icons.arrow_forward_ios,
                  size: 20,
                  color: isLocked
                      ? Colors.orange.shade600
                      : Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      print('خطأ في بطاقة الدرس: $e');
      return const SizedBox.shrink();
    }
  }

  // ============================================================
  // ===== حالة عدم وجود دروس =====
  // ============================================================
  Widget _buildEmptyState(BuildContext context) {
    try {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'لا توجد دروس متاحة حالياً',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
    } catch (e) {
      return const Center(child: Text('خطأ في العرض'));
    }
  }

  // ============================================================
  // ===== فتح الدرس =====
  // ============================================================
  void _openLesson(BuildContext context, Lesson lesson, bool isLocked) {
    try {
      // ✅ إذا الدرس مقفول، اعرض رسالة
      if (isLocked) {
        _showLockedDialog(context);
        return;
      }

      // ✅ إذا مفتوح، افتح الدرس
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LessonDetailScreen(lesson: lesson),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطأ في فتح الدرس: $e'),
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