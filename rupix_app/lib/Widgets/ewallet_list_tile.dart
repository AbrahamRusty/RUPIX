import 'package:flutter/material.dart';

class EWalletListTile extends StatelessWidget {
  final String ewalletName;
  final String logoPath;
  final VoidCallback onTap;
  // Tambahkan properti ini
  final bool isSelected;

  const EWalletListTile({
    super.key,
    required this.ewalletName,
    required this.logoPath,
    required this.onTap,
    // Tambahkan ini
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // ... (Kode Container dan BoxDecoration tetap sama)
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          // Optional: Ubah warna border/background saat dipilih
          color: isSelected
              ? Colors.blue.withOpacity(0.05)
              : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          // Optional: Beri border saat dipilih
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
                ),
              ),
            ),
            // UBAH LOGIKA ICON DI SINI
            Icon(
              // Tampilkan icon ceklis/lingkaran penuh jika dipilih
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              // Ubah warna menjadi biru jika dipilih
              color: isSelected ? const Color(0xFF0088FF) : Colors.grey,
              size: 24, // Sedikit diperbesar agar jelas
            ),
          ],
        ),
      ),
    );
  }
}
