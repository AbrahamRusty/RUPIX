import 'package:flutter/material.dart';

// Definisikan warna biru kustom sekali
const Color customBlue = Color(0xFF0088FF); 
// Definisikan warna merah untuk tombol
const Color buttonRed = Colors.red;

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Memastikan kedua password cocok dan tidak kosong
    if (_passwordController.text == _confirmPasswordController.text &&
        _passwordController.text.isNotEmpty) {
      
      // --- PERUBAHAN UTAMA DI SINI ---
      // Menggunakan pushReplacementNamed:
      // Menghapus ChangePasswordScreen dari stack navigasi dan menggantinya 
      // dengan SuccessScreen. Saat tombol 'back' ditekan dari SuccessScreen,
      // akan kembali ke SettingsHomeScreen (rute di bawahnya).
      Navigator.pushReplacementNamed(
        context,
        '/success',
        arguments: 'Password Berhasil Diubah!', // Pesan sukses yang dikirim ke SuccessScreen
      );

    } else {
      // Tampilkan SnackBar jika password tidak cocok
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password tidak cocok')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: customBlue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.lock_open, 
              size: 80, 
              color: customBlue
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password', // Ubah label agar lebih jelas
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm New Password', // Ubah label agar lebih jelas
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonRed, 
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Finish',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}