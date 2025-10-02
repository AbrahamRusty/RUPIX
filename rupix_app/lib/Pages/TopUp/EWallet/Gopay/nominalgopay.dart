import 'package:flutter/material.dart';
import 'konfirmasigopay.dart';

class NominalgopayPage extends StatefulWidget {
  final String virtualNumber;

  const NominalgopayPage({super.key, required this.virtualNumber});

  @override
  _NominalgopayPageState createState() => _NominalgopayPageState();
}

class _NominalgopayPageState extends State<NominalgopayPage> {
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
      appBar: AppBar(
        leading: BackButton(),
        title: Text('GoPay', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF00AA13),
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
                    'assets/Environment/gopay.png',
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(phoneNumber, style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 24),

            // Masukkan Nominal
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
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
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextField(
                    controller: _nominalController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    decoration: InputDecoration(
                      prefixText: 'Rp ',
                      border: UnderlineInputBorder(),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    tabunganNumber,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    tabunganSaldo,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                  int nominal =
                      int.tryParse(
                        _nominalController.text.replaceAll('.', ''),
                      ) ??
                      0;
                  if (nominal <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Masukkan nominal yang valid')),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KonfirmasigopayPage(
                        virtualNumber: widget.virtualNumber,
                        nominal: nominal,
                        customerName: maskedName,
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00AA13),
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
