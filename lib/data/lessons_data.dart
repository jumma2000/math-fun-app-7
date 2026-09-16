import '../models/lesson.dart';
import 'lessons/lesson_01_data.dart';
import 'lessons/lesson_02_data.dart';
import 'lessons/lesson_03_data.dart';
import 'lessons/lesson_04_data.dart';

/// ============================================================
/// قائمة كل الدروس في التطبيق
/// ============================================================
///
/// كل ما تضيف درس جديد:
/// 1. أنشئ ملف `lesson_XX_data.dart`
/// 2. استورده هنا
/// 3. أضفه للقائمة
///
/// ============================================================

/// ============================================================
/// الدروس المفتوحة (مجانية)
/// ============================================================
final List<Lesson> freeLessons = [
  lesson01, // ✅ الدرس الأول مجاني
];

/// ============================================================
/// الدروس المقفلة (تحتاج طلب)
/// ============================================================
final List<Lesson> lockedLessons = [
  lesson02, // 🔒 مقفول
  lesson03, // 🔒 مقفول
  lesson04, // 🔒 مقفول
];

/// ============================================================
/// قائمة كل الدروس
/// ============================================================
List<Lesson> allLessons = [
  ...freeLessons,
  ...lockedLessons,
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

/// عدد الدروس المفتوحة
int getFreeLessonsCount() {
  try {
    return freeLessons.length;
  } catch (e) {
    return 0;
  }
}

/// عدد الدروس المقفلة
int getLockedLessonsCount() {
  try {
    return lockedLessons.length;
  } catch (e) {
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
bool isLessonLocked(String lessonId) {
  try {
    final lesson = getLessonById(lessonId);
    if (lesson == null) return true;

    // البحث في الدروس المقفلة
    return lockedLessons.any((l) => l.id == lessonId);
  } catch (e) {
    print('خطأ في isLessonLocked: $e');
    return true; // افتراضياً مقفول
  }
}

/// هل الدرس مفتوح؟
bool isLessonFree(String lessonId) {
  try {
    return freeLessons.any((l) => l.id == lessonId);
  } catch (e) {
    return false;
  }
}