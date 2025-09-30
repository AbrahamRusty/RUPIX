import 'package:flutter/material.dart';

class EWalletListTile extends StatelessWidget {
  final String ewalletName;
  final String logoPath;
  final VoidCallback onTap;
  final bool isSelected; // Properti baru

  const EWalletListTile({
    super.key,
    required this.ewalletName,
    required this.logoPath,
    required this.onTap,
    required this.isSelected, // Masukkan properti baru di sini
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(logoPath, width: 40, height: 40),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  ewalletName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Tambahkan logika untuk mengubah ikon berdasarkan status terpilih
              if (isSelected)
                const Icon(Icons.radio_button_checked, color: Color(0xFF0088FF))
              else
                const Icon(Icons.radio_button_unchecked, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
