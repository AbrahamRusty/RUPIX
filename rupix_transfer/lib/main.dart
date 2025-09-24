import 'package:flutter/material.dart';
import 'package:rupix_transfer/screens/transfer_screen.dart';

void main() {
  runApp(const TransferApp());
}

class TransferApp extends StatelessWidget {
  const TransferApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB188EB)),
        useMaterial3: true,
      ),
      home: const TransferScreen(),
    );
  }
}
