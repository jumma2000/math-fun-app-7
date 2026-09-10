import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اتصل بنا'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // ===== رقم الهاتف =====
              _buildContactCard(
                icon: Icons.phone,
                label: 'رقم الهاتف',
                value: '0911313949',
                color: Colors.blue,
                onTap: () => _launchURL(context, 'tel:0911313949'),
              ),

              const SizedBox(height: 15),

              // ===== واتساب =====
              _buildContactCard(
                icon: Icons.chat,
                label: 'واتساب',
                value: '00218911313949',
                color: Colors.green,
                onTap: () => _launchURL(
                  context,
                  'https://wa.me/218911313949?text=مرحباً%20جمعة%20أريد%20برنامجاً%20مشابهاً',
                ),
              ),

              const SizedBox(height: 15),

              // ===== البريد الإلكتروني (تم التصحيح) =====
              _buildContactCard(
                icon: Icons.email,
                label: 'البريد الإلكتروني',
                value: 'dwjmt22@gmail.com',  // ✅ تم التصحيح
                color: Colors.red,
                onTap: () => _launchURL(
                  context,
                  'mailto:dwjmt22@gmail.com?subject=رسالة%20من%20تطبيق%20اختبار%20الكسور',
                ),
              ),

              const SizedBox(height: 30),
              const Divider(thickness: 2),
              const SizedBox(height: 20),

              // ===== نموذج التواصل =====
              const Text(
                'تواصل معنا',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),

              _buildTextField(
                controller: _nameController,
                label: 'الاسم',
                icon: Icons.person,
              ),
              const SizedBox(height: 15),

              _buildTextField(
                controller: _emailController,
                label: 'البريد الإلكتروني',
                icon: Icons.email,
              ),
              const SizedBox(height: 15),

              _buildTextField(
                controller: _messageController,
                label: 'الرسالة',
                icon: Icons.message,
                maxLines: 4,
              ),
              const SizedBox(height: 20),

              // ===== زر الإرسال =====
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _sendMessage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'إرسال',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ===== دالة بناء بطاقة التواصل =====
  Widget _buildContactCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 25,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  // ===== دالة بناء حقل الإدخال =====
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
    );
  }

  // ===== دالة إرسال الرسالة =====
  void _sendMessage(BuildContext context) {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('الرجاء ملء جميع الحقول'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // إنشاء نص البريد الإلكتروني
    String emailBody =
        'الاسم: $name\nالبريد الإلكتروني: $email\nالرسالة:\n$message';

    // فتح البريد الإلكتروني
    _launchURL(
      context,
      'mailto:dwjmt22@gmail.com?subject=رسالة%20من%20$name&body=${Uri.encodeComponent(emailBody)}',
    );

    // تفريغ الحقول بعد الإرسال
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم إرسال رسالتك بنجاح!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // ===== دالة فتح الروابط =====
  Future<void> _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
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