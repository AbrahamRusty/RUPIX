import 'package:flutter/material.dart';
import 'jumlahtoken.dart';

class Nometpln extends StatefulWidget {
  const Nometpln({super.key});

  @override
  _Nometpln createState() => _Nometpln();
}

class _Nometpln extends State<Nometpln> {
  final TextEditingController _vaController = TextEditingController();

  @override
  void dispose() {
    _vaController.dispose();
    super.dispose();
  }

  // Widget logo PLN sederhana dengan Icon dan warna
  Widget _plnLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.flash_on,
          size: 28,
          color: const Color.fromARGB(255, 255, 230, 0),
        ),
        Positioned(
          bottom: 2,
          child: Container(
            width: 20,
            height: 6,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 2, color: const Color(0xFF2196F3)),
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Background dark
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text('PLN', style: TextStyle(color: Colors.white)),
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
              child: _plnLogo(),
            ),
            SizedBox(height: 20),
            Text(
              'IDPEL/No Meter',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
                    hintText: 'Masukkan IDPEL/No Meter',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
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
                    color: Colors.blue.shade300,
                    size: 20,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Pastikan IDPEL/No Meter sudah benar sebelum melanjutkan',
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
                    MaterialPageRoute(builder: (context) => Jumlahtoken()),
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
