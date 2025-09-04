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
        title: const Text('Rupiah Wallet'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/Menu/Hamburger_LG.png",
              width: 28,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset(
              "assets/Menu/User.png",
              width: 28,
              color: Colors.white,
            ),
            onPressed: () {},
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
                    fontSize: 16,
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
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Image.asset("assets/Menu/Group 10.png", width: 28),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '$used sudah terpakai di Agustus',
                  style: const TextStyle(color: Colors.grey),
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
                "assets/Environment/Transfer.png",
                Colors.blue,
              ),
              _actionButton(
                "TRANSFER",
                "assets/Environment/Down Arrow.png",
                Colors.green,
              ),
              _actionButton("MORE", "assets/Menu/More.png", Colors.orange),
            ],
          ),
          const SizedBox(height: 16),

          // Transaction History Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/Environment/Water_Drop.png",
                      width: 28,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Tagihan Air",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Text(
                          "Hari ini 13.00",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.arrow_circle_left,
                        color: Colors.red, size: 20),
                    const SizedBox(width: 4),
                    const Text(
                      "Rp100.000",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                )
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
                _serviceCard(
                  "Split Bill",
                  "assets/Menu/Arrow_Circle_Down_Left.png",
                ),
                _serviceCard(
                  "E-Banking",
                  "assets/Environment/Financial Institution.png",
                ),
                _serviceCard("Tarik Dana", "assets/Environment/Down Arrow.png"),
                _serviceCard(
                    "E-Wallet", "assets/Environment/Additional Card.png"),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Pengaturan",
          ),
        ],
      ),
    );
  }

  // Action Button Widget
  Widget _actionButton(String label, String iconPath, Color bgColor) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      onPressed: () {},
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

  // Service Card Widget
  Widget _serviceCard(String title, String iconPath) {
    return Card(
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
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
