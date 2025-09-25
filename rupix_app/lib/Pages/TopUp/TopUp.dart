 import 'package:flutter/material.dart';
import '../TopUp/EWallet/Ewallet_main.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP UP'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _topUpOption(
              context,
              icon: _plnLogo(),
              label: 'PLN',
              onTap: () {
                print('PLN tapped');
              },
            ),
            const SizedBox(height: 16),
            _topUpOption(
              context,
              icon: const Icon(
                Icons.phone_android,
                size: 48,
                color: Colors.black54,
              ),
              label: 'Pulsa',
              onTap: () {
                print('Pulsa tapped');
              },
            ),
            const SizedBox(height: 16),
            _topUpOption(
              context,
              icon: _eWalletLogo(),
              label: 'E-Wallet',
              onTap: () {
                // Modifikasi: Ganti print menjadi navigasi ke halaman E-Wallet
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EwalletMain(), // Target: TopUpPage dari Ewallet_main.dart (halaman list E-Wallet)
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _topUpOption(
    BuildContext context, {
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 32),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget logo PLN sederhana dengan Icon dan warna
  Widget _plnLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.flash_on, size: 48, color: Colors.red),
        Positioned(
          bottom: 4,
          child: Container(
            width: 36,
            height: 10,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 3, color: Colors.blue),
                bottom: BorderSide(width: 3, color: Colors.blue),
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }

  // Widget logo E-Wallet sederhana dengan icon berbentuk dompet dan lingkaran putus-putus
  Widget _eWalletLogo() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.account_balance_wallet, size: 48, color: Colors.blue),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.blue,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ],
    );
  }
}
