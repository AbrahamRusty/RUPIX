import 'package:flutter/material.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  final String balance = 'Rp100.000.000';
  final String used = 'Rp50.000.000';

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Dompet Rupiah'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,

        leading: IconButton(
          icon: Image.asset(
            "assets/Menu/Hamburger_LG.png",
            width: 28,
            color: Colors.white,
          ),
          onPressed: () {
            debugPrint("Hamburger menu tapped");
          },
        ),

        actions: [
          IconButton(
            icon: Image.asset(
              "assets/Menu/User.png",
              width: 28,
              color: Colors.white,
            ),
            onPressed: () {
              debugPrint("User profile tapped");
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // Balance Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'SALDO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          balance,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Image.asset("assets/Menu/Group 10.png", width: 28),
                  ],
                ),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/Menu/Chart_Line.png", // ikon kiri
                            width: 18,
                            height: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '$used udah terpakai di Agustus',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/Menu/Vector.png", // ikon kanan
                        width: 18,
                        height: 18,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _actionButton(
                "TOP UP",
                "assets/Menu/Arrow_Up_SM.png",
                Colors.blue,
              ),
              _actionButton(
                "TRANSFER",
                "assets/Menu/Vector2.png",
                Colors.green,
              ),
              _actionButton("MORE", "assets/Menu/More.png", Colors.orange),
            ],
          ),
          const SizedBox(height: 16),

          // Riwayat Transaksi Card Container
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Riwayat Transaksi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/Menu/Expand.png",
                      width: 20,
                      height: 20,
                      color: Colors.black54,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Isi transaksi
                InkWell(
                  onTap: () {
                    debugPrint("Riwayat Transaksi tapped");
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey[200],
                            child: Image.asset(
                              "assets/Environment/Water_Drop.png",
                              width: 20,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Tagihan Air",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Hari ini 13.00",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/Menu/Arrow_Circle_Down_Left.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            "Rp100.000",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Service Grid
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _serviceCard("Split Bill", "assets/Environment/Transfer.png"),
                _serviceCard(
                  "E-Banking",
                  "assets/Environment/Financial Institution.png",
                ),
                _serviceCard("Tarik Dana", "assets/Environment/Down Arrow.png"),
                _serviceCard(
                  "E-Wallet",
                  "assets/Environment/Additional Card.png",
                ),
                _serviceCard("Promo", "assets/Environment/Reciept.png"),
                _serviceCard("Tabungan", "assets/Environment/Card.png"),
                _serviceCard("Air", "assets/Environment/Water_Drop.png"),
                _serviceCard("Listrik", "assets/Environment/Lightning.png"),
                _serviceCard("Kesehatan", "assets/Environment/First_Aid.png"),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Notifikasi"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Pengaturan",
          ),
        ],
      ),
    );
  }

  // Action Button
  Widget _actionButton(String label, String iconPath, Color bgColor) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () {
        debugPrint("Action button $label tapped");
      },
      icon: Image.asset(iconPath, width: 20, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // Service Card
  Widget _serviceCard(String title, String iconPath) {
    return InkWell(
      onTap: () {
        debugPrint("Service $title tapped");
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(iconPath, width: 28),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
