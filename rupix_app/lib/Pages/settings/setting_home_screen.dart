import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Settings/change_email_screen.dart';
import 'package:rupix_app/Pages/Settings/change_password_screen.dart';
import 'package:rupix_app/Pages/Settings/change_username_screen.dart';
import 'package:rupix_app/Pages/Settings/help_center_screen.dart';
import 'package:rupix_app/Pages/Settings/privacy_policy_screen.dart';
//import 'package:rupix_app/Pages/Settings/theme_settings_screen.dart';
//import 'package:rupix_app/Pages/Settings/security_settings_screen.dart';
//import 'package:rupix_app/Pages/Settings/notification_settings_screen.dart';
///import 'package:rupix_app/Pages/Settings/language_settings_screen.dart';

class SettingsHomeScreen extends StatefulWidget {
  const SettingsHomeScreen({super.key});

  @override
  State<SettingsHomeScreen> createState() => _SettingsHomeScreenState();
}

class _SettingsHomeScreenState extends State<SettingsHomeScreen> {
  bool _isDarkMode = false;
  bool _biometricEnabled = false;
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _transactionAlerts = true;
  String _selectedLanguage = 'Bahasa Indonesia';

  // Data menu settings yang lebih lengkap
  final List<Map<String, dynamic>> _accountSettings = const [
    {
      'title': 'Ubah Email',
      'icon': Icons.email_outlined,
      'screen': ChangeEmailScreen(),
      'description': 'Ganti alamat email akun Anda'
    },
    {
      'title': 'Ubah Password',
      'icon': Icons.lock_outline,
      'screen': ChangePasswordScreen(),
      'description': 'Perbarui kata sandi keamanan'
    },
    {
      'title': 'Ubah Username',
      'icon': Icons.person_outline,
      'screen': ChangeUsernameScreen(),
      'description': 'Ubah nama pengguna Anda'
    },
  ];

  final List<Map<String, dynamic>> _appSettings = [
    {
      'title': 'Tema Aplikasi',
      'icon': Icons.dark_mode_outlined,
      //'screen': ThemeSettingsScreen(),
      'description': 'Light/Dark mode preferences'
    },
    {
      'title': 'Bahasa',
      'icon': Icons.language_outlined,
      //'screen': LanguageSettingsScreen(),
      'description': 'Pilih bahasa aplikasi'
    },
    {
      'title': 'Notifikasi',
      'icon': Icons.notifications_outlined,
      //'screen': NotificationSettingsScreen(),
      'description': 'Kelola pemberitahuan'
    },
  ];

  final List<Map<String, dynamic>> _securitySettings = [
    {
      'title': 'Keamanan',
      'icon': Icons.security_outlined,
      //'screen': SecuritySettingsScreen(),
      'description': 'Pengaturan keamanan akun'
    },
    {
      'title': 'Kebijakan Privasi',
      'icon': Icons.privacy_tip_outlined,
      'screen': PrivacyPolicyScreen(),
      'description': 'Baca kebijakan privasi kami'
    },
  ];

  final List<Map<String, dynamic>> _supportSettings = const [
    {
      'title': 'Pusat Bantuan',
      'icon': Icons.help_outline,
      'screen': HelpCenterScreen(),
      'description': 'Bantuan dan dukungan'
    },
    {
      'title': 'Chat Bot',
      'icon': Icons.chat_outlined,
      'screen': null, // Will be implemented
      'description': 'Bantuan AI 24/7'
    },
  ];

  void _navigateTo(BuildContext context, Widget? screen) {
    if (screen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Color definitions
    final backgroundColor = isDarkMode ? Color(0xFF121212) : Colors.white;
    final primaryColor = isDarkMode ? Colors.white : Colors.black;
    final secondaryColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600;
    final cardColor = isDarkMode ? Color(0xFF1E1E1E) : Color(0xFFF8F9FA);
    final accentColor = Color(0xFF8B2F8F);
    final borderColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Pengaturan',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Color(0xFF1E1E1E) : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shreya Jain',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'shreya.jcs@gmail.com',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green.withOpacity(0.3)),
                          ),
                          child: Text(
                            'Terverifikasi',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                    size: 20,
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Quick Settings Section
            Text(
              'Pengaturan Cepat',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  _buildQuickSettingItem(
                    'Mode Gelap',
                    'Sesuaikan tampilan aplikasi',
                    Icons.dark_mode_outlined,
                    _isDarkMode,
                    (value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                      // TODO: Implement theme change logic
                    },
                    primaryColor,
                    secondaryColor,
                  ),
                  Divider(color: borderColor),
                  _buildQuickSettingItem(
                    'Biometric Login',
                    'Gunakan sidik jari/wajah untuk login',
                    Icons.fingerprint,
                    _biometricEnabled,
                    (value) {
                      setState(() {
                        _biometricEnabled = value;
                      });
                      // TODO: Implement biometric logic
                    },
                    primaryColor,
                    secondaryColor,
                  ),
                  Divider(color: borderColor),
                  _buildQuickSettingItem(
                    'Notifikasi Transaksi',
                    'Dapatkan alert untuk setiap transaksi',
                    Icons.notifications_active_outlined,
                    _transactionAlerts,
                    (value) {
                      setState(() {
                        _transactionAlerts = value;
                      });
                      // TODO: Implement notification logic
                    },
                    primaryColor,
                    secondaryColor,
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Account Settings Section
            _buildSettingsSection(
              'Pengaturan Akun',
              _accountSettings,
              primaryColor,
              secondaryColor,
              cardColor,
              borderColor,
              accentColor,
            ),

            SizedBox(height: 20),

            // App Settings Section
            _buildSettingsSection(
              'Pengaturan Aplikasi',
              _appSettings,
              primaryColor,
              secondaryColor,
              cardColor,
              borderColor,
              accentColor,
            ),

            SizedBox(height: 20),

            // Security & Privacy Section
            _buildSettingsSection(
              'Keamanan & Privasi',
              _securitySettings,
              primaryColor,
              secondaryColor,
              cardColor,
              borderColor,
              accentColor,
            ),

            SizedBox(height: 20),

            // Support Section
            _buildSettingsSection(
              'Bantuan & Dukungan',
              _supportSettings,
              primaryColor,
              secondaryColor,
              cardColor,
              borderColor,
              accentColor,
            ),

            SizedBox(height: 30),

            // App Info & Version
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: borderColor),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.info_outline, color: secondaryColor),
                    title: Text(
                      'Tentang Aplikasi',
                      style: TextStyle(color: primaryColor),
                    ),
                    subtitle: Text(
                      'RupiX Wallet v1.0.0',
                      style: TextStyle(color: secondaryColor),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: secondaryColor),
                    onTap: () {
                      // Navigate to about page
                    },
                  ),
                  Divider(color: borderColor),
                  ListTile(
                    leading: Icon(Icons.update, color: secondaryColor),
                    title: Text(
                      'Periksa Pembaruan',
                      style: TextStyle(color: primaryColor),
                    ),
                    subtitle: Text(
                      'Versi terbaru tersedia',
                      style: TextStyle(color: Colors.green),
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Baru',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () {
                      // Check for updates
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Logout Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  foregroundColor: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.red.withOpacity(0.3)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  _showLogoutDialog(context, primaryColor, cardColor);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Keluar dari Akun',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSettingItem(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
    Color primaryColor,
    Color secondaryColor,
  ) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(title, style: TextStyle(color: primaryColor)),
      subtitle: Text(subtitle, style: TextStyle(color: secondaryColor, fontSize: 12)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Color(0xFF8B2F8F),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildSettingsSection(
    String title,
    List<Map<String, dynamic>> items,
    Color primaryColor,
    Color secondaryColor,
    Color cardColor,
    Color borderColor,
    Color accentColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            children: items.map((item) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon'] as IconData, color: accentColor),
                    title: Text(
                      item['title'] as String,
                      style: TextStyle(color: primaryColor),
                    ),
                    subtitle: Text(
                      item['description'] as String,
                      style: TextStyle(color: secondaryColor, fontSize: 12),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16, color: secondaryColor),
                    onTap: () {
                      _navigateTo(context, item['screen'] as Widget?);
                    },
                  ),
                  if (items.indexOf(item) < items.length - 1)
                    Divider(color: borderColor, height: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context, Color primaryColor, Color cardColor) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: cardColor,
        title: Text(
          'Keluar dari Akun?',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Anda akan logout dari akun RupiX Wallet. Pastikan Anda mengingat password untuk login kembali.',
          style: TextStyle(color: primaryColor.withOpacity(0.7)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Batal', style: TextStyle(color: primaryColor)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement logout logic
            },
            child: Text('Keluar'),
          ),
        ],
      ),
    );
  }
}