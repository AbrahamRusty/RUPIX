import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/TopUp/TopUp.dart';
import 'package:rupix_app/QrCode/scan_qr_page.dart';
import 'package:rupix_app/Pages/RiwayatTransaksi/RiwayatTransaksi.dart';
import 'package:rupix_app/Pages/Login/welcomecrypto.dart';
import 'package:rupix_app/Widgets/half_drawer_menu.dart';
import 'package:rupix_app/Pages/Transfer/transfer_screen.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  final String balance = 'Rp100.000.000';
  bool _isHidden = false;

  String _selectedWallet = "Rupiah Wallet";
  final List<String> _walletOptions = ["Rupiah Wallet", "Crypto Wallet"];

  // Colors for Dark Mode
  final Color _backgroundColor = Color.fromARGB(255, 0, 0, 0);
  final Color _cardColor = Color(0xFF1A1A1A);
  final Color _textColor = Colors.white;
  final Color _secondaryTextColor = Colors.grey[400]!;
  final Color _iconColor = Colors.white;
  final Color _buttonColor = Color(0xFF2D2D2D);
  final Color _progressBackground = Color(0xFF404040);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          // Background 50:50
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: _backgroundColor),
              ),
              Expanded(
                flex: 1,
                child: Container(color: _backgroundColor),
              ),
            ],
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 28,
                          color: _iconColor,
                        ),
                        onPressed: () => _openHalfDrawer(context),
                      ),

                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedWallet,
                          dropdownColor: _buttonColor,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: _textColor,
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: _textColor,
                          ),
                          items: _walletOptions.map((wallet) {
                            return DropdownMenuItem<String>(
                              value: wallet,
                              child: Text(wallet),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value == null) return;

                            if (value == "Crypto Wallet" &&
                                _selectedWallet != "Crypto Wallet") {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const WelcomeCrypto(),
                                ),
                              );
                            } else if (value == "Rupiah Wallet" &&
                                _selectedWallet != "Rupiah Wallet") {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const WalletHomePage(),
                                ),
                              );
                            }

                            setState(() {
                              _selectedWallet = value;
                            });
                          },
                        ),
                      ),

                      IconButton(
                        icon: Icon(
                          Icons.person,
                          size: 28,
                          color: _iconColor,
                        ),
                        onPressed: () => debugPrint("User tapped"),
                      ),
                    ],
                  ),
                ),

                Expanded(child: _buildMainWalletPage(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openHalfDrawer(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (_) => const HalfDrawerMenu(), // TANPA PARAMETER
  );
}

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

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'SALDO',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _textColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  _isHidden ? Icons.visibility_off : Icons.visibility,
                  color: _secondaryTextColor,
                ),
                onPressed: () => setState(() => _isHidden = !_isHidden),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    _isHidden ? "••••••••••" : balance,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.qr_code_scanner, color: _textColor),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ScanQRPage()),
                  );
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

  Widget _buildUsageInfo(BuildContext context) {
    double percent = 0.5;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RiwayatTransaksiPage()),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: percent,
                    backgroundColor: _progressBackground,
                    color: Colors.green,
                    strokeWidth: 4,
                  ),
                  Center(
                    child: Text(
                      "${(percent * 100).toInt()}%",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Rp50.000.000 terpakai di Agustus',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionButton(
          "TOP UP",
          Icons.arrow_upward,
          Colors.lightBlueAccent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TopUpPage()),
            );
          },
        ),
        _actionButton(
          "TRANSFER",
          Icons.send,
          Colors.lightGreen,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TransferScreen()),
            );
          },
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: _buttonColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () => debugPrint("MORE tapped"),
            icon: Icon(
              Icons.more_horiz, 
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(
    String label,
    IconData icon,
    Color circleColor, {
    VoidCallback? onPressed,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: _buttonColor,
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
              child: Center(child: Icon(icon, size: 18, color: Colors.black)),
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                label,
                style: TextStyle(
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

  Widget _buildRiwayatTransaksi(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const RiwayatTransaksiPage()),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Riwayat Transaksi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: _textColor,
                      ),
                    ),
                  ),
                ),
                Icon(Icons.expand_more, color: _secondaryTextColor),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: _buttonColor,
                      child: Icon(Icons.flash_on, color: Colors.orange),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Listrik PLN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: _textColor,
                          ),
                        ),
                        Text(
                          "Kemarin 19.00",
                          style: TextStyle(color: _secondaryTextColor, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.arrow_downward, size: 20, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      "Rp250.000",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
        color: _cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 28, color: Colors.blue[200]),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}