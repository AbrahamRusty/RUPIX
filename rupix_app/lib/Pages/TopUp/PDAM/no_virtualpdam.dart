import 'package:flutter/material.dart';
import 'nominalpdam.dart';

class NoVirtualpdamPage extends StatefulWidget {
  const NoVirtualpdamPage({super.key});

  @override
  _NoVirtualpdamPageState createState() => _NoVirtualpdamPageState();
}

class _NoVirtualpdamPageState extends State<NoVirtualpdamPage> {
  final TextEditingController _customerIdController = TextEditingController();

  @override
  void dispose() {
    _customerIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text('PDAM', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 60, 144), // Tetap biru PDAM
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
              child: Icon(Icons.water_drop, size: 28, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              'MASUKKAN ID PELANGGAN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text
              ),
            ),
            SizedBox(height: 12),
            Stack(
              children: [
                TextField(
                  controller: _customerIdController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white), // White text input
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF1E1E1E), // Dark input background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Masukkan ID Pelanggan',
                    hintStyle: TextStyle(color: Colors.grey[400]), // Light grey hint
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  bottom: 8,
                  child: GestureDetector(
                    onTap: () {
                      _customerIdController.clear();
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
                  String customerId = _customerIdController.text.trim();
                  if (customerId.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Masukkan ID Pelanggan'),
                        backgroundColor: Color(0xFF1E1E1E), // Dark snackbar
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NominalpdamPage(customerId: customerId),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 60, 144), // Biru PDAM untuk button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'LANJUT',
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