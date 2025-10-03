import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Transfer/transfer_ewallet_form_screen.dart';
import 'package:rupix_app/Widgets/ewallet_list_tile.dart';

class TransferEWalletScreen extends StatefulWidget {
  const TransferEWalletScreen({super.key});

  @override
  State<TransferEWalletScreen> createState() => _TransferEWalletScreenState();
}

class _TransferEWalletScreenState extends State<TransferEWalletScreen> {
  String? _selectedEWallet;
  // ignore: unused_field
  String? _selectedEWalletLogoPath;

  final List<Map<String, String>> _eWallets = const [
    {'name': 'Gopay', 'path': 'assets/Transfer/gopay.png'},
    {'name': 'OVO', 'path': 'assets/Transfer/ovo.png'},
    {'name': 'ShopeePay', 'path': 'assets/Transfer/shopeepay.png'},
    {'name': 'Dana', 'path': 'assets/Transfer/dana.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final bool isContinueEnabled = _selectedEWallet != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0088FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transfer e-wallet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Transfer to e-wallet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Search or select recipients e-wallet',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for e-wallet',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  ..._eWallets.map((ewallet) {
                    final ewalletName = ewallet['name']!;
                    final logoPath = ewallet['path']!;

                    return EWalletListTile(
                      ewalletName: ewalletName,
                      logoPath: logoPath,
                      isSelected: _selectedEWallet == ewalletName,
                      onTap: () {
                        setState(() {
                          _selectedEWallet = ewalletName;
                          _selectedEWalletLogoPath = logoPath;
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isContinueEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferEWalletFormScreen(
                              ewalletName: _selectedEWallet!,
                            ),
                          ),
                        );
                      }
                    : null,

                style: ElevatedButton.styleFrom(
                  backgroundColor: isContinueEnabled
                      ? const Color(0xFF0088FF)
                      : Colors.grey, // Warna abu-abu jika disabled

                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
