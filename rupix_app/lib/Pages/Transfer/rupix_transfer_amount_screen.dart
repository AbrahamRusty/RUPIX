import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rupix_app/Pages/Transfer/transfer_receipt_screen.dart';
import 'package:rupix_app/Widgets/numeric_pad.dart';

class Contact {
  final String name;
  final String details;

  Contact({required this.name, required this.details});
}

class RupiXTransferAmountScreen extends StatefulWidget {
  final String contactName;
  final String contactDetails;

  const RupiXTransferAmountScreen({
    super.key,
    required this.contactName,
    required this.contactDetails,
  });

  @override
  State<RupiXTransferAmountScreen> createState() =>
      _RupiXTransferAmountScreenState();
}

class _RupiXTransferAmountScreenState extends State<RupiXTransferAmountScreen> {
  String _amount = '';

  // Menggunakan final untuk data statis
  final List<Contact> _allContacts = [
    Contact(name: 'Patricia Natania', details: 'RupiX - 0011 2000 3456'),
    Contact(name: 'Lyvia Reva', details: 'BCA - 8******20'),
    Contact(name: 'Jessica W', details: 'Gopay - 08*******98'),
    Contact(name: 'Abraham', details: 'RupiX - 2333 9090 8785'),
    Contact(name: 'Satria R', details: 'Gopay - 08*******77'),
    Contact(name: 'Vicky Erie', details: 'BRI - 1******32'),
  ];
  final Map<String, String> _staticRupiXNumbers = {
    'Lyvia Reva': '1122 3344 5566',
    'Jessica W': '6655 4433 2211',
    'Satria R': '7890 1234 5678',
    'Vicky Erie': '1111 2222 3333',
  };

  late String _currentContactName;
  late String _currentContactDetails;

  @override
  void initState() {
    super.initState();
    _currentContactName = widget.contactName;
    _currentContactDetails = widget.contactDetails;
  }

  void _onNumberPressed(String number) {
    setState(() {
      if (_amount.length < 12) {
        _amount += number;
      }
    });
  }

  void _onBackspacePressed() {
    setState(() {
      if (_amount.isNotEmpty) {
        _amount = _amount.substring(0, _amount.length - 1);
      }
    });
  }

  // Fungsi untuk menampilkan dialog pemilihan kontak
  void _showContactSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Kontak'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _allContacts.length,
              itemBuilder: (context, index) {
                final contact = _allContacts[index];

                String finalDetails;
                if (contact.details.startsWith('RupiX')) {
                  finalDetails = contact.details;
                } else {
                  String? customRupiXNumber = _staticRupiXNumbers[contact.name];
                  finalDetails = customRupiXNumber != null
                      ? 'RupiX - $customRupiXNumber'
                      : 'RupiX - 1234 5678 9012';
                }

                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.details),
                  onTap: () {
                    setState(() {
                      _currentContactName = contact.name;
                      _currentContactDetails = finalDetails;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  // Format angka menjadi mata uang Rupiah
  String _formatCurrency(String value) {
    if (value.isEmpty) {
      return 'Rp0';
    }
    try {
      final amount = int.parse(value);
      final format = NumberFormat.currency(
        locale: 'id_ID',
        symbol: 'Rp',
        decimalDigits: 0,
      );
      return format.format(amount);
    } catch (e) {
      return 'Rp$value';
    }
  }

  @override
  Widget build(BuildContext context) {
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
          'Your Wallet',
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: _showContactSelectionDialog,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _currentContactName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _currentContactDetails,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Amount to Transfer',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              _formatCurrency(_amount), // Panggil fungsi format
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          NumericPad(
            onNumberPressed: _onNumberPressed,
            onBackspacePressed: _onBackspacePressed,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: _amount.isNotEmpty && _amount != '0'
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferReceiptScreen(
                            amount: _amount,
                            recipientName: _currentContactName,
                            recipientDetails: _currentContactDetails,
                          ),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF0088FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
