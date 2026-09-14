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

List<Lesson> allLessons = [
  lesson01,
  lesson02,
  lesson03,   // ← لما نضيفه
  lesson04,   // ← لما نضيفه
  // ...
];

/// ============================================================
/// دوال مساعدة
/// ============================================================

/// الحصول على درس حسب المعرف
Lesson? getLessonById(String id) {
  try {
    return allLessons.firstWhere((lesson) => lesson.id == id);
  } catch (e) {
    return null;
  }
}

/// عدد الدروس
int getTotalLessonsCount() {
  return allLessons.length;
}

/// الدروس مرتبة حسب الترتيب
List<Lesson> getLessonsSortedByOrder() {
  final sorted = List<Lesson>.from(allLessons);
  sorted.sort((a, b) => a.order.compareTo(b.order));
  return sorted;
}