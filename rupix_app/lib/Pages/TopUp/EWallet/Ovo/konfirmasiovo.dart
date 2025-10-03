import 'package:flutter/material.dart';
import "pinovo.dart";

class KonfirmasiovoPage extends StatelessWidget {
  final String virtualNumber;
  final int nominal;
  final String customerName;
  final String phoneNumber;

  const KonfirmasiovoPage({
    super.key,
    required this.virtualNumber,
    required this.nominal,
    required this.customerName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    int biayaAdmin = 1000;
    String tipePembayaran = "OVOTopup";
    
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    String formatRupiah(int value) {
      return 'Rp ${value.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
    }

    // Colors for dark/light mode
    final backgroundColor = isDarkMode ? Color(0xFF121212) : Color(0xFF121212);
    final containerColor = isDarkMode ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
    final primaryTextColor = isDarkMode ? Colors.white : Colors.white;
    final secondaryTextColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400;
    final accentColor = Color(0xFF8B2F8F); // OVO Purple

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'KONFIRMASI TRANSAKSI',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: accentColor,
        elevation: 0,
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/Environment/ovo.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'OVOTopup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: primaryTextColor,
                        ),
                      ),
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 14,
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Amount Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nominal',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primaryTextColor,
                        ),
                      ),
                      Text(
                        formatRupiah(nominal),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biaya Admin',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primaryTextColor,
                        ),
                      ),
                      Text(
                        formatRupiah(biayaAdmin),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Details Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: accentColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildDetailRow('No VA', virtualNumber, primaryTextColor, secondaryTextColor),
                  SizedBox(height: 12),
                  _buildDetailRow('Pelanggan', customerName, primaryTextColor, secondaryTextColor),
                  SizedBox(height: 12),
                  _buildDetailRow('Tipe Pembayaran', tipePembayaran, primaryTextColor, secondaryTextColor),
                ],
              ),
            ),

            Spacer(),

            // Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pinovo()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'TOP UP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color primaryColor, Color secondaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: secondaryColor),
        ),
        Text(
          value,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}