import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Settings/change_email_screen.dart';
import 'package:rupix_app/Pages/Settings/change_password_screen.dart';
import 'package:rupix_app/Pages/Settings/change_username_screen.dart';
import 'package:rupix_app/Pages/Settings/help_center_screen.dart';
import 'package:rupix_app/Pages/Settings/privacy_policy_screen.dart';

const Color customBlue = Color(0xFF3C8DFF);
const Color buttonRed = Colors.red;

class SettingsHomeScreen extends StatelessWidget {
  const SettingsHomeScreen({super.key}); // TANPA PARAMETER onMenuTap

  // Data menu settings dengan navigasi langsung ke screen
  final List<Map<String, dynamic>> menuItems = const [
    {
      'title': 'Change Email', 
      'icon': Icons.email, 
      'screen': ChangeEmailScreen()
    },
    {
      'title': 'Change Password',
      'icon': Icons.lock,
      'screen': ChangePasswordScreen()
    },
    {
      'title': 'Change Username',
      'icon': Icons.person,
      'screen': ChangeUsernameScreen()
    },
    {
      'title': 'Privacy Policy',
      'icon': Icons.privacy_tip,
      'screen': PrivacyPolicyScreen()
    },
    {
      'title': 'Help Center', 
      'icon': Icons.help, 
      'screen': HelpCenterScreen()
    },
  ];

  // Fungsi navigasi yang benar
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: customBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Profile
            Container(
              padding: const EdgeInsets.all(20),
              color: customBlue,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: customBlue,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Shreya',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'shreya.jcs@gmail.com',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Profile Setting Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: customBlue,
                    size: 24,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'Profile Setting',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Settings Menu List
            ...menuItems.map((item) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon'] as IconData, color: customBlue),
                    title: Text(item['title'] as String),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      _navigateTo(context, item['screen'] as Widget);
                    },
                  ),
                  const Divider(height: 1),
                ],
              );
            }),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}