import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/TopUp/EWallet/Dana/no_virtualdana.dart';
import 'package:rupix_app/Pages/TopUp/EWallet/Linkaja/no_virtuallinkaja.dart';
import 'package:rupix_app/Pages/TopUp/EWallet/Gopay/no_virtualgopay.dart';
import 'package:rupix_app/Pages/TopUp/EWallet/OVO/no_virtualovo.dart';
import 'package:rupix_app/Pages/TopUp/EWallet/ShopeePay/no_virtualshopee.dart';

class ewallethome extends StatelessWidget {
  const ewallethome({super.key});

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
        backgroundColor: const Color(0xFF2196F3),
        title: const Text(
          'TOP UP',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
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
                  _EWalletListTile(
                    leading: Image.asset(
                      'assets/Environment/gopay.png',
                      width: 35,
                      height: 35,
                    ),
                    name: 'GoPay',
                    balance: '50.000.000',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoVirtualgopayPage(),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoVirtualDanaPage(),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoVirtualovoPage(),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoVirtualshopeePage(),
                        ),
                      );
                    },
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoVirtuallinkajaPage(),
                        ),
                      );
                    },
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
  final VoidCallback? onTap;

  const _EWalletListTile({
    required this.leading,
    required this.name,
    required this.balance,
    this.onTap,
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
      onTap: onTap,
    );
  }
}
