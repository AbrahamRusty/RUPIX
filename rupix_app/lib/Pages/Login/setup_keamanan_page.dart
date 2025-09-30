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

  Future<void> _authenticateBiometric() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Gunakan Fingerprint untuk keamanan dompetmu',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      if (didAuthenticate && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LetsGoPage()),
        );
      }
    } catch (e) {
      debugPrint("Auth error: $e");
    }
  }

  Future<void> _setupPin() async {
    String? pin = await _showPinDialog("Buat PIN Baru");
    if (pin != null && pin.isNotEmpty) {
      String? confirmPin = await _showPinDialog("Konfirmasi PIN");
      if (confirmPin == pin) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LetsGoPage()),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("PIN tidak cocok, coba lagi.")),
          );
        }
      }
    }
  }

  Future<String?> _showPinDialog(String title) async {
    TextEditingController pinController = TextEditingController();
    return await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          content: TextField(
            controller: pinController,
            obscureText: true,
            keyboardType: TextInputType.number,
            maxLength: 6,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Masukkan PIN",
              hintStyle: TextStyle(color: Colors.grey),
              counterText: "",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: const Text("Batal", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, pinController.text),
              child:
                  const Text("OK", style: TextStyle(color: Colors.greenAccent)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOptionCard({
    required Color color,
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    bool darkText = false,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: darkText ? Colors.black : Colors.white),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: darkText ? Colors.black : Colors.white,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: darkText ? Colors.black : Colors.white,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "AKSES\nKEAMANAN",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Langkah pertama untuk mengamankan dompetmu\ndi perangkat ini dan hanya kamu yang dapat akses",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 40),

            // Row opsi Face ID & PIN
            Row(
              children: [
                _buildOptionCard(
                  color: const Color(0xFFB3FFE6), // Mint hijau
                  icon: Icons.fingerprint,
                  title: "Fingerprint",
                  darkText: true,
                  onTap: _authenticateBiometric,
                ),
                const SizedBox(width: 16),
                _buildOptionCard(
                  color: const Color(0xFFFFAFAF), // Pink muda
                  icon: Icons.lock,
                  title: "Kustom Pin",
                  onTap: _setupPin,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
