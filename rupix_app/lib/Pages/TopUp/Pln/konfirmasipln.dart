import 'package:flutter/material.dart';
import 'pinpln.dart';

class KonfirmasiTransaksiplnPage extends StatelessWidget {
  final String nominal;
  final String biayaAdmin;
  final String noMeter;
  final String pelanggan;
  final String tarifDaya;

  const KonfirmasiTransaksiplnPage({
    Key? key,
    required this.nominal,
    required this.biayaAdmin,
    required this.noMeter,
    required this.pelanggan,
    required this.tarifDaya,
  }) : super(key: key);

  // Widget logo PLN sederhana dengan Icon dan warna
  Widget _plnLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.flash_on, size: 28, color: Colors.red),
        Positioned(
          bottom: 2,
          child: Container(
            width: 20,
            height: 6,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2, color: Colors.blue),
                bottom: BorderSide(width: 2, color: Colors.blue),
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String tipePembayaran = "PLNTopup";

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('KONFIRMASI TRANSAKSI', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.black,
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
                  child: _plnLogo(),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PLN TopUp', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(noMeter, style: TextStyle(fontSize: 14)),
                  ],
                )
              ],
            ),
            SizedBox(height: 24),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3, offset: Offset(0, 1))]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nominal', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Rp $nominal', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 3, offset: Offset(0, 1))]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Biaya Admin', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Rp $biayaAdmin', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(height: 24),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4), boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 3, offset: Offset(0, 1))
              ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Detail', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('No Meter'),
                      Text(noMeter),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pelanggan'),
                      Text(pelanggan),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tarif/Daya'),
                      Text(tarifDaya),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tipe Pembayaran'),
                      Text(tipePembayaran),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pinpln()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  'TOP UP',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
