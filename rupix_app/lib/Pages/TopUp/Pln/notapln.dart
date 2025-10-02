import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/WalletHomePage.dart';

class TransaksiBerhasilplnPage extends StatelessWidget {
  const TransaksiBerhasilplnPage({super.key});

  // Fungsi untuk generate nomor token random
  String generateToken() {
    final random = Random();
    List<String> blocks = [];
    for (int i = 0; i < 5; i++) {
      String block = '';
      for (int j = 0; j < 4; j++) {
        block += random.nextInt(10).toString();
      }
      blocks.add(block);
    }
    return blocks.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final String token = generateToken();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Judul
            const Text(
              "BERHASIL",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Gambar ceklis
            Image.asset(
              'assets/Environment/ceklis.png',
              width: 120,
              height: 120,
            ),

            const SizedBox(height: 10),

            const Text(
              "Detail",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            // Card Detail Transaksi
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nominal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Nominal"),
                      Text(
                        "Rp 1.000.000",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Biaya Admin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Biaya Admin"),
                      Text("Rp 3.500"),
                    ],
                  ),
                  const Divider(thickness: 1),

                  // Total Transaksi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "TOTAL TRANSAKSI",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp 1.003.500",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(thickness: 1),

                  const Text("Rekening Sumber"),
                  const SizedBox(height: 4),
                  const Text(
                    "Isakndar Udin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    "Bank RupiX --------8469",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Nomor Token
            Column(
              children: [
                const Text(
                  "Nomor Token",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  token,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Tombol Kembali
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => WalletHomePage()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "KEMBALI KE BERANDA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
