import 'package:flutter/material.dart';
import 'Pln/nomet.dart';
import 'EWallet/Ewallet_main.dart';
import 'Pulsa/notelp.dart';
import 'PDAM/no_virtualpdam.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  final List<Map<String, dynamic>> _topUpOptions = [
    {
      'label': 'PLN',
      'icon': Icons.flash_on,
      'color': const Color.fromARGB(255, 255, 230, 0),
      'widget': Nometpln(), // Changed from Jumlahtoken to Notapln
    },
    {
      'label': 'Pulsa',
      'icon': Icons.phone_android,
      'color': Colors.black54,
      'widget': Notelp(),
    },
    {
      'label': 'E-Wallet',
      'icon': Icons.account_balance_wallet,
      'color': Colors.blue,
      'widget': const EwalletMain(),
    },
    {
      'label': 'PDAM',
      'icon': null,
      'image': 'assets/Environment/Water_Drop.png',
      'widget': const NoVirtualpdamPage(),
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredOptions = _topUpOptions.where((option) {
      return option['label'].toLowerCase().contains(_searchText);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TOP UP'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // For demo, just clear search
              _searchController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opsi top up diperbarui')),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Pilih Layanan Top Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Search bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari layanan top up...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  ),
                ),
                const SizedBox(height: 16),
                // Recent Transactions
                // Grid of top-up options filtered by search
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: filteredOptions.map((option) {
                      return _topUpOption(
                        context,
                        icon: option['icon'] != null
                            ? Icon(option['icon'], size: 40, color: option['color'])
                            : Image.asset(option['image'], width: 40, height: 40, fit: BoxFit.contain),
                        label: option['label'],
                        onTap: () {
                          if (option['widget'] != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => option['widget']),
                            );
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  