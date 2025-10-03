import 'package:flutter/material.dart';
import 'pindana.dart';

class KonfirmasiDanaPage extends StatelessWidget {
  final String virtualNumber;
  final int nominal;
  final String customerName;
  final String phoneNumber;

  const KonfirmasiDanaPage({
    super.key,
    required this.virtualNumber,
    required this.nominal,
    required this.customerName,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    int biayaAdmin = 1000;
    String tipePembayaran = "DanaTopup";

    String formatRupiah(int value) {
      return 'Rp ${value.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
    }

    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'KONFIRMASI TRANSAKSI',
          style: TextStyle(color: Colors.white), // White text
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0066CC), // Tetap biru Dana
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue.shade100,
                  child: Image.asset(
                    'assets/Environment/dana.png',
                    width: 28,
                    height: 28,
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DanaTopup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white, // White text
                      ),
                    ),
                    Text(
                      phoneNumber, 
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400], // Light grey
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Nominal Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E), // Dark card
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Dark shadow
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nominal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                  Text(
                    formatRupiah(nominal),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            
            // Biaya Admin Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E), // Dark card
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Dark shadow
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biaya Admin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                  Text(
                    formatRupiah(biayaAdmin),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Detail Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E), // Dark card
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Dark shadow
                    blurRadius: 3,
                    offset: Offset(0, 1),
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
                      color: Colors.white, // White text
                    ),
                  ),
                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('No VA', style: TextStyle(color: Colors.grey[400])),
                      Text(virtualNumber, style: TextStyle(color: Colors.white))
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pelanggan', style: TextStyle(color: Colors.grey[400])),
                      Text(customerName, style: TextStyle(color: Colors.white))
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tipe Pembayaran', style: TextStyle(color: Colors.grey[400])),
                      Text(tipePembayaran, style: TextStyle(color: Colors.white))
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            // Top Up Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pindana()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0066CC), // Tetap biru Dana
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'TOP UP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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