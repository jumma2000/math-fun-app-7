import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'lessons_list_screen.dart';

/// ============================================================
/// الشاشة الرئيسية — نقطة البداية للتطبيق
/// ============================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      // ===== شريط التطبيق =====
      appBar: AppBar(
        title: const Text('الرياضيات الممتعة'),   // ✅ الاسم الجديد
        centerTitle: true,
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: 0,
      ),

      // ===== الجسم =====
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // ✅ تحديد حجم الشاشة
              final isSmallScreen = constraints.maxWidth < 600;
              final horizontalPadding = isSmallScreen ? 20.0 : 40.0;
              final iconSize = isSmallScreen ? 100.0 : 140.0;
              final titleSize = isSmallScreen ? 30.0 : 40.0;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // ===== الأيقونة =====
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.calculate,   // ✅ أيقونة رياضية
                        size: iconSize,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ===== العنوان =====
                    Text(
                      'الرياضيات الممتعة',   // ✅ الاسم الجديد
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),

                    // ===== الوصف =====
                    Text(
                      'تعلّم الرياضيات بطريقة ممتعة وتفاعلية',   // ✅ وصف جديد
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // ===== بطاقة المعلومات =====
                    _buildInfoCard(context),
                    const SizedBox(height: 30),

                    // ===== زر بدء التعلم =====
                    _buildMainButton(
                      context: context,
                      icon: Icons.play_arrow,
                      label: 'ابدأ التعلم',   // ✅ بدل "ابدأ الاختبار"
                      color: colorScheme.primary,
                      onTap: () => _navigateTo(
                        context,
                        const LessonsListScreen(),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ===== الأزرار الثانوية =====
                    Row(
                      children: [
                        Expanded(
                          child: _buildSecondaryButton(
                            context: context,
                            icon: Icons.info,
                            label: 'من نحن',
                            color: Colors.green,
                            onTap: () => _navigateTo(
                              context,
                              const AboutScreen(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: _buildSecondaryButton(
                            context: context,
                            icon: Icons.phone,
                            label: 'اتصل بنا',
                            color: Colors.orange,
                            onTap: () => _navigateTo(
                              context,
                              const ContactScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // ============================================================
  // ===== دوال مساعدة =====
  // ============================================================

  /// الانتقال إلى شاشة أخرى (مع معالجة الأخطاء)
  void _navigateTo(BuildContext context, Widget screen) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
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

  /// بناء بطاقة المعلومات
  Widget _buildInfoCard(BuildContext context) {
    try {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: Colors.amber.shade700,
                    size: 24,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'مميزات التطبيق',   // ✅
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildFeatureRow('دروس شاملة خطوة بخطوة'),
              _buildFeatureRow('أسئلة متنوعة حسب كل درس'),
              _buildFeatureRow('حل مفصّل لكل سؤال'),
              _buildFeatureRow('تقييم فوري لنتائجك'),
              _buildFeatureRow('واجهة عربية سهلة الاستخدام'),
            ],
          ),
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  /// بناء صف مميز
  Widget _buildFeatureRow(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green.shade600, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  /// بناء الزر الرئيسي
  Widget _buildMainButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    try {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onTap,
          icon: Icon(icon, color: Colors.white),
          label: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }

  /// بناء الزر الثانوي
  Widget _buildSecondaryButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    try {
      return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      return const SizedBox.shrink();
    }
  }
}
