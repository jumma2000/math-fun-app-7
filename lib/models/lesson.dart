import 'question.dart';

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

  // ===== القفل (جديد) =====
  final bool isLocked;             // هل الدرس مقفول؟

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
    this.isLocked = false,         // ✅ القيمة الافتراضية: مفتوح
  });

  // ===== عدد الأسئلة =====
  int get questionsCount {
    try {
      return questions.length;
    } catch (e) {
      print('خطأ في عدد الأسئلة: $e');
      return 0;
    }
  }

  // ===== هل الدرس مفتوح؟ =====
  bool get isUnlocked {
    try {
      return !isLocked;
    } catch (e) {
      return true;
    }
  }

  // ===== للطباعة =====
  @override
  String toString() {
    try {
      return 'Lesson(id: $id, title: $title, questions: $questionsCount, isLocked: $isLocked)';
    } catch (e) {
      return 'Lesson(id: $id)';
    }
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

  // ===== للطباعة =====
  @override
  String toString() {
    try {
      return 'Example(question: $question)';
    } catch (e) {
      return 'Example()';
    }
  }
}