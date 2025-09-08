import 'package:flutter/material.dart';

class RiwayatTransaksiPage extends StatelessWidget {
  const RiwayatTransaksiPage({super.key});

  final List<Map<String, dynamic>> transaksi = const [
    {
      "icon": "assets/Environment/Reciept.png",
      "title": "Top Up Roblox",
      "time": "Hari ini 09.00 am",
      "amount": "Rp11.000.000",
      "isIncome": false,
    },
    {
      "icon": "assets/Environment/Financial Institution.png",
      "title": "Investasi Saham",
      "time": "Hari ini 12.00 pm",
      "amount": "Rp11.000.000",
      "isIncome": true,
    },
    {
      "icon": "assets/Environment/Water_Drop.png",
      "title": "Tagihan Air",
      "time": "Hari ini 14.00 pm",
      "amount": "Rp11.000.000",
      "isIncome": false,
    },
    {
      "icon": "assets/Environment/Lightning.png",
      "title": "Tagihan Listrik",
      "time": "Hari ini 18.00 pm",
      "amount": "Rp11.000.000",
      "isIncome": false,
    },
    {
      "icon": "assets/Environment/Card.png",
      "title": "Yuli",
      "time": "Kemarin 13.00 am",
      "amount": "Rp11.000.000",
      "isIncome": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Riwayat Transaksi"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transaksi.length,
        itemBuilder: (context, index) {
          final item = transaksi[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Image.asset(item["icon"], width: 22),
              ),
              title: Text(
                item["title"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item["time"]),
              trailing: Text(
                item["amount"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: item["isIncome"] ? Colors.green : Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}