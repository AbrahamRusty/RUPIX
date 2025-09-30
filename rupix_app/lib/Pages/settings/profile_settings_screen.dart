// lib/screens/profile_settings_screen.dart (Versi Disederhanakan)
import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Detail'),
        backgroundColor: const Color(0xFF0088FF),
      ),
      body: const Center(
        child: Text('Detail Pengaturan Profil di sini', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}