import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EwalletMain(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// -----------------------------------------------------------------

class EwalletMain extends StatelessWidget {
  const EwalletMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1e90ff),
        title: const Text(
          'TOP UP',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Logika untuk tombol kembali
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'PILIH E-WALLET',

                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  const _EWalletListTile(
                    leading: Icon(
                      SimpleIcons.gojek,
                      size: 35,
                      color: Colors.green,
                    ),
                    name: 'GoPay',
                    balance: '50.000.000',
                  ),
                  const Divider(indent: 20, endIndent: 20, height: 0),
                  _EWalletListTile(
                    leading: Image.asset(
                      'assets/Environment/dana.png',
                      width: 35,
                      height: 35,
                    ),
                    name: 'Dana',
                    balance: '30.000.000',
                  ),
                  const Divider(indent: 20, endIndent: 20, height: 0),
                  _EWalletListTile(
                    leading: Image.asset(
                      'assets/Environment/ovo.png',
                      width: 35,
                      height: 35,
                    ),
                    name: 'OVO',
                    balance: '30.000.000',
                  ),
                  const Divider(indent: 20, endIndent: 20, height: 0),
                  _EWalletListTile(
                    leading: Image.asset(
                      "assets/Environment/shopeepay.png",
                      width: 35,
                      height: 35,
                    ),
                    name: 'ShopeePay',
                    balance: '30.000.000',
                  ),
                  const Divider(indent: 20, endIndent: 20, height: 0),
                  _EWalletListTile(
                    leading: Image.asset(
                      "assets/Environment/linkaja.png",
                      width: 35,
                      height: 35,
                    ),
                    name: 'LinkAja!',
                    balance: '30.000.000',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EWalletListTile extends StatelessWidget {
  final Widget leading;
  final String name;
  final String balance;

  const _EWalletListTile({
    required this.leading,
    required this.name,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: leading,
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        'saldo : Rp $balance',
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
      onTap: () {
        // Logika ketika tile ditekan
      },
    );
  }
}
