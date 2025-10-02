import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'About Screen - Navigation Berhasil!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}