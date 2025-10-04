import 'package:flutter/material.dart';
import 'package:rupix_app/Widgets/contact_item.dart';
import 'package:rupix_app/Widgets/transfer_method_button.dart';
import 'package:rupix_app/Pages/Transfer/rupix_transfer_amount_screen.dart';
import 'package:rupix_app/Pages/Transfer/transfer_bank_screen.dart';
import 'package:rupix_app/Pages/Transfer/transfer_ewallet_screen.dart';

class Contact {
  final String name;
  final String details;

  Contact({required this.name, required this.details});
}

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  // Colors for Dark Mode
  final Color _backgroundColor = const Color.fromARGB(255, 0, 0, 0);
  final Color _textColor = Colors.white;
  final Color _cardColor = const Color(0xFF1A1A1A);
  final Color _buttonColor = const Color(0xFF2D2D2D);

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

  List<Contact> _filteredContacts = [];
  final TextEditingController _searchController = TextEditingController();
  Contact? _selectedContact;

  @override
  void initState() {
    super.initState();
    _filteredContacts = _allContacts;
    _searchController.addListener(_filterContacts);
  }

  void _filterContacts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _allContacts.where((contact) {
        return contact.name.toLowerCase().contains(query) ||
            contact.details.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterContacts);
    _searchController.dispose();
    super.dispose();
  }

  String _getRupiXDetails(Contact contact) {
    if (contact.details.startsWith('RupiX')) {
      return contact.details;
    } else {
      String? customRupiXNumber = _staticRupiXNumbers[contact.name];
      return customRupiXNumber != null
          ? 'RupiX - $customRupiXNumber'
          : 'RupiX - 1234 5678 9012';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: _textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Transfer',
          style: TextStyle(
            color: _textColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: _backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Choose your method',
                style: TextStyle(
                  color: _textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TransferMethodButton(
                    label: 'Bank',
                    imagePath: 'assets/Transfer/bank.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransferBankScreen(),
                        ),
                      );
                    },
                  ),
                  TransferMethodButton(
                    label: 'E-Wallet',
                    imagePath: 'assets/Transfer/ewallet.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransferEWalletScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search contact',
                  hintStyle: TextStyle(
                    color: Colors.grey[400]!.withOpacity(0.6),
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: _buttonColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Recent Contacts',
                style: TextStyle(
                  color: _textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredContacts.length,
                  itemBuilder: (context, index) {
                    final contact = _filteredContacts[index];

                    return GestureDetector(
                      onTap: () {
                        final finalDetails = _getRupiXDetails(contact);
                        setState(() {
                          _selectedContact = contact;
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RupiXTransferAmountScreen(
                              contactName: contact.name,
                              contactDetails: finalDetails,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ContactItem(
                          name: contact.name,
                          details: contact.details,
                          isSelected: contact.name == _selectedContact?.name,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
