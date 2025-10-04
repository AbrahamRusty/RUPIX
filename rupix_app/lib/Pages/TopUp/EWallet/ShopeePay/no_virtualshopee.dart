import 'package:flutter/material.dart';
import '../ShopeePay/nominalshopee.dart';

class NoVirtualshopeePage extends StatefulWidget {
  const NoVirtualshopeePage({super.key});

  @override
  _NoVirtualshopeePageState createState() => _NoVirtualshopeePageState();
}

class _NoVirtualshopeePageState extends State<NoVirtualshopeePage> {
  final TextEditingController _vaController = TextEditingController();

  @override
  void dispose() {
    _vaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text('ShopeePay', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF5722),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade100,
              child: Image.asset(
                'assets/Environment/shopeepay.png',
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'MASUKKAN NOMOR TIRTUAL',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text
              ),
            ),
            SizedBox(height: 12),
            Stack(
              children: [
                TextField(
                  controller: _vaController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white), // White text input
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1E1E1E), // Dark input background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Masukkan nomor virtual',
                    hintStyle: TextStyle(color: Colors.grey[400]), // Light grey hint
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
                        color: Colors.grey[600], // Darker grey
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (_vaController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Masukkan nomor virtual'),
                        backgroundColor: Color(0xFF1E1E1E), // Dark snackbar
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NominalshopeePage(virtualNumber: _vaController.text),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5722),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'SELANJUTNYA',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
