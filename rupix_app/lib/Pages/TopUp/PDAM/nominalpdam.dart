import 'package:flutter/material.dart';
import 'konfirmasipdam.dart';

class NominalpdamPage extends StatefulWidget {
  final String customerId;

  const NominalpdamPage({super.key, required this.customerId});

  @override
  _NominalpdamPageState createState() => _NominalpdamPageState();
}

class _NominalpdamPageState extends State<NominalpdamPage> {
  final List<String> nominalList = [
    "50ribu",
    "100ribu",
    "200ribu",
    "500ribu",
    "1juta",
    "2juta",
    "5juta",
    "10juta",
  ];

  int? selectedIndex; // index pilihan yang dipilih

  // Widget logo PDAM sederhana dengan Icon dan warna
  Widget _pdamLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.water_drop, size: 60, color: Colors.blue),
        Positioned(
          bottom: 3,
          child: Container(
            width: 42,
            height: 10,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 3, color: Colors.lightBlue),
                bottom: BorderSide(width: 3, color: Colors.lightBlue),
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212), // Dark background
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text('PDAM', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 76, 184), // Tetap biru PDAM
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo PDAM + nomor
            Column(
              children: [
                _pdamLogo(),
                SizedBox(height: 8),
                Text(
                  "PDAM",
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "1234567890",
                  style: TextStyle(
                    fontSize: 14, 
                    color: Colors.grey[400], // Light grey
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Grid pilihan nominal
            Expanded(
              child: GridView.builder(
                itemCount: nominalList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 kolom
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.8,
                ),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? Colors.blue
                              : Colors.grey[700]!, // Darker grey border
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF1E1E1E), // Dark card
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3), // Dark shadow
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        nominalList[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.blue : Colors.white, // White text
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Info Tabungan
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E), // Dark card
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Dark shadow
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tabungan",
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "1172734473287178",
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.grey[400], // Light grey
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rp100.000.000",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                ],
              ),
            ),

            // Tombol Selanjutnya
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color.fromARGB(255, 0, 76, 184), // Biru PDAM
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: selectedIndex == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KonfirmasipdamPage(
                              nominal: nominalList[selectedIndex!],
                              customerId: widget.customerId,
                            ),
                          ),
                        );
                      },
                child: const Text(
                  "SELANJUTNYA",
                  style: TextStyle(
                    fontSize: 16, 
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