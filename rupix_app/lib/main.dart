import 'package:flutter/material.dart';
import 'Pages/Login/login.dart';
// ignore: unused_import
import 'package:rupix_app/Pages/WalletHomePage.dart';

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
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const LoginPage(),
    );
  }
}
