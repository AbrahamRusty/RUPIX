import 'package:flutter/material.dart';
import 'Pages/Login/login.dart';
import 'Pages/WalletHomePage.dart';

void main() {
  runApp(const RupiahWalletApp());
}

class RupiahWalletApp extends StatelessWidget {
  const RupiahWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rupiah Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
      ),
      home: const LoginPage(),
    );
  }
}
