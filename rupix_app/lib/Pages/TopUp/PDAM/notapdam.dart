import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/WalletHomePage.dart';

class TransaksiBerhasilpdamPage extends StatelessWidget {
  const TransaksiBerhasilpdamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Judul
            Text(
              "BERHASIL",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text
              ),
            ),

            const SizedBox(height: 20),

            // Gambar ceklis
            Image.asset(
              "assets/Environment/ceklis.png",
              width: 120,
              height: 120,
            ),

            const SizedBox(height: 10),

            Text(
              "Detail",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white, // White text
              ),
            ),

            const SizedBox(height: 20),

            // Card Detail Transaksi
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E), // Dark card
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Dark shadow
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
                    children: [
                      Text("Nominal", style: TextStyle(color: Colors.white)),
                      Text(
                        "Rp 100.000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Biaya Admin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Biaya Admin", style: TextStyle(color: Colors.white)),
                      Text(
                        "Rp 1.000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 1, color: Colors.grey[700]),

                  // Total Transaksi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL TRANSAKSI",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Rp 101.000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Divider(thickness: 1, color: Colors.grey[700]),

                  Text(
                    "ID Pelanggan",
                    style: TextStyle(color: Colors.grey[400]), // Light grey
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "1234567890",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white, // White text
                    ),
                  ),
                  Text(
                    "PDAM Jakarta",
                    style: TextStyle(color: Colors.grey[400]), // Light grey
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Tombol Kembali
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 60, 144), // Biru PDAM
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletHomePage()),
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