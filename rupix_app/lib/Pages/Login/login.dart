import 'package:flutter/material.dart';
import 'buat_dompet_page.dart'; // pastikan file ini ada

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ===== Logo di atas =====
              Image.asset(
                "assets/rupix.png",
                height: 300,
              ),

              const SizedBox(height: 32),

              // ===== Teks Welcome =====
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
                "RupiX",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 65, 100, 252), // biru sesuai style
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Kontrol Manajemen Keuangan dan Aset Digitalmu",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 100),

              // ===== Row Mulai Disini =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "MULAI DISINI",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BuatDompetPage(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF6BFF5A), // hijau neon sesuai figma
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: const Icon(
                        Icons.login_rounded,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
