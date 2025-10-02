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
      'size': 40.0,
      'widget': Nometpln(),
    },
    {
      'label': 'Pulsa',
      'icon': Icons.phone_android,
      'color': const Color.fromARGB(136, 21, 255, 0),
      'size': 40.0,
      'widget': Notelp(),
    },
    {
      'label': 'E-Wallet',
      'icon': Icons.account_balance_wallet,
      'color': const Color.fromARGB(255, 243, 33, 33),
      'size': 40.0,
      'widget': const EwalletMain(),
    },
    {
      'label': 'PDAM',
      'icon': Icons.water_drop,
      'color': Colors.blueAccent,
      'size': 40.0,
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
        title: const Text(
          'TOP UP',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 76, 184),
        elevation: 0,
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () {
              _searchController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opsi top up diperbarui')),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(77, 111, 111, 111),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Pilih Layanan Top Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color.fromARGB(77, 111, 111, 111),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            
            // Grid of top-up options
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: filteredOptions.map((option) {
                  return _buildTopUpCard(
                    icon: Icon(
                      option['icon'],
                      size: option['size'],
                      color: option['color'],
                    ),
                    label: option['label'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => option['widget']),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopUpCard({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color.fromARGB(77, 111, 111, 111),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Colors.grey.shade600,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Center(child: icon),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}