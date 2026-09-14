import 'question.dart';   // ✅ أضف هذا السطر
/// ============================================================
/// نموذج الدرس — يمثل درساً واحداً في المنهج
/// ============================================================
class Lesson {
  // ===== الحقول الأساسية =====
  final String id;                 // معرف الدرس (مثل: lesson_1)
  final String title;              // عنوان الدرس
  final String description;        // وصف مختصر
  final String unit;               // الوحدة (مثل: الوحدة 1)
  final int order;                 // ترتيب الدرس

  // ===== المحتوى =====
  final List<String> sections;     // أقسام الشرح (نقاط)
  final List<Example> examples;    // الأمثلة المحلولة
  final List<Question> questions;  // الأسئلة

  // ===== البناء =====
  Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.unit,
    required this.order,
    required this.sections,
    required this.examples,
    required this.questions,
  });

  // ===== عدد الأسئلة =====
  int get questionsCount => questions.length;

  // ===== للطباعة =====
  @override
  String toString() {
    return 'Lesson(id: $id, title: $title, questions: $questionsCount)';
  }
}

/// ============================================================
/// نموذج المثال المحلول
/// ============================================================
class Example {
  final String question;    // نص السؤال
  final String solution;    // الحل خطوة بخطوة

  Example({
    required this.question,
    required this.solution,
  });
}