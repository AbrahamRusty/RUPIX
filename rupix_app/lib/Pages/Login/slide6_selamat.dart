import 'package:flutter/material.dart';
import 'setup_keamanan_page.dart';

class Slide6Selamat extends StatefulWidget {
  const Slide6Selamat({super.key});

  @override
  State<Slide6Selamat> createState() => _Slide6SelamatState();
}

class _Slide6SelamatState extends State<Slide6Selamat> {
  @override
  void initState() {
    super.initState();

    // Auto navigate to SetupKeamananPage after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SetupKeamananPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),

            // Ilustrasi/Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFF6BFF5A), // hijau
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.black, size: 60),
            ),

            const SizedBox(height: 40),

            // Judul
            const Text(
              "Selamat!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              "Dompet Anda telah berhasil dibuat.\nSekarang Anda siap untuk mulai menggunakan RupiX Wallet.",
              style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6BFF5A)),
            ),

            const SizedBox(height: 20),

            const Text(
              "Mempersiapkan akses keamanan...",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
