import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/WalletHomePage.dart';

class TransaksiBerhasilpulsaPage extends StatelessWidget {
  const TransaksiBerhasilpulsaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Background dark
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
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Icon ceklis dari Flutter
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(77, 111, 111, 111),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green.shade400,
                  width: 3,
                ),
              ),
              child: Icon(
                Icons.check,
                size: 60,
                color: Colors.green.shade400,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Detail",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Card Detail Transaksi
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(77, 111, 111, 111),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade800,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nominal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nominal",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      Text(
                        "Rp 10.000,100",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Biaya Admin
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Biaya Admin",
                        style: TextStyle(color: Colors.grey.shade400),
                      ),
                      Text(
                        "Rp 1.000",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Divider(color: Colors.grey.shade700, thickness: 1),

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
                        "Rp 10.001,100",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Divider(color: Colors.grey.shade700, thickness: 1),

                  Text(
                    "Rekening Sumber",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Isakndar Udin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Bank RupiX --------8469",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Info tambahan untuk pulsa
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(77, 111, 111, 111),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.shade800,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone_android, color: Colors.green.shade400, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Pulsa akan segera dikirim ke nomor 081234567890",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
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
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 60, 144),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    shadowColor: Colors.blue.withOpacity(0.3),
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
                      fontSize: 16,
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