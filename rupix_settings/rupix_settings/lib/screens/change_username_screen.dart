import 'package:flutter/material.dart';

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
      Navigator.pushNamed(
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
        backgroundColor: Colors.purple[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            const Icon(Icons.person_outline, size: 80, color: Colors.purple),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Change Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
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
