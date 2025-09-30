import 'package:flutter/material.dart';

const Color customBlue = Color(0xFF0088FF); 
const Color successGreen = Colors.green; // Definisikan warna hijau

class EmailSupportScreen extends StatefulWidget {
  const EmailSupportScreen({super.key});

  @override
  State<EmailSupportScreen> createState() => _EmailSupportScreenState();
}

class _EmailSupportScreenState extends State<EmailSupportScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _sendEmail(BuildContext context) {
    if (_emailController.text.isEmpty || _messageController.text.isEmpty) {
      // Tampilkan notifikasi jika ada kolom yang kosong (Opsional)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua kolom harus diisi.')),
      );
      return;
    }

    // --- PERUBAHAN UTAMA DI SINI ---
    // Menggunakan pushReplacementNamed. Ini akan mengganti EmailSupportScreen
    // dengan SuccessScreen di stack navigasi.
    Navigator.pushReplacementNamed(
      context,
      '/success',
      arguments: 'Pesan dukungan telah terkirim. Kami akan merespon Anda segera.',
    );
    // Setelah ini, stack akan menjadi: [..., SettingsScreen, HelpCenterScreen, SuccessScreen]
  }

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kirim Email Dukungan', style: TextStyle(color: Colors.white)),
        backgroundColor: customBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Hubungi Kami via Email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),

            // Input Email Anda
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Anda',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16.0),

            // Input Pesan (Dibuat lebih tinggi)
            TextField(
              controller: _messageController,
              maxLines: 10, // Membuat kotak pesan lebih tinggi
              decoration: InputDecoration(
                labelText: 'Pesan',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 30.0),

            // Tombol Kirim Pesan
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _sendEmail(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: successGreen, // WARNA TOMBOL DIUBAH MENJADI HIJAU
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Kirim Pesan',
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}