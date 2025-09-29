import 'package:flutter/material.dart';
import 'setup_keamanan_page.dart';
import 'login.dart'; // tambahkan ini supaya bisa balik ke login kalau perlu

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
            // otomatis balik ke login kalau sebelumnya pakai push
            // kalau login pakai pushReplacement, ganti jadi:
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const LoginPage()),
            // );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "BUAT DOMPET DIGITALMU",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Dompet Anda mendukung jaringan teratas seperti Ethereum, Bitcoin, Rupiah, dan Dogecoin. Jadi, Anda dapat mengelola crypto dan Rupiah Anda di satu tempat.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Tombol Buat Wallet Baru
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SetupKeamananPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.add_circle, color: Colors.white, size: 28),
                    SizedBox(width: 12),
                    Text(
                      "Buat Wallet Baru",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Import Wallet (belum aktif)
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.login, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  Text(
                    "Impor Dompet Yang Ada",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Pulihkan Dompet (belum aktif)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellowAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.restore, color: Colors.black, size: 28),
                  SizedBox(width: 12),
                  Text(
                    "Pulihkan Dompet",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
