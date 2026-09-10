import 'dart:io';
import 'package:debt_tracking_app/models/client_model.dart';
import 'package:debt_tracking_app/utils/constants.dart';
import 'package:debt_tracking_app/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

/// خدمة إنشاء وطباعة ملفات PDF
class PdfService {
  // ==================== المتغيرات الثابتة ====================

  static const String _fontPath = 'assets/fonts/arial.ttf';
  static pw.Font? _arabicFont;
  static bool _isFontLoaded = false;

  // ==================== تحميل الخط العربي ====================

  /// تحميل الخط العربي من الملفات
  static Future<pw.Font> _loadArabicFont() async {
    if (_isFontLoaded && _arabicFont != null) {
      return _arabicFont!;
    }

    try {
      final fontData = await rootBundle.load(_fontPath);
      final font = pw.Font.ttf(fontData.buffer.asByteData());
      _arabicFont = font;
      _isFontLoaded = true;
      return font;
    } catch (e) {
      // في حالة فشل تحميل الخط، استخدم الخط الافتراضي
      debugPrint('خطأ في تحميل الخط العربي: $e');
      return pw.Font.helvetica();
    }
  }

  // ==================== إنشاء تقرير عام ====================

  /// إنشاء وطباعة تقرير عام يحتوي على جميع العملاء
  static Future<void> printGeneralReport(
    BuildContext context,
    List<ClientModel> clients,
  ) async {
    try {
      // عرض مؤشر تحميل
      Helpers.showSnackBar(context, 'جاري إنشاء التقرير...');

      // تحميل الخط العربي
      final arabicFont = await _loadArabicFont();

      // إنشاء ملف PDF
      final pdf = pw.Document();

      // إضافة صفحة
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(20),
          build: (context) => [
            _buildReportHeader(arabicFont),
            _buildReportSummary(clients, arabicFont),
            pw.SizedBox(height: 20),
            _buildClientsTable(clients, arabicFont),
            pw.SizedBox(height: 20),
            _buildReportFooter(arabicFont),
          ],
        ),
      );

      // طباعة أو حفظ التقرير
      await _showPrintDialog(context, pdf);

      Helpers.showSuccessSnackBar(context, 'تم إنشاء التقرير بنجاح');
    } catch (e) {
      Helpers.showErrorSnackBar(context, 'حدث خطأ أثناء إنشاء التقرير: $e');
    }
  }

  /// بناء رأس التقرير
  static pw.Widget _buildReportHeader(pw.Font font) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Text(
          'تقرير الديون العام',
          style: pw.TextStyle(
            font: font,
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          AppConstants.appName,
          style: pw.TextStyle(
            font: font,
            fontSize: 16,
            color: PdfColors.grey700,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          'تاريخ التقرير: ${DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now())}',
          style: pw.TextStyle(
            font: font,
            fontSize: 12,
            color: PdfColors.grey500,
          ),
        ),
        pw.Divider(thickness: 2, color: PdfColors.grey300),
        pw.SizedBox(height: 10),
      ],
    );
  }

  /// بناء ملخص التقرير
  static pw.Widget _buildReportSummary(List<ClientModel> clients, pw.Font font) {
    final totalDebt = clients.fold<double>(0, (sum, client) => sum + client.debtAmount);
    final totalClients = clients.length;

    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryItem(
            'إجمالي العملاء',
            totalClients.toString(),
            font,
            PdfColors.blue,
          ),
          _buildSummaryItem(
            'إجمالي الديون',
            '${NumberFormat('#,##0.00').format(totalDebt)} ريال',
            font,
            PdfColors.green,
          ),
          _buildSummaryItem(
            'متوسط الدين',
            totalClients > 0
                ? '${NumberFormat('#,##0.00').format(totalDebt / totalClients)} ريال'
                : '0.00 ريال',
            font,
            PdfColors.orange,
          ),
        ],
      ),
    );
  }

  /// بناء عنصر في الملخص
  static pw.Widget _buildSummaryItem(String label, String value, pw.Font font, PdfColor color) {
    return pw.Column(
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            font: font,
            fontSize: 12,
            color: PdfColors.grey600,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          value,
          style: pw.TextStyle(
            font: font,
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  /// بناء جدول العملاء
  static pw.Widget _buildClientsTable(List<ClientModel> clients, pw.Font font) {
    return pw.Table(
      border: pw.TableBorder.all(
        color: PdfColors.grey300,
        width: 1,
      ),
      tableWidth: pw.TableWidth.max,
      children: [
        // رأس الجدول
        pw.TableRow(
          decoration: pw.BoxDecoration(
            color: PdfColors.blue100,
          ),
          children: [
            _buildTableCell('م', font, isHeader: true),
            _buildTableCell('الاسم', font, isHeader: true),
            _buildTableCell('المبلغ', font, isHeader: true),
            _buildTableCell('تاريخ الاستحقاق', font, isHeader: true),
            _buildTableCell('رقم الهاتف', font, isHeader: true),
          ],
        ),
        // صفوف البيانات
        ...clients.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final client = entry.value;
          final isEven = index % 2 == 0;

          return pw.TableRow(
            decoration: pw.BoxDecoration(
              color: isEven ? PdfColors.grey50 : PdfColors.white,
            ),
            children: [
              _buildTableCell(index.toString(), font),
              _buildTableCell(client.name, font),
              _buildTableCell(
                '${NumberFormat('#,##0.00').format(client.debtAmount)}',
                font,
                textColor: PdfColors.green700,
              ),
              _buildTableCell(
                DateFormat('yyyy-MM-dd').format(client.dueDate),
                font,
              ),
              _buildTableCell(client.phoneNumber, font),
            ],
          );
        }).toList(),
      ],
    );
  }

  /// بناء خلية في الجدول
  static pw.Widget _buildTableCell(
    String text,
    pw.Font font, {
    bool isHeader = false,
    PdfColor? textColor,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          font: font,
          fontSize: isHeader ? 12 : 11,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: textColor ?? (isHeader ? PdfColors.white : PdfColors.black),
        ),
        textAlign: isHeader ? pw.TextAlign.center : pw.TextAlign.center,
      ),
    );
  }

  /// بناء تذييل التقرير
  static pw.Widget _buildReportFooter(pw.Font font) {
    return pw.Column(
      children: [
        pw.Divider(thickness: 1, color: PdfColors.grey300),
        pw.SizedBox(height: 8),
        pw.Text(
          'تم إنشاء هذا التقرير بواسطة ${AppConstants.appName}',
          style: pw.TextStyle(
            font: font,
            fontSize: 10,
            color: PdfColors.grey500,
          ),
        ),
        pw.Text(
          'جميع الحقوق محفوظة © ${DateTime.now().year}',
          style: pw.TextStyle(
            font: font,
            fontSize: 10,
            color: PdfColors.grey500,
          ),
        ),
      ],
    );
  }

  // ==================== تقرير فردي ====================

  /// إنشاء وطباعة تقرير فردي لعميل معين
  static Future<void> printClientReport(
    BuildContext context,
    ClientModel client,
  ) async {
    try {
      Helpers.showSnackBar(context, 'جاري إنشاء تقرير العميل...');

      // تحميل الخط العربي
      final arabicFont = await _loadArabicFont();

      // إنشاء ملف PDF
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(20),
          build: (context) => [
            _buildClientCard(client, arabicFont),
          ],
        ),
      );

      await _showPrintDialog(context, pdf);

      Helpers.showSuccessSnackBar(context, 'تم طباعة تقرير العميل بنجاح');
    } catch (e) {
      Helpers.showErrorSnackBar(context, 'حدث خطأ أثناء طباعة التقرير: $e');
    }
  }

  /// بناء بطاقة العميل الفردية
  static pw.Widget _buildClientCard(ClientModel client, pw.Font font) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        // العنوان
        pw.Container(
          padding: const pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
            color: PdfColors.blue700,
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Text(
            'بطاقة العميل',
            style: pw.TextStyle(
              font: font,
              fontSize: 20,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.white,
            ),
          ),
        ),
        pw.SizedBox(height: 20),

        // معلومات العميل
        pw.Container(
          padding: const pw.EdgeInsets.all(20),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey300),
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // الصورة (إذا كانت موجودة)
              if (client.imageUrl != null && client.imageUrl!.isNotEmpty)
                pw.Center(
                  child: pw.Container(
                    width: 150,
                    height: 150,
                    decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(75),
                    ),
                    child: pw.Image.network(
                      client.imageUrl!,
                      width: 150,
                      height: 150,
                      fit: pw.BoxFit.cover,
                    ),
                  ),
                ),
              if (client.imageUrl != null && client.imageUrl!.isNotEmpty)
                pw.SizedBox(height: 16),

              _buildInfoRow('الاسم', client.name, font),
              _buildInfoRow(
                'المبلغ المستحق',
                '${NumberFormat('#,##0.00').format(client.debtAmount)} ريال',
                font,
                textColor: PdfColors.green700,
                isBold: true,
              ),
              _buildInfoRow(
                'تاريخ الاستحقاق',
                DateFormat('yyyy-MM-dd').format(client.dueDate),
                font,
              ),
              _buildInfoRow(
                'الأيام المتبقية',
                '${client.dueDate.daysRemaining()} يوم',
                font,
                textColor: client.dueDate.isFuture() ? PdfColors.blue : PdfColors.red,
              ),
              _buildInfoRow('رقم الهاتف', client.phoneNumber, font),
              _buildInfoRow('رقم العميل', client.id, font),
              _buildInfoRow('تاريخ الإصدار', DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()), font),
            ],
          ),
        ),
        pw.SizedBox(height: 20),

        // تذييل
        pw.Container(
          padding: const pw.EdgeInsets.all(12),
          decoration: pw.BoxDecoration(
            color: PdfColors.grey100,
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Text(
            'تم إنشاء هذا التقرير بواسطة ${AppConstants.appName} - © ${DateTime.now().year}',
            style: pw.TextStyle(
              font: font,
              fontSize: 10,
              color: PdfColors.grey600,
            ),
          ),
        ),
      ],
    );
  }

  /// بناء صف من المعلومات
  static pw.Widget _buildInfoRow(
    String label,
    String value,
    pw.Font font, {
    PdfColor? textColor,
    bool isBold = false,
  }) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 8),
        pw.Text(
          '$label: ',
          style: pw.TextStyle(
            font: font,
            fontSize: 12,
            color: PdfColors.grey600,
          ),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(
            font: font,
            fontSize: 14,
            fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
            color: textColor ?? PdfColors.black,
          ),
        ),
        pw.Divider(thickness: 0.5, color: PdfColors.grey200),
      ],
    );
  }

  // ==================== دوال مساعدة ====================

  /// عرض حوار الطباعة
  static Future<void> _showPrintDialog(BuildContext context, pw.Document pdf) async {
    try {
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
        name: '${AppConstants.appName}_${DateTime.now().millisecondsSinceEpoch}',
      );
    } catch (e) {
      // إذا فشلت الطباعة، حاول حفظ الملف
      await _savePdfToFile(context, pdf);
    }
  }

  /// حفظ ملف PDF على الجهاز
  static Future<void> _savePdfToFile(BuildContext context, pw.Document pdf) async {
    try {
      final bytes = await pdf.save();

      // عرض خيارات الحفظ
      final result = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('حفظ التقرير'),
          content: const Text('هل تريد حفظ التقرير على جهازك؟'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('حفظ'),
            ),
          ],
        ),
      );

      if (result == true) {
        // حفظ الملف
        final path = await _getSavePath();
        if (path != null) {
          final file = File(path);
          await file.writeAsBytes(bytes);
          Helpers.showSuccessSnackBar(
            context,
            'تم حفظ التقرير في: $path',
          );
        }
      }
    } catch (e) {
      Helpers.showErrorSnackBar(context, 'حدث خطأ أثناء حفظ التقرير: $e');
    }
  }

  /// الحصول على مسار حفظ الملف
  static Future<String?> _getSavePath() async {
    try {
      final directory = Directory('${Directory.current.path}/reports');
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      final fileName = 'report_${DateTime.now().millisecondsSinceEpoch}.pdf';
      return '${directory.path}/$fileName';
    } catch (e) {
      debugPrint('خطأ في إنشاء مسار الحفظ: $e');
      return null;
    }
  }
}
