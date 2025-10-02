import 'package:flutter/material.dart';
import 'jumlahpulsa.dart';

class Notelp extends StatefulWidget {
  const Notelp({super.key});

  @override
  _notelp createState() => _notelp();
}

class _notelp extends State<Notelp> {
  final TextEditingController _vaController = TextEditingController();

  @override
  void dispose() {
    _vaController.dispose();
    super.dispose();
  }

  // Widget logo Pulsa untuk dark mode
  Widget _pulsaLogo() {
    return Icon(
      Icons.phone_android,
      size: 28,
      color: const Color.fromARGB(136, 21, 255, 0), // Hijau konsisten
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Background dark
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text(
          'Pulsa',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 76, 184),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color.fromARGB(
                77,
                111,
                111,
                111,
              ), // Transparan abu-abu
              child: _pulsaLogo(),
            ),
            SizedBox(height: 20),
            Text(
              'MASUKKAN NOMOR TELEPON ANDA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 12),
            Stack(
              children: [
                TextField(
                  controller: _vaController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black,
                  ), // Text hitam untuk kontras
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    hintText: 'Contoh: 081234567890',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
                if (_vaController.text.isNotEmpty)
                  Positioned(
                    right: 8,
                    top: 8,
                    bottom: 8,
                    child: GestureDetector(
                      onTap: () {
                        _vaController.clear();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade600,
                        ),
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.close, color: Colors.white, size: 16),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  77,
                  111,
                  111,
                  111,
                ), // Card info transparan
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.green.shade300,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Pastikan nomor telepon sudah benar sebelum melanjutkan',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Jumlahpulsa()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: const Color.fromARGB(
                    255,
                    0,
                    76,
                    184,
                  ), // Biru konsisten
                  elevation: 4,
                  shadowColor: Colors.blue.withOpacity(0.3),
                ),
                child: Text(
                  'SELANJUTNYA',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
}
