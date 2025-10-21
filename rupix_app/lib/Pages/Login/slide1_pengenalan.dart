import 'package:flutter/material.dart';
import 'slide2_password.dart';

class Slide1Pengenalan extends StatefulWidget {
  const Slide1Pengenalan({super.key});

  @override
  State<Slide1Pengenalan> createState() => _Slide1PengenalanState();
}

class _Slide1PengenalanState extends State<Slide1Pengenalan> {
  bool _isAgreed = false;

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

            // Ilustrasi/Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 60, 144), // ungu
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.shield, color: Colors.black, size: 60),
            ),

            const SizedBox(height: 40),

            // Judul
            const Text(
              "Buat Dompet Baru",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              "Dompet Anda mendukung jaringan teratas seperti Ethereum, Bitcoin, Rupiah, dan Dogecoin. Jadi, Anda dapat mengelola kripto dan Rupiah Anda di satu tempat.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Poin Penting
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• Hanya kamu yang memiliki akses",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Kami tidak bisa memulihkan akunmu",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• Simpan Recovery Phrase dengan aman",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Checkbox Persetujuan
            Row(
              children: [
                Checkbox(
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                  },
                  activeColor: const Color.fromARGB(255, 0, 60, 144),
                  checkColor: Colors.black,
                ),
                Expanded(
                  child: const Text(
                    "Saya memahami dan setuju untuk bertanggung jawab penuh atas keamanan dompet saya.",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Tombol Mulai
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isAgreed
                      ? const Color.fromARGB(255, 0, 60, 144)
                      : Colors.grey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _isAgreed
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Slide2Password(),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  "Mulai",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
