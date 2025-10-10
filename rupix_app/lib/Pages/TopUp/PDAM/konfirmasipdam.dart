import 'package:flutter/material.dart';
import 'pinpdam.dart';

class KonfirmasipdamPage extends StatelessWidget {
  final String nominal;
  final String customerId;

  const KonfirmasipdamPage({
    super.key,
    required this.nominal,
    required this.customerId,
  });

  @override
  Widget build(BuildContext context) {
    int biayaAdmin = 1000;
    String tipePembayaran = "PDAMTopup";

    String formatRupiah(int value) {
      return 'Rp ${value.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match[1]}.')}';
    }

    // Parse nominal to int for calculation
    int nominalValue =
        int.tryParse(
          nominal.replaceAll('ribu', '000').replaceAll('juta', '000000'),
        ) ??
        0;

    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'KONFIRMASI TRANSAKSI',
          style: TextStyle(color: Colors.white), // White text
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 60, 144), // Tetap biru PDAM
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
                  child: Icon(Icons.water_drop, color: Colors.blue, size: 28),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PDAMTopup',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white, // White text
                      ),
                    ),
                    Text(
                      'Bayar Tagihan Air', 
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
                    formatRupiah(nominalValue),
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
                      Text('ID Pelanggan', style: TextStyle(color: Colors.grey[400])),
                      Text(customerId, style: TextStyle(color: Colors.white))
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Biaya Admin', style: TextStyle(color: Colors.grey[400])),
                      Text(formatRupiah(biayaAdmin), style: TextStyle(color: Colors.white))
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
                    MaterialPageRoute(builder: (context) => Pinpdam()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 60, 144), // Biru PDAM
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