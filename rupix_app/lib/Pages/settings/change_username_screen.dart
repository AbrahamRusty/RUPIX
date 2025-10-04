import 'package:flutter/material.dart';

// Global ValueNotifier untuk dark mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);

const Color buttonRed = Color(0xFFE53935);

class ChangeUsernameScreen extends StatefulWidget {
  const ChangeUsernameScreen({super.key});

  @override
  ChangeUsernameScreenState createState() => ChangeUsernameScreenState();
}

class ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
  final _usernameController = TextEditingController();
  final Color appBarColor = Color.fromARGB(255, 0, 60, 144);
  final Color accentColor = Color.fromARGB(255, 0, 60, 144);

  // Fungsi untuk mendapatkan warna berdasarkan dark mode
  Color _getBackgroundColor(bool isDark) => isDark ? Color(0xFF121212) : Color(0xFF121212);
  Color _getPrimaryColor(bool isDark) => isDark ? Colors.white : Colors.white;
  Color _getSecondaryColor(bool isDark) => isDark ? Colors.grey.shade400 : Colors.grey.shade400;
  Color _getCardColor(bool isDark) => isDark ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
  Color _getBorderColor(bool isDark) => isDark ? Colors.grey.shade800 : Colors.grey.shade800;
  Color _getInputColor(bool isDark) => isDark ? Color(0xFF2D2D2D) : Color(0xFF2D2D2D);

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_usernameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap isi username baru'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_usernameController.text.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username minimal 3 karakter'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      '/success',
      arguments: 'Username Berhasil Diubah!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        // Color definitions berdasarkan dark mode
        final backgroundColor = _getBackgroundColor(isDarkMode);
        final primaryColor = _getPrimaryColor(isDarkMode);
        final secondaryColor = _getSecondaryColor(isDarkMode);
        final cardColor = _getCardColor(isDarkMode);
        final borderColor = _getBorderColor(isDarkMode);
        final inputColor = _getInputColor(isDarkMode);

        return Theme(
          data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: Text(
                'Ubah Username',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: appBarColor,
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  // Header Section
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Icon(
                            Icons.person_outline,
                            size: 40,
                            color: Color.fromARGB(255, 0, 60, 144),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Perbarui Username Anda',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Pilih username baru yang unik dan mudah diingat',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Form Section
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      children: [
                        // Username Baru
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username Baru',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: borderColor),
                              ),
                              child: TextField(
                                controller: _usernameController,
                                style: TextStyle(color: primaryColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: inputColor,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  prefixIcon: Icon(Icons.person_outline, color: secondaryColor),
                                  hintText: 'Masukkan username baru',
                                  hintStyle: TextStyle(color: secondaryColor),
                                  suffixIcon: _usernameController.text.isNotEmpty
                                      ? IconButton(
                                          icon: Icon(Icons.clear, color: secondaryColor, size: 20),
                                          onPressed: () {
                                            setState(() {
                                              _usernameController.clear();
                                            });
                                          },
                                        )
                                      : null,
                                ),
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),
                        Text(
                          'Username akan digunakan untuk login dan identitas Anda',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 12,
                          ),
                        ),

                        SizedBox(height: 24),

                        // Persyaratan Username
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.blue.withOpacity(0.3)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.info_outline, color: Colors.blue, size: 20),
                                  SizedBox(width: 8),
                                  Text(
                                    'Persyaratan Username:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              _buildRequirementItem(
                                'Minimal 3 karakter',
                                _usernameController.text.length >= 3,
                                primaryColor,
                              ),
                              _buildRequirementItem(
                                'Maksimal 20 karakter',
                                _usernameController.text.length <= 20,
                                primaryColor,
                              ),
                              _buildRequirementItem(
                                'Hanya huruf, angka, dan underscore',
                                _isValidUsername(_usernameController.text),
                                primaryColor,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Preview Username
                        if (_usernameController.text.isNotEmpty)
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green.withOpacity(0.3)),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.visibility, color: Colors.green, size: 20),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Preview:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: primaryColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        _usernameController.text,
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        SizedBox(height: 24),

                        // Tombol Perbarui
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.person, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Perbarui Username',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        // Tombol Batal
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              foregroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Batal',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Tips Username
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tips Memilih Username:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildTipItem(
                          'Pilih username yang unik dan mudah diingat',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildTipItem(
                          'Hindari menggunakan informasi pribadi sensitif',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildTipItem(
                          'Username tidak dapat diubah dalam 30 hari',
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isValidUsername(String text) {
    if (text.isEmpty) return true;
    return RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(text);
  }

  Widget _buildRequirementItem(String text, bool isMet, Color primaryColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.circle,
            size: 16,
            color: isMet ? Colors.green : Colors.grey,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: isMet ? Colors.green : primaryColor,
              fontSize: 12,
              fontWeight: isMet ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text, Color primaryColor, Color secondaryColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 6,
            color: secondaryColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: secondaryColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}