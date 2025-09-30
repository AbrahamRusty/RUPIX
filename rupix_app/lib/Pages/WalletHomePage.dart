import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/TopUp/TopUp.dart';
import 'package:rupix_app/Pages/settings/setting_home_screen.dart';
import 'package:rupix_app/QrCode/scan_qr_page.dart';
import 'package:rupix_app/Pages/RiwayatTransaksi/RiwayatTransaksi.dart';
import 'package:rupix_app/Pages/Login/welcomecrypto.dart';
import 'package:rupix_app/Pages/aktivitas.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  final String balance = 'Rp100.000.000';
  bool _isHidden = false;

  int _selectedIndex = 0;
  String _selectedWallet = "Rupiah Wallet";
  final List<String> _walletOptions = ["Rupiah Wallet", "Crypto Wallet"];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildMainWalletPage(context),
      const AktivitasPage(),
      SettingsHomeScreen(onMenuTap: () {
        debugPrint("Menu tapped in SettingsHomeScreen");
      }),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background 50:50
          Column(
            children: [
              Expanded(flex: 1, child: Container(color: const Color(0xFF3C8DFF))),
              Expanded(flex: 1, child: Container(color: const Color(0xFFF1F0F0))),
            ],
          ),

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
                        icon: const Icon(Icons.menu, size: 28, color: Colors.black),
                        onPressed: () => debugPrint("Hamburger tapped"),
                      ),

                      // Dropdown wallet switch
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedWallet,
                          dropdownColor: Colors.white,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: _walletOptions.map((wallet) {
                            return DropdownMenuItem<String>(
                              value: wallet,
                              child: Text(wallet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value == null) return;

                            if (value == "Crypto Wallet" && _selectedWallet != "Crypto Wallet") {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const WelcomeCrypto()),
                              );
                            } else if (value == "Rupiah Wallet" && _selectedWallet != "Rupiah Wallet") {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const WalletHomePage()),
                              );
                            }

                            setState(() {
                              _selectedWallet = value;
                            });
                          },
                        ),
                      ),

                      IconButton(
                        icon: const Icon(Icons.person, size: 28, color: Colors.black),
                        onPressed: () => debugPrint("User tapped"),
                      ),
                    ],
                  ),
                ),

                // Page content
                Expanded(child: pages[_selectedIndex]),
              ],
            ),
          ),
        ],
      ),

      // Bottom Nav
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 200, 200, 200),
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Dompet"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Aktivitas"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  // 🔹 Main Wallet Page
  Widget _buildMainWalletPage(BuildContext context) {
    return Column(
      children: [
        _buildBalanceCard(context),
        _buildActionButtons(context),
        const SizedBox(height: 16),
        _buildRiwayatTransaksi(context),
        const SizedBox(height: 20),
        Expanded(child: _buildServiceGrid()),
      ],
    );
  }

  // 🔹 Balance Card
  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          const Text('SALDO',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[700]),
                onPressed: () => setState(() => _isHidden = !_isHidden),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _isHidden ? "••••••••••" : balance,
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_scanner, color: Colors.black87),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ScanQRPage()));
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildUsageInfo(context),
        ],
      ),
    );
  }

  // 🔹 Usage Info dengan chart + arrow
  Widget _buildUsageInfo(BuildContext context) {
    double percent = 0.5; // 50% usage dummy

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const RiwayatTransaksiPage()));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // Circular progress chart
            SizedBox(
              width: 32,
              height: 32,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: percent,
                    backgroundColor: Colors.grey[700],
                    color: Colors.green,
                    strokeWidth: 4,
                  ),
                  Center(
                    child: Text("${(percent * 100).toInt()}%",
                        style: const TextStyle(color: Colors.white, fontSize: 10)),
                  )
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Text usage
            const Expanded(
              child: Text(
                'Rp50.000.000 terpakai di Agustus',
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),

            // Arrow
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }

  // 🔹 Action Buttons
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionButton("TOP UP", Icons.arrow_upward, Colors.lightBlueAccent,
            onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const TopUpPage()));
        }),
        _actionButton("TRANSFER", Icons.send, Colors.lightGreen),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () => debugPrint("MORE tapped"),
            icon: const Icon(Icons.more_horiz, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(String label, IconData icon, Color circleColor,
      {VoidCallback? onPressed}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        onTap: onPressed ?? () => debugPrint("Action $label tapped"),
        borderRadius: BorderRadius.circular(30),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 42,
            height: 42,
            margin: const EdgeInsets.only(left: 6),
            decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
            child: Center(child: Icon(icon, size: 18, color: Colors.black)),
          ),
          const SizedBox(width: 12),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ]),
      ),
    );
  }

  // 🔹 Riwayat Transaksi (preview) → bisa di-tap
  Widget _buildRiwayatTransaksi(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const RiwayatTransaksiPage()));
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 3))],
        ),
        child: Column(
          children: [
            Row(children: const [
              Expanded(
                child: Center(
                  child: Text("Riwayat Transaksi",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
              Icon(Icons.expand_more, color: Colors.black54),
            ]),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.flash_on, color: Colors.orange),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Listrik PLN",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Text("Kemarin 19.00",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ]),
                Row(children: const [
                  Icon(Icons.arrow_downward, size: 20, color: Colors.red),
                  SizedBox(width: 4),
                  Text("Rp250.000",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red)),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Service Grid
  Widget _buildServiceGrid() {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _serviceCard("Split Bill", Icons.group),
        _serviceCard("E-Banking", Icons.account_balance),
        _serviceCard("Tarik Dana", Icons.download),
        _serviceCard("E-Wallet", Icons.account_balance_wallet),
        _serviceCard("Promo", Icons.local_offer),
        _serviceCard("Tabungan", Icons.credit_card),
        _serviceCard("Air", Icons.water_drop),
        _serviceCard("Listrik", Icons.flash_on),
        _serviceCard("Kesehatan", Icons.health_and_safety),
      ],
    );
  }

  Widget _serviceCard(String title, IconData icon) {
    return InkWell(
      onTap: () => debugPrint("Service $title tapped"),
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(icon, size: 28, color: Colors.blueAccent),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ]),
        ),
      ),
    );
  }
}
