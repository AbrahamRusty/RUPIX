import 'package:flutter/material.dart';
import 'konfirmasipln.dart';

class Jumlahtoken extends StatefulWidget {
  const Jumlahtoken({super.key});

  @override
  _PLNPageState createState() => _PLNPageState();
}

class _PLNPageState extends State<Jumlahtoken> {
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

  int? selectedIndex;

  // Widget logo PLN untuk dark mode
  Widget _plnLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.flash_on,
          size: 60,
          color: const Color.fromARGB(255, 255, 230, 0),
        ),
        Positioned(
          bottom: 3,
          child: Container(
            width: 42,
            height: 10,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 3, color: Colors.blueAccent),
                bottom: BorderSide(width: 3, color: Colors.blueAccent),
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
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Background dark
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        title: Text('Pilih Nominal', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 60, 144),
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
                CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color.fromARGB(77, 111, 111, 111),
                  child: _plnLogo(),
                ),
                SizedBox(height: 12),
                Text(
                  "PLN",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "14522133652",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Grid pilihan nominal
            Expanded(
              child: GridView.builder(
                itemCount: nominalList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
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
                              ? Colors.blueAccent
                              : const Color.fromARGB(77, 111, 111, 111),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(77, 111, 111, 111),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 6,
                            spreadRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        nominalList[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.blueAccent : Colors.white,
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
                color: const Color.fromARGB(77, 111, 111, 111),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade800, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tabungan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "1172734473287178",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rp100.000.000",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Tombol Selanjutnya
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: selectedIndex == null
                      ? Colors.grey.shade600
                      : const Color.fromARGB(255, 0, 60, 144),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: selectedIndex == null
                      ? Colors.transparent
                      : Colors.blue.withOpacity(0.3),
                ),
                onPressed: selectedIndex == null
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KonfirmasiTransaksiplnPage(
                              nominal: nominalList[selectedIndex!],
                              biayaAdmin: "2500",
                              noMeter: "14522133652",
                              pelanggan: "John Doe",
                              tarifDaya: "R1/900VA",
                            ),
                          ),
                        );
                      },
                child: Text(
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
