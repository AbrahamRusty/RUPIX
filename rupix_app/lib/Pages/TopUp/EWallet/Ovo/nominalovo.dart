import 'package:flutter/material.dart';
import 'konfirmasiovo.dart';

class NominalovoPage extends StatefulWidget {
  final String virtualNumber;

  const NominalovoPage({super.key, this.virtualNumber = ''});

  @override
  _NominalovoPageState createState() => _NominalovoPageState();
}

class _NominalovoPageState extends State<NominalovoPage> {
  final TextEditingController _nominalController = TextEditingController(
    text: '0',
  );

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String maskedName = 'M***** A****';
    String phoneNumber = '081245783690';
    String tabunganNumber = '1172734473287178';
    String tabunganSaldo = 'Rp100.000.000';

    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text('OVO', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF8B2F8F), // Tetap ungu OVO
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Virtual Number Always On Top
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blue.shade100,
                  child: Image.asset(
                    'assets/Environment/ovo.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maskedName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text
                      ),
                    ),
                    Text(
                      phoneNumber, 
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400], // Light grey
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 24),

            // Masukkan Nominal
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E), // Dark card
                borderRadius: BorderRadius.circular(8),
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
                    'MASUKKAN NOMINAL',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white, // White text
                    ),
                  ),
                  TextField(
                    controller: _nominalController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 20,
                      color: Colors.white, // White text input
                    ),
                    decoration: InputDecoration(
                      prefixText: 'Rp ',
                      prefixStyle: TextStyle(
                        color: Colors.white, // White prefix
                        fontWeight: FontWeight.bold,
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]!), // Light grey border
                      ),
                      isDense: true,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // Tabungan info
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
                    'Tabungan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                  Text(
                    tabunganNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    tabunganSaldo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 18,
                      color: Colors.white, // White text
                    ),
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
                  int nominal =
                      int.tryParse(
                        _nominalController.text.replaceAll('.', ''),
                      ) ??
                      0;
                  if (nominal <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Masukkan nominal yang valid'),
                        backgroundColor: Color(0xFF1E1E1E), // Dark snackbar
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KonfirmasiovoPage(
                        virtualNumber: widget.virtualNumber,
                        nominal: nominal,
                        customerName: maskedName,
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B2F8F), // Tetap ungu OVO
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