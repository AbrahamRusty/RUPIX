import 'package:flutter/material.dart';
import 'recovery_slide5_process.dart';

class RecoverySlide4Security extends StatefulWidget {
  const RecoverySlide4Security({super.key});

  @override
  State<RecoverySlide4Security> createState() => _RecoverySlide4SecurityState();
}

class _RecoverySlide4SecurityState extends State<RecoverySlide4Security> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _enableBiometric = true;
  String? _passwordError;
  String? _confirmError;

  void _validatePasswords() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      if (password.length < 8) {
        _passwordError = 'Password minimal 8 karakter';
      } else {
        _passwordError = null;
      }

      if (confirmPassword.isNotEmpty && password != confirmPassword) {
        _confirmError = 'Password tidak cocok';
      } else {
        _confirmError = null;
      }
    });
  }

  bool get _isValid =>
      _passwordController.text.length >= 8 &&
      _passwordController.text == _confirmPasswordController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Title
            const Text(
              "Setup Keamanan Baru",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Buat password baru untuk mengamankan dompet Anda yang telah dipulihkan.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),

            const SizedBox(height: 40),

            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                labelText: "Password Baru",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorText: _passwordError,
                errorStyle: const TextStyle(color: Colors.redAccent),
              ),
              onChanged: (value) => _validatePasswords(),
            ),

            const SizedBox(height: 20),

            // Confirm Password Field
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                labelText: "Konfirmasi Password",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorText: _confirmError,
                errorStyle: const TextStyle(color: Colors.redAccent),
              ),
              onChanged: (value) => _validatePasswords(),
            ),

            const SizedBox(height: 30),

            // Biometric Option
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.fingerprint,
                    color: Color(0xFFB86EFF),
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Aktifkan Biometric",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Gunakan fingerprint untuk akses cepat",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _enableBiometric,
                    onChanged: (value) {
                      setState(() {
                        _enableBiometric = value;
                      });
                    },
                    activeColor: const Color(0xFFB86EFF),
                    activeTrackColor: const Color(0xFFB86EFF).withOpacity(0.3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Lanjutkan Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isValid
                      ? const Color(0xFFB86EFF)
                      : Colors.grey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _isValid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecoverySlide5Process(),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  "Lanjutkan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
