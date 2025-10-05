import 'package:flutter/material.dart';

class TarikDanaPage extends StatefulWidget {
  const TarikDanaPage({super.key});

  @override
  State<TarikDanaPage> createState() => _TarikDanaPageState();
}

class _TarikDanaPageState extends State<TarikDanaPage> {
  final List<BankAccount> _bankAccounts = [
    BankAccount(
      bankName: 'BCA',
      accountNumber: '1234567890',
      accountName: 'Shreya Jain',
      isVerified: true,
    ),
    BankAccount(
      bankName: 'Mandiri', 
      accountNumber: '0987654321',
      accountName: 'Shreya Jain',
      isVerified: true,
    ),
  ];

  double _amount = 0;
  BankAccount? _selectedAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 60, 144),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tarik Dana',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Amount Input
            Card(
              color: const Color(0xFF1A1A1A),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jumlah Penarikan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixIcon: const Icon(Icons.attach_money, color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _amount = double.tryParse(value) ?? 0;
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Biaya admin: Rp 2.500',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Bank Account Selection
            const Text(
              'Pilih Rekening Tujuan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: _bankAccounts.length,
                itemBuilder: (context, index) {
                  final account = _bankAccounts[index];
                  return Card(
                    color: const Color(0xFF1A1A1A),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: RadioListTile<BankAccount>(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            account.bankName,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            account.accountNumber,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ],
                      ),
                      secondary: account.isVerified
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Verified',
                                style: TextStyle(color: Colors.green, fontSize: 10),
                              ),
                            )
                          : null,
                      value: account,
                      groupValue: _selectedAccount,
                      onChanged: (value) {
                        setState(() {
                          _selectedAccount = value;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  );
                },
              ),
            ),

            // Withdraw Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _amount > 0 && _selectedAccount != null ? _showWithdrawConfirmation : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Tarik Dana',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showWithdrawConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Konfirmasi Penarikan',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah: Rp ${_amount.toStringAsFixed(0)}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Rekening: ${_selectedAccount!.bankName}',
              style: TextStyle(color: Colors.grey[400]),
            ),
            Text(
              'No. Rek: ${_selectedAccount!.accountNumber}',
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 8),
            const Text(
              'Dana akan masuk dalam 1-2 jam kerja',
              style: TextStyle(color: Colors.orange, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Penarikan dana Rp ${_amount.toStringAsFixed(0)} berhasil diproses'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text('Konfirmasi'),
          ),
        ],
      ),
    );
  }
}

class BankAccount {
  final String bankName;
  final String accountNumber;
  final String accountName;
  final bool isVerified;

  BankAccount({
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.isVerified,
  });
}