import 'package:flutter/material.dart';

const Color buttonRed = Color(0xFFE53935);

class ChangeUsernameScreen extends StatefulWidget {
  const ChangeUsernameScreen({super.key});

  @override
  ChangeUsernameScreenState createState() => ChangeUsernameScreenState();
}

class ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_usernameController.text.isNotEmpty) {
      // --- PERUBAHAN DI SINI ---
      // Menggunakan pushReplacementNamed untuk menghapus ChangeUsernameScreen
      // dari stack navigasi dan menggantinya dengan SuccessScreen.
      Navigator.pushReplacementNamed(
        context,
        '/success',
        arguments: 'Username Berhasil Diubah!',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Username'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            const Icon(Icons.person_outline, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'New Username', // Ubah label agar lebih jelas
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