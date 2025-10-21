import 'package:flutter/material.dart';
import 'import_slide4_loading.dart';

class ImportSlide3Password extends StatefulWidget {
  const ImportSlide3Password({super.key});

  @override
  State<ImportSlide3Password> createState() => _ImportSlide3PasswordState();
}

class _ImportSlide3PasswordState extends State<ImportSlide3Password> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Dummy password for this demo
  final String _dummyPassword = "password123";

  String? _passwordError;
  String? _confirmPasswordError;

  void _validateAndProceed() {
    setState(() {
      _passwordError = null;
      _confirmPasswordError = null;
    });

    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password.isEmpty) {
      setState(() {
        _passwordError = "Password tidak boleh kosong";
      });
      return;
    }

    if (password.length < 8) {
      setState(() {
        _passwordError = "Password minimal 8 karakter";
      });
      return;
    }

    if (confirmPassword.isEmpty) {
      setState(() {
        _confirmPasswordError = "Konfirmasi password tidak boleh kosong";
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _confirmPasswordError = "Password tidak cocok";
      });
      return;
    }

    // Use dummy password for demo purposes
    _passwordController.text = _dummyPassword;
    _confirmPasswordController.text = _dummyPassword;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImportSlide4Loading()),
    );
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Judul
            const Text(
              "Setup Password Baru",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              "Buat password baru untuk mengamankan dompet yang diimpor.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),

            const SizedBox(height: 40),

            // Field Password
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Buat Password Baru",
                labelStyle: const TextStyle(color: Colors.grey),
                errorText: _passwordError,
                errorStyle: const TextStyle(color: Colors.red),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB86EFF)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Field Konfirmasi Password
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Konfirmasi Password",
                labelStyle: const TextStyle(color: Colors.grey),
                errorText: _confirmPasswordError,
                errorStyle: const TextStyle(color: Colors.red),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFB86EFF)),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
            ),

            const Spacer(),

            // Tombol Lanjutkan
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB86EFF),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _validateAndProceed,
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
