import 'package:flutter/material.dart';
import 'package:rupix_transfer/widgets/contact_item.dart';
import 'package:rupix_transfer/widgets/transfer_method_button.dart';
import 'package:rupix_transfer/screens/transfer_amount_screen.dart';
import 'package:rupix_transfer/screens/transfer_bank_screen.dart';
import 'package:rupix_transfer/screens/transfer_ewallet_screen.dart';

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
  final List<Contact> _allContacts = [
    Contact(name: 'Patricia Natania', details: 'RupiX - 0011 2000 3456'),
    Contact(name: 'Lyvia Reva', details: 'BCA - 8******20'),
    Contact(name: 'Jessica W', details: 'Gopay - 08*******98'),
  ];
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transfer',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Choose your method',
                style: TextStyle(
                  color: Colors.black,
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
                    imagePath: 'assets/images/bank.png',
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
                    imagePath: 'assets/images/ewallet.png',
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
                decoration: InputDecoration(
                  hintText: 'Search contact',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 15,
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
              const Text(
                'Recent Contacts',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredContacts.length,
                itemBuilder: (context, index) {
                  final contact = _filteredContacts[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedContact = contact;
                      });
                      if (contact.details.contains('RupiX')) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RupiXTransferAmountScreen(
                              contactName: contact.name,
                              contactDetails: contact.details,
                            ),
                          ),
                        );
                      }
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
            ],
          ),
        ),
      ),
    );
  }
}
