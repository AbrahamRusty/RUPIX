import 'package:flutter/material.dart';
import 'package:rupix_transfer/screens/transfer_ewallet_form_screen.dart';
import 'package:rupix_transfer/widgets/ewallet_list_tile.dart';

class TransferEWalletScreen extends StatefulWidget {
  const TransferEWalletScreen({super.key});

  @override
  State<TransferEWalletScreen> createState() => _TransferEWalletScreenState();
}

class _TransferEWalletScreenState extends State<TransferEWalletScreen> {
  String? _selectedEWallet;
  String _searchQuery = '';

  final List<Map<String, String>> _allEWallets = const [
    {'name': 'Gopay', 'logoPath': 'assets/images/gopay.png'},
    {'name': 'OVO', 'logoPath': 'assets/images/ovo.png'},
    {'name': 'ShopeePay', 'logoPath': 'assets/images/shopeepay.png'},
    {'name': 'Dana', 'logoPath': 'assets/images/dana.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> filteredEWallets = _allEWallets
        .where(
          (ewallet) => ewallet['name']!.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ),
        )
        .toList();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
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
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for e-wallet',
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: filteredEWallets.map((ewallet) {
                    return EWalletListTile(
                      ewalletName: ewallet['name']!,
                      logoPath: ewallet['logoPath']!,
                      onTap: () {
                        setState(() {
                          _selectedEWallet = ewallet['name']!;
                        });
                      },
                      isSelected: _selectedEWallet == ewallet['name']!,
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedEWallet != null
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
                  backgroundColor: const Color(0xFF0088FF),
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
            // Menambah sedikit padding di bagian bawah
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
