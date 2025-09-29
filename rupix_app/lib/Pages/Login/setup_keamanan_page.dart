import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'letsgo_page.dart';

class SetupKeamananPage extends StatefulWidget {
  const SetupKeamananPage({super.key});

  @override
  State<SetupKeamananPage> createState() => _SetupKeamananPageState();
}

class _SetupKeamananPageState extends State<SetupKeamananPage> {
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Gunakan Face ID untuk keamanan dompetmu',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      if (didAuthenticate) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LetsGoPage()),
        );
      }
    } catch (e) {
      debugPrint("Auth error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "AKSES KEAMANAN",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Langkah pertama untuk mengamankan dompetmu di perangkat ini dan hanya kamu yang dapat akses.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Face ID
            InkWell(
              onTap: _authenticate,
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.face, color: Colors.black, size: 28),
                    SizedBox(width: 12),
                    Text(
                      "Face ID (Disarankan)",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Kustom Pin (belum aktif)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.pin, color: Colors.white, size: 28),
                  SizedBox(width: 12),
                  Text(
                    "Kustom Pin",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
