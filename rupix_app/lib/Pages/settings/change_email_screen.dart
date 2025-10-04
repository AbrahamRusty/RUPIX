import 'package:flutter/material.dart';

// Global ValueNotifier untuk dark mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);

const Color buttonRed = Colors.red;

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  ChangeEmailScreenState createState() => ChangeEmailScreenState();
}

class ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final _emailController = TextEditingController();
  final _confirmEmailController = TextEditingController();
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
    _emailController.dispose();
    _confirmEmailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_emailController.text.isEmpty || _confirmEmailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap isi semua field'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_emailController.text != _confirmEmailController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email tidak cocok'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      '/success',
      arguments: 'Email Berhasil Diubah!',
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
                'Ubah Email',
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
                            Icons.email_outlined,
                            size: 40,
                            color: accentColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Perbarui Email Anda',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
  'Masukkan alamat email baru dan konfirmasi untuk mengubah email akun Anda',
  style: TextStyle(
    color: secondaryColor,
    fontSize: 14,
  ),
  textAlign: TextAlign.center, // Pindah ke luar style dan perbaiki penulisan
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
                        // Email Baru
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Baru',
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
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: primaryColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: inputColor,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  prefixIcon: Icon(Icons.email_outlined, color: secondaryColor),
                                  hintText: 'email.baru@example.com',
                                  hintStyle: TextStyle(color: secondaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Konfirmasi Email
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Konfirmasi Email',
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
                                controller: _confirmEmailController,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: primaryColor),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: inputColor,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  prefixIcon: Icon(Icons.verified_user_outlined, color: secondaryColor),
                                  hintText: 'konfirmasi.email@example.com',
                                  hintStyle: TextStyle(color: secondaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),
                        Text(
                          'Pastikan kedua alamat email sama',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 12,
                          ),
                        ),

                        SizedBox(height: 24),

                        // Informasi Keamanan
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.blue.withOpacity(0.3)),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.security, color: Colors.blue, size: 20),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Kami akan mengirim email verifikasi ke alamat baru Anda',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24),

                        // Tombol Finish
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
                                Icon(Icons.check_circle_outline, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Perbarui Email',
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

                  // Tips Section
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
                          'Tips Keamanan:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildTipItem(
                          'Gunakan email aktif yang sering Anda periksa',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildTipItem(
                          'Pastikan email baru valid dan dapat diakses',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildTipItem(
                          'Periksa folder spam untuk email verifikasi',
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