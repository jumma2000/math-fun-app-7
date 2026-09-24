import '../models/lesson.dart';
import 'lessons/lesson_01_data.dart';
import 'lessons/lesson_02_data.dart';
import 'lessons/lesson_03_data.dart';
import 'lessons/lesson_04_data.dart';
import 'lessons/lesson_05_data.dart';
import 'lessons/lesson_06_data.dart';
import 'lessons/lesson_07_data.dart';
/// ============================================================
/// قائمة الدروس في التطبيق
/// ============================================================
///
/// كل الدروس مفتوحة حالياً.
///
/// كل ما تضيف درس جديد:
/// 1. أنشئ ملف `lesson_XX_data.dart`
/// 2. استورده هنا
/// 3. أضفه للقائمة `allLessons`
///
/// ============================================================

/// ============================================================
/// قائمة كل الدروس (مفتوحة)
/// ============================================================
List<Lesson> allLessons = [
  lesson01,
  lesson02,
  lesson03,
  lesson04,
  lesson05,
  lesson06,
  lesson07,
];

/// ============================================================
/// دوال مساعدة
/// ============================================================

/// الحصول على درس حسب المعرف
Lesson? getLessonById(String id) {
  try {
    return allLessons.firstWhere((lesson) => lesson.id == id);
  } catch (e) {
    print('خطأ في getLessonById: $e');
    return null;
  }
}

/// عدد الدروس الكلي
int getTotalLessonsCount() {
  try {
    return allLessons.length;
  } catch (e) {
    print('خطأ في getTotalLessonsCount: $e');
    return 0;
  }
}

/// الدروس مرتبة حسب الترتيب
List<Lesson> getLessonsSortedByOrder() {
  try {
    final sorted = List<Lesson>.from(allLessons);
    sorted.sort((a, b) => a.order.compareTo(b.order));
    return sorted;
  } catch (e) {
    print('خطأ في getLessonsSortedByOrder: $e');
    return [];
  }
}

/// هل الدرس مقفول؟
/// (حالياً: كل الدروس مفتوحة → ترجع false دايماً)
bool isLessonLocked(String lessonId) {
  try {
    // ✅ كل الدروس مفتوحة
    return false;
  } catch (e) {
    print('خطأ في isLessonLocked: $e');
    return false;
  }
}

/// هل الدرس مفتوح؟
bool isLessonFree(String lessonId) {
  try {
    return allLessons.any((l) => l.id == lessonId);
  } catch (e) {
    print('خطأ في isLessonFree: $e');
    return false;
  }
}