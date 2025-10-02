import 'package:flutter/material.dart';
import 'konfirmasipulsa.dart';

class Jumlahpulsa extends StatefulWidget {
  const Jumlahpulsa({Key? key}) : super(key: key);

  @override
  _pulsaPageState createState() => _pulsaPageState();
}

class _pulsaPageState extends State<Jumlahpulsa> {
  final List<String> nominalList = [
    "20ribu",
    "50ribu",
    "100ribu",
    "200ribu",
    "500ribu",
    "1juta",
    "5juta",
    "10juta",
  ];

  int? selectedIndex; // index pilihan yang dipilih

  // Widget logo PLN sederhana dengan Icon and warna
  Widget _plnLogo() {
    return Icon(
      Icons.phone_android,
      size: 60,
      color: Colors.black54,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Pulsa', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo PLN + nomor
            Column(
              children: [
                _plnLogo(),
                SizedBox(height: 8),
                Text(
                  "PULSA",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text("081234567890",
                    style: TextStyle(fontSize: 14, color: Colors.black54)),
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
                          color: isSelected ? Colors.blue : Colors.grey.shade300,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        nominalList[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.blue : Colors.black,
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 3,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Tabungan",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("1172734473287178",
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  SizedBox(height: 8),
                  Text(
                    "Rp100.000.000",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                  backgroundColor: Colors.black,
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
                            builder: (context) => KonfirmasiTransaksipulsaPage(
                              nominal: nominalList[selectedIndex!],
                              biayaAdmin: "2500",
                              noMeter: "14522133652",
                            ),
                          ),
                        );
                      },
                child: const Text(
                  "SELANJUTNYA",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),              
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
