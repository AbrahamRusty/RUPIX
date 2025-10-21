import 'package:flutter/material.dart';
import 'slide1_pengenalan.dart';
import 'import_slide1_metode.dart';
import 'recovery_slide1_context.dart';

class BuatDompetPage extends StatelessWidget {
  const BuatDompetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // ===== Title 2 Baris =====
            const Text(
              "BUAT DOMPET",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "DIGITALMU",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // ===== Deskripsi =====
            const Text(
              "Dompet Anda mendukung jaringan teratas seperti Ethereum, Bitcoin, Rupiah, dan Dogecoin. Jadi, Anda dapat mengelola kripto dan Rupiah Anda di satu tempat.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 60),

            // ===== Opsi: Buat Wallet Baru =====
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Slide1Pengenalan(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFB86EFF), // ungu sesuai figma
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(14),
                    child: const Icon(Icons.add, color: Colors.black, size: 28),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "BUAT WALLET BARU",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Opsi: Impor Dompet =====
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImportSlide1Metode(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF6EF2), // pink figma
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(14),
                    child: const Icon(
                      Icons.download,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "IMPOR DOMPET YANG ADA",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Opsi: Pulihkan Dompet =====
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RecoverySlide1Context(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFF6B), // kuning figma
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(14),
                    child: const Icon(
                      Icons.upload,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "MEMULIHKAN DOMPET",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
