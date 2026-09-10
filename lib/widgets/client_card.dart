import 'package:debt_tracking_app/models/client_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClientCard extends StatelessWidget {
  final ClientModel client;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ClientCard({
    super.key,
    required this.client,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // الصورة
            CircleAvatar(
              radius: 40,
              backgroundImage: client.imageUrl != null
                  ? NetworkImage(client.imageUrl!)
                  : const AssetImage('assets/images/avatar.png') as ImageProvider,
              child: client.imageUrl == null
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            const SizedBox(width: 16),
            // البيانات
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    client.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'المبلغ: ${NumberFormat.currency(symbol: 'ريال', decimalDigits: 0).format(client.debtAmount)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'تاريخ الاستحقاق: ${DateFormat('yyyy-MM-dd').format(client.dueDate)}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'الهاتف: ${client.phoneNumber}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // الأزرار
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.print, color: Colors.orange),
                  onPressed: () {
                    // طباعة فردية
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('طباعة تقرير ${client.name}...')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}