import 'package:flutter/material.dart';

class RiwayatTransaksiPage extends StatelessWidget {
  const RiwayatTransaksiPage({super.key});

  final List<Map<String, dynamic>> transaksi = const [
    {
      "icon": Icons.shopping_cart,
      "title": "Top Up Roblox",
      "time": "Hari ini 09.00 AM",
      "amount": "Rp10.000.000",
      "isIncome": false,
    },
    {
      "icon": Icons.trending_up,
      "title": "Investasi Saham",
      "time": "Hari ini 12.00 PM",
      "amount": "Rp10.000.000",
      "isIncome": true,
    },
    {
      "icon": Icons.water_drop,
      "title": "Tagihan Air",
      "time": "Hari ini 14.00 PM",
      "amount": "Rp10.000.000",
      "isIncome": false,
    },
    {
      "icon": Icons.flash_on,
      "title": "Tagihan Listrik",
      "time": "Hari ini 18.00 PM",
      "amount": "Rp10.000.000",
      "isIncome": false,
    },
    {
      "icon": Icons.credit_card,
      "title": "Transfer ke Yuli",
      "time": "Kemarin 13.00 PM",
      "amount": "Rp10.000.000",
      "isIncome": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Color Scheme untuk konsistensi
    final Color backgroundColor = isDarkMode ? const Color(0xFF121212) : const Color(0xFF121212);
    final Color cardColor = const Color.fromARGB(255, 111, 111, 111).withOpacity(0.3);
    final Color surfaceVariant = isDarkMode ? Colors.black: Colors.black;
    final Color primaryText = isDarkMode ? Colors.white : Colors.white;
    final Color secondaryText = isDarkMode ? Colors.white : Colors.white;
    final Color borderColor = isDarkMode ? const Color(0xFF333333) : const Color(0xFF333333);
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 0, 76, 184) : const Color.fromARGB(255, 0, 76, 184),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Riwayat Transaksi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transaksi.length,
        itemBuilder: (context, index) {
          final item = transaksi[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: isDarkMode 
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                leading: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: surfaceVariant,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: isDarkMode 
                          ? Colors.black.withOpacity(0.4)
                          : Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    item["icon"],
                    size: 26,
                    color: item["isIncome"] 
                      ? const Color(0xFF34A853) // Green yang lebih soft
                      : const Color(0xFFEA4335), // Red yang lebih soft
                  ),
                ),
                title: Text(
                  item["title"],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: primaryText,
                    letterSpacing: -0.2,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    item["time"],
                    style: TextStyle(
                      fontSize: 13,
                      color: secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      item["isIncome"] ? "Pemasukan" : "Pengeluaran",
                      style: TextStyle(
                        fontSize: 11,
                        color: secondaryText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      (item["isIncome"] ? "+ " : "- ") + item["amount"],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: item["isIncome"] 
                          ? const Color(0xFF34A853)
                          : const Color(0xFFEA4335),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}