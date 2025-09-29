import 'package:flutter/material.dart';
import '../WalletHomePage.dart';

class LetsGoPage extends StatefulWidget {
  const LetsGoPage({super.key});

  @override
  State<LetsGoPage> createState() => _LetsGoPageState();
}

class _LetsGoPageState extends State<LetsGoPage> {
  @override
  void initState() {
    super.initState();

    // ⏳ delay 2 detik sebelum pindah ke homepage
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WalletHomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/crypto.png", height: 150), // ilustrasi
            const SizedBox(height: 24),
            const Text(
              "DOMPETMU SIAP DIGUNAKAN",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              "Sekarang kamu sudah punya dompet yang aman dan siap digunakan 🚀",
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
