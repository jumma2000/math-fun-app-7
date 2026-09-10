/// مجموعة من دوال التحقق من صحة المدخلات
/// تستخدم في نماذج الإدخال (Forms) للتأكد من صحة البيانات
class Validators {
  /// التحقق من أن الحقل غير فارغ
  static String? requiredField(String? value, {String fieldName = 'هذا الحقل'}) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال $fieldName';
    }
    return null;
  }

  /// التحقق من صحة الاسم (يحتوي على أحرف ومسافات فقط)
  static String? validateName(String? value) {
    final result = requiredField(value, fieldName: 'الاسم');
    if (result != null) return result;

    // التحقق من أن الاسم يحتوي على أحرف ومسافات فقط
    final nameRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value!.trim())) {
      return 'الاسم يجب أن يحتوي على أحرف عربية فقط';
    }

    if (value.trim().length < 2) {
      return 'الاسم يجب أن لا يقل عن حرفين';
    }

    if (value.trim().length > 50) {
      return 'الاسم يجب أن لا يتجاوز 50 حرفاً';
    }

    return null;
  }

  /// التحقق من صحة رقم الهاتف (السعودي)
  static String? validatePhone(String? value) {
    final result = requiredField(value, fieldName: 'رقم الهاتف');
    if (result != null) return result;

    // دعم صيغ متعددة: 05xxxxxxxx أو 5xxxxxxxx أو +9665xxxxxxxx
    final phoneRegex = RegExp(r'^(05|5|9665)\d{8}$|^\+9665\d{8}$');
    if (!phoneRegex.hasMatch(value!.trim())) {
      return 'رقم الهاتف غير صحيح (مثال: 05xxxxxxxx)';
    }

    return null;
  }

  /// التحقق من صحة رقم الهاتف (دولي - مرن)
  static String? validatePhoneFlexible(String? value) {
    final result = requiredField(value, fieldName: 'رقم الهاتف');
    if (result != null) return result;

    // قبول أرقام فقط مع إمكانية وجود + في البداية
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value!.trim())) {
      return 'رقم الهاتف غير صحيح (يجب أن يكون 7-15 رقم)';
    }

    return null;
  }

  /// التحقق من صحة البريد الإلكتروني
  static String? validateEmail(String? value) {
    final result = requiredField(value, fieldName: 'البريد الإلكتروني');
    if (result != null) return result;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'البريد الإلكتروني غير صحيح (مثال: name@domain.com)';
    }

    return null;
  }

  /// التحقق من صحة المبلغ (رقم موجب)
  static String? validateAmount(String? value) {
    final result = requiredField(value, fieldName: 'المبلغ');
    if (result != null) return result;

    final trimmed = value!.trim();
    final amount = double.tryParse(trimmed);

    if (amount == null) {
      return 'يرجى إدخال رقم صحيح';
    }

    if (amount <= 0) {
      return 'المبلغ يجب أن يكون أكبر من صفر';
    }

    if (amount > 999999999) {
      return 'المبلغ كبير جداً';
    }

    return null;
  }

  /// التحقق من صحة التاريخ (ليس في الماضي)
  static String? validateFutureDate(DateTime? value) {
    if (value == null) {
      return 'يرجى اختيار التاريخ';
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (value.isBefore(today)) {
      return 'التاريخ يجب أن يكون اليوم أو في المستقبل';
    }

    return null;
  }

  /// التحقق من صحة التاريخ (ليس في الماضي - للاستحقاق)
  static String? validateDueDate(DateTime? value) {
    if (value == null) {
      return 'يرجى اختيار تاريخ الاستحقاق';
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (value.isBefore(today)) {
      return 'تاريخ الاستحقاق لا يمكن أن يكون في الماضي';
    }

    return null;
  }

  /// التحقق من تطابق كلمتي مرور
  static String? validatePasswordMatch(String? value, String? confirmValue) {
    final result = requiredField(value, fieldName: 'كلمة المرور');
    if (result != null) return result;

    if (value!.trim().length < 6) {
      return 'كلمة المرور يجب أن لا تقل عن 6 أحرف';
    }

    if (confirmValue == null || confirmValue.trim().isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    }

    if (value.trim() != confirmValue.trim()) {
      return 'كلمة المرور غير متطابقة';
    }

    return null;
  }

  /// التحقق من الرقم (رقم صحيح)
  static String? validateInteger(String? value) {
    final result = requiredField(value, fieldName: 'الرقم');
    if (result != null) return result;

    if (!RegExp(r'^[0-9]+$').hasMatch(value!.trim())) {
      return 'يرجى إدخال أرقام فقط';
    }

    return null;
  }

  /// التحقق من النص (بدون رموز خاصة)
  static String? validateNoSpecialChars(String? value) {
    final result = requiredField(value, fieldName: 'النص');
    if (result != null) return result;

    // يسمح بأحرف عربية وإنجليزية ومسافات وشرطة فقط
    final regex = RegExp(r'^[\u0600-\u06FFa-zA-Z\s\-]+$');
    if (!regex.hasMatch(value!.trim())) {
      return 'يحتوي النص على رموز غير مسموحة';
    }

    return null;
  }

  /// التحقق من الحد الأدنى لطول النص
  static String? validateMinLength(String? value, int minLength) {
    final result = requiredField(value, fieldName: 'النص');
    if (result != null) return result;

    if (value!.trim().length < minLength) {
      return 'النص يجب أن لا يقل عن $minLength أحرف';
    }

    return null;
  }

  /// التحقق من الحد الأقصى لطول النص
  static String? validateMaxLength(String? value, int maxLength) {
    if (value == null || value.trim().isEmpty) {
      return null; // الحقل فارغ، لا نتحقق منه
    }

    if (value.trim().length > maxLength) {
      return 'النص يجب أن لا يتجاوز $maxLength حرفاً';
    }

    return null;
  }

  /// دمج عدة محققات في دالة واحدة
  static String? compose(List<String? Function()> validators) {
    for (final validator in validators) {
      final result = validator();
      if (result != null) return result;
    }
    return null;
  }
}

/// دالة مساعدة لإنشاء محققات مخصصة بسرعة
typedef ValidatorFunction = String? Function(String?);

/// مصنع للمحققات المخصصة
class ValidatorFactory {
  /// إنشاء محقق يتحقق من تطابق قيمة معينة
  static ValidatorFunction equals(String expected, {String? errorMessage}) {
    return (String? value) {
      if (value == null || value.trim() != expected) {
        return errorMessage ?? 'القيمة غير مطابقة';
      }
      return null;
    };
  }

  /// إنشاء محقق يتحقق من عدم احتواء النص على كلمات معينة
  static ValidatorFunction notContains(List<String> words, {String? errorMessage}) {
    return (String? value) {
      if (value == null) return null;
      for (final word in words) {
        if (value.contains(word)) {
          return errorMessage ?? 'النص يحتوي على كلمة غير مسموحة: $word';
        }
      }
      return null;
    };
  }

  /// إنشاء محقق يتحقق من وجود نمط معين (Regex)
  static ValidatorFunction matchesPattern(RegExp pattern, {String? errorMessage}) {
    return (String? value) {
      if (value == null || value.isEmpty) return null;
      if (!pattern.hasMatch(value)) {
        return errorMessage ?? 'النص لا يتطابق مع النمط المطلوب';
      }
      return null;
    };
  }
}