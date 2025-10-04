import 'package:flutter/material.dart';

class EWalletListTile extends StatelessWidget {
  final String ewalletName;
  final String logoPath;
  final VoidCallback onTap;
  final bool isSelected;

  const EWalletListTile({
    super.key,
    required this.ewalletName,
    required this.logoPath,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF0088FF).withOpacity(0.1)
              : const Color(0xFF2D2D2D),
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: const Color(0xFF0088FF), width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            Image.asset(logoPath, width: 40, height: 40),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                ewalletName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? const Color(0xFF0088FF) : Colors.grey[400],
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
