import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Transfer/transfer_bank_form_screen.dart';
// ignore: unused_import
import 'package:rupix_app/Widgets/bank_list_tile.dart';

class TransferBankScreen extends StatefulWidget {
  const TransferBankScreen({super.key});

  @override
  State<TransferBankScreen> createState() => _TransferBankScreenState();
}

class _TransferBankScreenState extends State<TransferBankScreen> {
  String? _selectedBank;
  // ignore: unused_field
  String? _selectedBankLogoPath;
  String _searchQuery = '';

  final List<Map<String, String>> _banks = const [
    {'name': 'BCA', 'path': 'assets/Transfer/bca.png'},
    {'name': 'Mandiri', 'path': 'assets/Transfer/mandiri.png'},
    {'name': 'BNI', 'path': 'assets/Transfer/bni.png'},
    {
      'name': 'Bank Syariah Indonesia',
      'path': 'assets/Transfer/bank syariah indonesia.png',
    },
    {'name': 'Bank Danamon', 'path': 'assets/Transfer/bank-danamon.png'},
    {'name': 'Bank DKI', 'path': 'assets/Transfer/bank-dki.png'},
    {'name': 'CIMB Niaga', 'path': 'assets/Transfer/cimbniaga.png'},
    {'name': 'Seabank', 'path': 'assets/Transfer/seabank.png'},
  ];

  List<Map<String, String>> get _filteredBanks {
    if (_searchQuery.isEmpty) {
      return _banks;
    }
    return _banks.where((bank) {
      return bank['name']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final bool isContinueEnabled = _selectedBank != null;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Transfer to Bank',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Search or select recipients bank',
                      style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search bank',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF2D2D2D),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ..._filteredBanks.map((bank) {
                      final bankName = bank['name']!;
                      final logoPath = bank['path']!;
                      final isSelected = _selectedBank == bankName;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedBank = bankName;
                            _selectedBankLogoPath = logoPath;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF0088FF)
                                  : Colors.grey.withOpacity(0.3),
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                logoPath,
                                width: 40,
                                height: 40,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.account_balance,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  bankName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Radio<String>(
                                value: bankName,
                                groupValue: _selectedBank,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedBank = value;
                                    _selectedBankLogoPath = logoPath;
                                  });
                                },
                                activeColor: const Color(0xFF0088FF),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isContinueEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferBankFormScreen(
                              bankName: _selectedBank!,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isContinueEnabled
                      ? const Color(0xFF0088FF)
                      : const Color(0xFF2D2D2D),
                  disabledBackgroundColor: const Color(0xFF2D2D2D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isContinueEnabled ? Colors.white : Colors.grey[400],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
