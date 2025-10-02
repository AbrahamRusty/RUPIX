import 'package:flutter/material.dart';
import 'jumlahtoken.dart';

class Nometpln extends StatefulWidget {
  @override
  _Nometpln createState() => _Nometpln();
}

class _Nometpln extends State<Nometpln> {
  TextEditingController _vaController = TextEditingController();

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
        Icon(Icons.flash_on, size: 28, color: Colors.red),
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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('PLN', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color.fromRGBO(187, 222, 251, 1),
              child: _plnLogo(),
            ),
            SizedBox(height: 20),
            Text(
              'IDPEL/No Meter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Stack(
              children: [
                TextField(
                  controller: _vaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
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
                        color: Colors.grey.shade500,
                      ),
                      child: Icon(Icons.close, color: Colors.white),
                      padding: EdgeInsets.all(4),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Jumlahtoken()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  side: BorderSide(color: Colors.black, width: 2),
                  backgroundColor: Colors.black,
                ),
                child: Text(
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
