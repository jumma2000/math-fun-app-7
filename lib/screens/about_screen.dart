import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('من نحن'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // ===== الصورة الشخصية =====
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.blue.shade700,
                ),
              ),

              const SizedBox(height: 20),

              // ===== الاسم =====
              Text(
                'جمعة ضو',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),

              const SizedBox(height: 10),

                            Text(
                'مطور تطبيقات تعليمية تفاعلية',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 20),
              const Divider(thickness: 2),
              const SizedBox(height: 20),

              // ===== النص التعريفي =====
              const Text(
                '✨ أنا جمعة ضو، مطور تطبيقات شغوف بتحويل الأفكار إلى واقع رقمي ملموس.\n\n'
                '💡 أهتم بتقديم محتوى تعليمي  وتطبيقات تفاعلية ذكية، أدمج فيها أحدث التقنيات بأسلوب مبسط وممتع يلامس احتياجات المستخدمين.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.8),
              ),

              const SizedBox(height: 30),
              const Divider(thickness: 2),
              const SizedBox(height: 20),

              // ===== أزرار التواصل =====
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    icon: Icons.phone,
                    label: 'اتصال',
                    color: Colors.green,
                    onTap: () => _launchURL(context, 'tel:0911313949'), // ✅ تمرير context
                  ),
                  const SizedBox(width: 30),
                  _buildSocialButton(
                    icon: Icons.chat,
                    label: 'واتساب',
                    color: Colors.green.shade700,
                    onTap: () => _launchURL(
                      context, // ✅ تمرير context
                      'https://wa.me/218911313949?text=مرحباً%20جمعة',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ===== حقوق النشر =====
              Text(
                '© 2026 جميع الحقوق محفوظة',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade500,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // ===== دالة بناء زر التواصل =====
  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  // ===== دالة فتح الروابط (مع تمرير context) =====
  Future<void> _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // عرض رسالة خطأ للمستخدم
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('لا يمكن فتح الرابط: $url'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}