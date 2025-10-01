import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Transfer/transfer_bank_form_screen.dart';
import 'package:rupix_app/Widgets/bank_list_tile.dart';

class TransferBankScreen extends StatelessWidget {
  const TransferBankScreen({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
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
              BankListTile(
                bankName: 'BCA',
                logoPath: 'assets/Transfer/bca.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TransferBankFormScreen(bankName: 'BCA'),
                    ),
                  );
                },
              ),
              BankListTile(
                bankName: 'Mandiri',
                logoPath: 'assets/Transfer/mandiri.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TransferBankFormScreen(bankName: 'Mandiri'),
                    ),
                  );
                },
              ),
              BankListTile(
                bankName: 'BNI',
                logoPath: 'assets/Transfer/bni.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const TransferBankFormScreen(bankName: 'BNI'),
                    ),
                  );
                },
              ),
              BankListTile(
                bankName: 'Bank Syariah Indonesia',
                logoPath: 'assets/Transfer/bank syariah indonesia.png',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransferBankFormScreen(
                        bankName: 'Bank Syariah Indonesia',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
