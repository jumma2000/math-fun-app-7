import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

/// مجموعة من الدوال المساعدة المستخدمة في جميع أنحاء التطبيق
class Helpers {
  // ==================== دوال التاريخ والوقت ====================

  /// تنسيق التاريخ إلى صيغة (YYYY-MM-DD)
  static String formatDate(DateTime date) {
    try {
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return 'تاريخ غير صالح';
    }
  }

  /// تنسيق التاريخ إلى صيغة (DD/MM/YYYY)
  static String formatDateArabic(DateTime date) {
    try {
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return 'تاريخ غير صالح';
    }
  }

  /// تنسيق التاريخ إلى صيغة (يوم، شهر، سنة) بالعربية
  static String formatDateFullArabic(DateTime date) {
    try {
      final formatter = DateFormat('EEEE، d MMMM، yyyy', 'ar');
      return formatter.format(date);
    } catch (e) {
      return 'تاريخ غير صالح';
    }
  }

  /// الحصول على تاريخ اليوم كـ String
  static String getTodayDate() {
    return formatDate(DateTime.now());
  }

  /// التحقق من أن التاريخ في المستقبل
  static bool isFutureDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return date.isAfter(today) || date.isAtSameMomentAs(today);
  }

  /// حساب عدد الأيام المتبقية حتى تاريخ معين
  static int daysRemaining(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now);
    return difference.inDays;
  }

  /// الحصول على اسم الشهر بالعربية
  static String getMonthName(int month) {
    const months = [
      'يناير', 'فبراير', 'مارس', 'أبريل',
      'مايو', 'يونيو', 'يوليو', 'أغسطس',
      'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return months[month - 1];
  }

  // ==================== دوال المبالغ والمال ====================

  /// تنسيق المبلغ كـ عملة (ريال)
  static String formatCurrency(double amount) {
    try {
      final formatter = NumberFormat.currency(
        symbol: 'ريال',
        decimalDigits: 2,
      );
      return formatter.format(amount);
    } catch (e) {
      return '$amount ريال';
    }
  }

  /// تنسيق المبلغ بدون عملة
  static String formatNumber(double amount) {
    try {
      final formatter = NumberFormat('#,##0.00');
      return formatter.format(amount);
    } catch (e) {
      return amount.toString();
    }
  }

  /// تنسيق المبلغ بالأرقام العربية
  static String formatCurrencyArabic(double amount) {
    try {
      final formatter = NumberFormat.currency(
        symbol: '﷼',
        decimalDigits: 2,
        locale: 'ar',
      );
      return formatter.format(amount);
    } catch (e) {
      return '$amount ﷼';
    }
  }

  /// تحويل النص إلى رقم (مع التعامل مع الفواصل)
  static double? parseAmount(String value) {
    try {
      // إزالة الفواصل والمسافات
      final cleaned = value.replaceAll(RegExp(r'[,\s]'), '');
      return double.tryParse(cleaned);
    } catch (e) {
      return null;
    }
  }

  // ==================== دوال النصوص ====================

  /// اختصار النص إذا كان طويلاً
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// تحويل النص إلى حالة العنوان (Title Case)
  static String toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  /// التحقق من أن النص فارغ أو null
  static bool isNullOrEmpty(String? text) {
    return text == null || text.trim().isEmpty;
  }

  /// الحصول على الأحرف الأولى من النص (للأفاتار)
  static String getInitials(String text) {
    if (isNullOrEmpty(text)) return '?';
    final words = text.trim().split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return text.substring(0, 1).toUpperCase();
  }

  /// إزالة التشكيل من النص العربي
  static String removeDiacritics(String text) {
    const diacritics = 'ًٌٍَُِّْ';
    return text.split('').where((char) => !diacritics.contains(char)).join();
  }

  // ==================== دوال الألوان ====================

  /// تحويل لون Hex إلى Color
  static Color hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) {
      buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// الحصول على لون عشوائي
  static Color getRandomColor() {
    final random = DateTime.now().millisecondsSinceEpoch % 1000;
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];
    return colors[random % colors.length];
  }

  /// الحصول على لون بناءً على نص (ثابت)
  static Color getColorFromString(String text) {
    int hash = 0;
    for (int i = 0; i < text.length; i++) {
      hash = text.codeUnitAt(i) + ((hash << 5) - hash);
    }
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.red,
      Colors.cyan,
    ];
    return colors[(hash.abs() % colors.length)];
  }

  // ==================== دوال الشاشة والتصميم ====================

  /// الحصول على عرض الشاشة
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// الحصول على ارتفاع الشاشة
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// التحقق من أن الشاشة صغيرة (هاتف)
  static bool isSmallScreen(BuildContext context) {
    return screenWidth(context) < 600;
  }

  /// التحقق من أن الشاشة كبيرة (تابلت)
  static bool isLargeScreen(BuildContext context) {
    return screenWidth(context) >= 1200;
  }

  /// إظهار SnackBar
  static void showSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.green,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  /// إظهار SnackBar للخطأ
  static void showErrorSnackBar(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: Colors.red.shade700,
    );
  }

  /// إظهار SnackBar للنجاح
  static void showSuccessSnackBar(BuildContext context, String message) {
    showSnackBar(
      context,
      message,
      backgroundColor: Colors.green.shade700,
    );
  }

  // ==================== دوال العرض التقديري ====================

  /// الحصول على حجم الخط المناسب للشاشة
  static double responsiveFontSize(BuildContext context, double size) {
    final scale = screenWidth(context) / 375; // 375 هو عرض iPhone SE
    return size * (scale > 1.5 ? 1.5 : scale);
  }

  /// الحصول على مسافة مناسبة للشاشة
  static double responsivePadding(BuildContext context) {
    final width = screenWidth(context);
    if (width < 600) return 16.0;
    if (width < 900) return 24.0;
    return 32.0;
  }

  // ==================== دوال الملفات ====================

  /// التحقق من وجود ملف
  static Future<bool> fileExists(String path) async {
    try {
      final file = File(path);
      return await file.exists();
    } catch (e) {
      return false;
    }
  }

  /// الحصول على حجم الملف (بالـ MB)
  static Future<String> getFileSize(String path) async {
    try {
      final file = File(path);
      if (!await file.exists()) return '0 MB';
      final size = await file.length();
      if (size > 1024 * 1024) {
        return '${(size / (1024 * 1024)).toStringAsFixed(2)} MB';
      }
      return '${(size / 1024).toStringAsFixed(2)} KB';
    } catch (e) {
      return 'غير معروف';
    }
  }

  // ==================== دوال متنوعة ====================

  /// إنشاء معرف فريد
  static String generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// نسخ النص إلى الحافظة
  static void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    showSnackBar(context, 'تم النسخ إلى الحافظة');
  }

  /// التحقق من أن السلسلة تحتوي على أرقام فقط
  static bool isNumeric(String text) {
    return RegExp(r'^[0-9]+$').hasMatch(text);
  }

  /// التحقق من أن السلسلة تحتوي على أحرف فقط
  static bool isAlpha(String text) {
    return RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(text);
  }

  /// إزالة المسافات الزائدة
  static String removeExtraSpaces(String text) {
    return text.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// تحديد ما إذا كان الجهاز يعمل بنظام iOS
  static bool isIOS() {
    return Platform.isIOS;
  }

  /// تحديد ما إذا كان الجهاز يعمل بنظام Android
  static bool isAndroid() {
    return Platform.isAndroid;
  }

  /// تحديد ما إذا كان الجهاز يعمل بنظام Web
  static bool isWeb() {
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }
}

/// تحسين للأرقام العربية
extension ArabicNumberExtension on String {
  /// تحويل الأرقام الإنجليزية إلى أرقام عربية
  String toArabicNumbers() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    String result = this;
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], arabic[i]);
    }
    return result;
  }

  /// تحويل الأرقام العربية إلى أرقام إنجليزية
  String toEnglishNumbers() {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    String result = this;
    for (int i = 0; i < arabic.length; i++) {
      result = result.replaceAll(arabic[i], english[i]);
    }
    return result;
  }
}

/// تحسين للتاريخ
extension DateTimeExtension on DateTime {
  /// الحصول على التاريخ كـ String بصيغة (YYYY-MM-DD)
  String toDateString() {
    return Helpers.formatDate(this);
  }

  /// الحصول على التاريخ كـ String بصيغة (DD/MM/YYYY)
  String toArabicDateString() {
    return Helpers.formatDateArabic(this);
  }

  /// الحصول على التاريخ كـ String بصيغة كاملة بالعربية
  String toFullArabicString() {
    return Helpers.formatDateFullArabic(this);
  }

  /// حساب الأيام المتبقية
  int daysRemaining() {
    return Helpers.daysRemaining(this);
  }

  /// التحقق من أن التاريخ في المستقبل
  bool isFuture() {
    return Helpers.isFutureDate(this);
  }
}