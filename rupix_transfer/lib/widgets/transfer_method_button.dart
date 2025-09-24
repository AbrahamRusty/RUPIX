import 'package:flutter/material.dart';

class TransferMethodButton extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onTap;

  const TransferMethodButton({
    super.key,
    required this.label,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 152,
        height: 168,
        decoration: BoxDecoration(
          color: const Color(0x28D9D9D9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 90, // Menyesuaikan ukuran gambar
              height: 90, // Menyesuaikan ukuran gambar
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFB289EB),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
