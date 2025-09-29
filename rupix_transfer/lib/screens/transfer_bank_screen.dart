import 'package:flutter/material.dart';
import 'package:rupix_transfer/screens/transfer_bank_form_screen.dart';
import 'package:rupix_transfer/widgets/bank_list_tile.dart';

class TransferBankScreen extends StatefulWidget {
  const TransferBankScreen({super.key});

  @override
  State<TransferBankScreen> createState() => _TransferBankScreenState();
}

class _TransferBankScreenState extends State<TransferBankScreen> {
  final List<Map<String, String>> _allBanks = [
    {'name': 'BCA', 'logo': 'assets/images/bca.png'},
    {'name': 'Mandiri', 'logo': 'assets/images/mandiri.png'},
    {'name': 'BNI', 'logo': 'assets/images/bni.png'},
    {
      'name': 'Bank Syariah Indonesia',
      'logo': 'assets/images/bank syariah indonesia.png',
    },
    {'name': 'BRI', 'logo': 'assets/images/bri.png'},
    {'name': 'Bank Danamon', 'logo': 'assets/images/bank-danamon.png'},
    {'name': 'CIMB Niaga', 'logo': 'assets/images/cimbniaga.png'},
    {'name': 'Bank DKI', 'logo': 'assets/images/bank-dki.png'},
    {'name': 'Seabank', 'logo': 'assets/images/seabank.png'},
  ];

  List<Map<String, String>> _filteredBanks = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredBanks = _allBanks;
    _searchController.addListener(_filterBanks);
  }

  void _filterBanks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredBanks = _allBanks.where((bank) {
        return bank['name']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterBanks);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Transfer Bank',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transfer to Bank',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Search or select recipients bank',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search bank',
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
              child: ListView.builder(
                itemCount: _filteredBanks.length,
                itemBuilder: (context, index) {
                  final bank = _filteredBanks[index];
                  return BankListTile(
                    bankName: bank['name']!,
                    logoPath: bank['logo']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TransferBankFormScreen(bankName: bank['name']!),
                        ),
                      );
                    },
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
