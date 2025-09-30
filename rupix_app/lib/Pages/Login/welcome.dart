import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/WalletHomePage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    // Delay 2 detik sebelum masuk ke HomePage
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WalletHomePage()),
        );
      }
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
            // Text Welcome
            const Text(
                "WELCOME TO",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Rupiah Wallet",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 100, 252), // biru sesuai style
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),

            // Logo
            Image.asset(
              "assets/rupix.png",
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
