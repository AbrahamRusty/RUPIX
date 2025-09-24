import 'package:flutter/material.dart';

class BankListTile extends StatelessWidget {
  final String bankName;
  final String logoPath;
  final VoidCallback onTap;

  const BankListTile({
    super.key,
    required this.bankName,
    required this.logoPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(logoPath, width: 40, height: 40),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                bankName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.circle, color: Colors.grey, size: 18),
          ],
        ),
      ),
    );
  }
}
