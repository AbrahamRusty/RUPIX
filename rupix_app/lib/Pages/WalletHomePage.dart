import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/TopUp/TopUp.dart';
import 'package:rupix_app/QrCode/scan_qr_page.dart';
import 'RiwayatTransaksi/RiwayatTransaksi.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  final String balance = 'Rp100.000.000';
  final String used = 'Rp50.000.000';

  int _selectedIndex = 0;
  bool _isHidden = false;

  final List<Widget> _pages = const [
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background split 50:50
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: const Color(0xFF3C8DFF)), // biru
              ),
              Expanded(
                flex: 1,
                child: Container(color: const Color(0xFFF1F0F0)), // abu
              ),
            ],
          ),

          // Konten halaman
          SafeArea(
            child: Column(
              children: [
                // Custom AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/Menu/Hamburger_LG.png",
                          width: 28,
                          color: Colors.black,
                        ),
                        onPressed: () => debugPrint("Hamburger tapped"),
                      ),
                      const Text(
                        "RupiX Wallet",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Image.asset(
                          "assets/Menu/User.png",
                          width: 28,
                          color: Colors.black,
                        ),
                        onPressed: () => debugPrint("User tapped"),
                      ),
                    ],
                  ),
                ),

                // Body sesuai bottom nav index
                Expanded(
                  child: _selectedIndex == 0
                      ? Column(
                          children: [
                            _buildBalanceCard(context),

                            // Action Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // TOP UP
                                _actionButton(
                                  "TOP UP",
                                  "assets/Menu/Arrow_Up_SM.png",
                                  const Color.fromARGB(255, 151, 212, 255),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const TopUpPage(),
                                      ),
                                    );
                                  },
                                ),

                                // TRANSFER
                                _actionButton(
                                  "TRANSFER",
                                  "assets/Menu/Vector2.png",
                                  const Color.fromARGB(255, 185, 255, 105),
                                ),

                                // MORE
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () => debugPrint("MORE tapped"),
                                    icon: Image.asset(
                                      "assets/Menu/More.png",
                                      width: 22,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            _buildRiwayatTransaksi(context),
                            const SizedBox(height: 20),

                            Expanded(child: _buildServiceGrid()),
                          ],
                        )
                      : _pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 200, 200, 200),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Dompet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Aktivitas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }

  // Balance Card
  Widget _buildBalanceCard(BuildContext context) {
    return Container(
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
              // Icon mata di kiri
              IconButton(
                icon: Icon(
                  _isHidden ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[700],
                ),
                onPressed: () {
                  setState(() {
                    _isHidden = !_isHidden;
                  });
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _isHidden ? "••••••••••" : balance,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Icon QR di kanan
              IconButton(
                icon: const Icon(
                  Icons.qr_code_scanner,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScanQRPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildUsageInfo(),
        ],
      ),
    );
  }

  // Usage info
  Widget _buildUsageInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/Menu/Chart_Line.png",
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
            "assets/Menu/Vector.png",
            width: 18,
            height: 18,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  // Riwayat Transaksi
  Widget _buildRiwayatTransaksi(BuildContext context) {
    return Container(
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
        children: [
          // Header
          Row(
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    "Riwayat Transaksi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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

          // Item Transaksi
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RiwayatTransaksiPage(),
                ),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Kiri
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
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                // Kanan
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
    );
  }

  // Action Button
  Widget _actionButton(
    String label,
    String iconPath,
    Color circleColor, {
    VoidCallback? onPressed,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: onPressed ?? () => debugPrint("Action $label tapped"),
        borderRadius: BorderRadius.circular(30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(left: 6),
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(iconPath, width: 18, height: 18),
              ),
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Service Grid
  Widget _buildServiceGrid() {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _serviceCard("Split Bill", "assets/Environment/Transfer.png"),
        _serviceCard("E-Banking", "assets/Environment/Financial Institution.png"),
        _serviceCard("Tarik Dana", "assets/Environment/Down Arrow.png"),
        _serviceCard("E-Wallet", "assets/Environment/Additional Card.png"),
        _serviceCard("Promo", "assets/Environment/Reciept.png"),
        _serviceCard("Tabungan", "assets/Environment/Card.png"),
        _serviceCard("Air", "assets/Environment/Water_Drop.png"),
        _serviceCard("Listrik", "assets/Environment/Lightning.png"),
        _serviceCard("Kesehatan", "assets/Environment/First_Aid.png"),
      ],
    );
  }

  // Service Card
  Widget _serviceCard(String title, String iconPath) {
    return InkWell(
      onTap: () => debugPrint("Service $title tapped"),
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
