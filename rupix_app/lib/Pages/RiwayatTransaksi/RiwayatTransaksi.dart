import 'package:flutter/material.dart';

class RiwayatTransaksiPage extends StatelessWidget {
  const RiwayatTransaksiPage({super.key});

  final List<Map<String, dynamic>> transaksi = const [
    {
      "icon": Icons.shopping_cart,
      "title": "Top Up Roblox",
      "time": "Hari ini 09.00 AM",
      "amount": "Rp11.000.000",
      "isIncome": false,
    },
    {
      "icon": Icons.trending_up,
      "title": "Investasi Saham",
      "time": "Hari ini 12.00 PM",
      "amount": "Rp11.000.000",
      "isIncome": true,
    },
    {
      "icon": Icons.water_drop,
      "title": "Tagihan Air",
      "time": "Hari ini 14.00 PM",
      "amount": "Rp11.000.000",
      "isIncome": false,
    },
    {
      "icon": Icons.flash_on,
      "title": "Tagihan Listrik",
      "time": "Hari ini 18.00 PM",
      "amount": "Rp11.000.000",
      "isIncome": false,
    },
    {
      "icon": Icons.credit_card,
      "title": "Transfer ke Yuli",
      "time": "Kemarin 13.00 PM",
      "amount": "Rp11.000.000",
      "isIncome": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C8DFF), // biru konsisten homepage
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Riwayat Transaksi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transaksi.length,
        itemBuilder: (context, index) {
          final item = transaksi[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: const Color(0xffeef3f9),
                child: Icon(
                  item["icon"],
                  size: 26,
                  color: item["isIncome"] ? Colors.green : Colors.red,
                ),
              ),
              title: Text(
                item["title"],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                item["time"],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              trailing: Text(
                (item["isIncome"] ? "+ " : "- ") + item["amount"],
                style: TextStyle(
                  fontSize: 14,
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
