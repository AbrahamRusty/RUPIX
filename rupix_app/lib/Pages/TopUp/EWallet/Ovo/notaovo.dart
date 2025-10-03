import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/WalletHomePage.dart';

class TransaksiBerhasilovoPage extends StatelessWidget {
  const TransaksiBerhasilovoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Color definitions
    final backgroundColor = isDarkMode ? Color(0xFF121212) : Color(0xFF121212);
    final containerColor = isDarkMode ? Color(0xFF2D2D2D) : Color(0xFF2D2D2D);
    final primaryColor = isDarkMode ? Colors.white : Colors.white;
    final secondaryColor = isDarkMode ? Colors.grey.shade300 : Colors.grey.shade300;
    final tertiaryColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400;
    final accentColor = isDarkMode ? Color(0xFF8B2F8F) : Color(0xFF8B2F8F);
    final dividerColor = isDarkMode ? Colors.grey.shade700 : Colors.grey.shade700;
    final shadowColor = isDarkMode ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.5);

    return Scaffold(
      backgroundColor: backgroundColor,
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
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 20),

            // Gambar ceklis
            Image.asset(
              "assets/Environment/ceklis.png",
              width: 120,
              height: 120,
              color: accentColor,
            ),

            const SizedBox(height: 10),

            Text(
              "Detail",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),

            const SizedBox(height: 20),

            // Card Detail Transaksi
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: containerColor,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
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
                  _buildDetailRow(
                    "Nominal", 
                    "Rp 10.000,100", 
                    isBold: true,
                    primaryColor: primaryColor,
                    secondaryColor: secondaryColor,
                  ),
                  const SizedBox(height: 8),

                  // Biaya Admin
                  _buildDetailRow(
                    "Biaya Admin", 
                    "Rp 1.000", 
                    primaryColor: secondaryColor,
                    secondaryColor: secondaryColor,
                  ),
                  
                  Divider(
                    thickness: 1,
                    color: dividerColor,
                  ),

                  // Total Transaksi
                  _buildDetailRow(
                    "TOTAL TRANSAKSI", 
                    "Rp 10.001,100", 
                    isBold: true,
                    primaryColor: primaryColor,
                    secondaryColor: primaryColor,
                  ),

                  const SizedBox(height: 16),
                  
                  Divider(
                    thickness: 1,
                    color: dividerColor,
                  ),

                  Text(
                    "Rekening Sumber",
                    style: TextStyle(
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Isakndar Udin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    "Bank RupiX --------8469",
                    style: TextStyle(
                      color: tertiaryColor,
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
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
                  child: Text(
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

  Widget _buildDetailRow(String label, String value, {
    bool isBold = false, 
    required Color primaryColor, 
    required Color secondaryColor
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: secondaryColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: primaryColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}