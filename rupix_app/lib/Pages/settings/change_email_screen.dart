import 'package:flutter/material.dart';

// Definisikan warna biru kustom sekali
const Color customBlue = Color(0xFF0088FF); 
// Definisikan warna merah untuk tombol
const Color buttonRed = Colors.red;

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  ChangeEmailScreenState createState() => ChangeEmailScreenState();
}

class ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_emailController.text.isNotEmpty) {
      // --- PERUBAHAN UTAMA DI SINI ---
      // Kita menggunakan pushReplacementNamed agar ChangeEmailScreen DIHAPUS 
      // dari stack navigasi sebelum SuccessScreen ditambahkan.
      // Jadi, ketika tombol back ditekan dari SuccessScreen, ia akan kembali
      // ke SettingsHomeScreen (rute yang ada di bawah ChangeEmailScreen).
      
      Navigator.pushReplacementNamed(
        context,
        '/success',
        arguments: 'Email Berhasil Diubah!',
      );

      // Catatan: Opsi lain yang lebih aman adalah:
      /*
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/success', 
        (route) => route.settings.name == '/settings', // Hapus semua rute sampai kembali ke rute SettingsHomeScreen
        arguments: 'Email Berhasil Diubah!',
      );
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Email'),
        backgroundColor: customBlue, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            const Icon(Icons.email_outlined, size: 80, color: customBlue),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'New Email Address', // Ubah label agar lebih jelas
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'confirm new email',
              style: TextStyle(color: customBlue),
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