import 'package:flutter/material.dart';

class AktivitasPage extends StatelessWidget {
  const AktivitasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data aktivitas
    final List<Map<String, dynamic>> aktivitas = [
      {
        "icon": Icons.account_balance_wallet,
        "title": "Top Up Saldo",
        "subtitle": "BCA Virtual Account",
        "time": "12:45 - 30 Sep 2025",
        "status": "Berhasil",
      },
      {
        "icon": Icons.local_offer,
        "title": "Claim Promo Cashback",
        "subtitle": "Voucher Makan Rp 20.000",
        "time": "11:20 - 29 Sep 2025",
        "status": "Berhasil",
      },
      {
        "icon": Icons.flash_on,
        "title": "Bayar Listrik PLN",
        "subtitle": "Token 100k",
        "time": "18:00 - 28 Sep 2025",
        "status": "Pending",
      },
      {
        "icon": Icons.local_atm,
        "title": "Transfer ke Andi",
        "subtitle": "Rp 200.000",
        "time": "14:30 - 27 Sep 2025",
        "status": "Berhasil",
      },
      {
        "icon": Icons.phone_android,
        "title": "Beli Pulsa Telkomsel",
        "subtitle": "50.000",
        "time": "09:15 - 26 Sep 2025",
        "status": "Gagal",
      },
      {
        "icon": Icons.card_giftcard,
        "title": "Bayar Netflix",
        "subtitle": "Rp 54.000",
        "time": "07:10 - 25 Sep 2025",
        "status": "Berhasil",
      },
      {
        "icon": Icons.local_dining,
        "title": "Pesan GoFood",
        "subtitle": "McDonald's",
        "time": "20:40 - 24 Sep 2025",
        "status": "Berhasil",
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Judul halaman (centered)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Aktivitas",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // List aktivitas
            Expanded(
              child: ListView.separated(
                itemCount: aktivitas.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, color: Colors.grey),
                itemBuilder: (context, index) {
                  final item = aktivitas[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Icon(item["icon"], color: Colors.blueAccent),
                    ),
                    title: Text(
                      item["title"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${item["subtitle"]} • ${item["time"]}",
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: Text(
                      item["status"],
                      style: TextStyle(
                        color: item["status"] == "Berhasil"
                            ? Colors.green
                            : item["status"] == "Pending"
                            ? Colors.orange
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
