import 'package:flutter/material.dart';

// Global ValueNotifier untuk dark mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);

const Color successGreen = Colors.green;

class EmailSupportScreen extends StatefulWidget {
  const EmailSupportScreen({super.key});

  @override
  State<EmailSupportScreen> createState() => _EmailSupportScreenState();
}

class _EmailSupportScreenState extends State<EmailSupportScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final Color appBarColor = Color.fromARGB(255, 0, 60, 144);

  // Fungsi untuk mendapatkan warna berdasarkan dark mode
  Color _getBackgroundColor(bool isDark) =>
      isDark ? Color(0xFF121212) : Color(0xFF121212);
  Color _getPrimaryColor(bool isDark) => isDark ? Colors.white : Colors.white;
  Color _getSecondaryColor(bool isDark) =>
      isDark ? Colors.grey.shade400 : Colors.grey.shade400;
  Color _getCardColor(bool isDark) =>
      isDark ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
  Color _getBorderColor(bool isDark) =>
      isDark ? Colors.grey.shade800 : Colors.grey.shade800;
  Color _getInputColor(bool isDark) =>
      isDark ? Color(0xFF2D2D2D) : Color(0xFF2D2D2D);

  void _sendEmail(BuildContext context) {
    if (_emailController.text.isEmpty || _messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Semua kolom harus diisi.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      '/success',
      arguments:
          'Pesan dukungan telah terkirim. Kami akan merespon Anda segera.',
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
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
                'Kirim Email Dukungan',
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header Section
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
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: successGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(
                            Icons.email,
                            color: successGreen,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email Support',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Tim support kami akan merespon dalam 1x24 jam',
                                style: TextStyle(
                                  color: secondaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Formulir Dukungan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Isi form di bawah ini untuk mengirim pesan ke tim support',
                          style: TextStyle(color: secondaryColor, fontSize: 14),
                        ),
                        SizedBox(height: 20),

                        // Input Email
                        Text(
                          'Email Anda',
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
                              prefixIcon: Icon(
                                Icons.email,
                                color: secondaryColor,
                              ),
                              hintText: 'nama@email.com',
                              hintStyle: TextStyle(color: secondaryColor),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        // Input Pesan
                        Text(
                          'Pesan Dukungan',
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
                            controller: _messageController,
                            maxLines: 8,
                            style: TextStyle(color: primaryColor),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: inputColor,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              alignLabelWithHint: true,
                              hintText:
                                  'Jelaskan masalah atau pertanyaan Anda secara detail...',
                              hintStyle: TextStyle(color: secondaryColor),
                            ),
                          ),
                        ),

                        SizedBox(height: 8),
                        Text(
                          'Jelaskan masalah Anda dengan detail untuk membantu kami memberikan solusi yang tepat',
                          style: TextStyle(color: secondaryColor, fontSize: 12),
                        ),

                        SizedBox(height: 30),

                        // Tombol Kirim
                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: () => _sendEmail(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: successGreen,
                              foregroundColor: Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.send, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Kirim Pesan',
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

                        // Info Tambahan
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: successGreen.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: successGreen.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: successGreen,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Tim support akan merespon ke email Anda dalam 1x24 jam pada hari kerja',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Contact Info
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Kontak',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 12),
                        _buildContactInfo(
                          'Email Support',
                          'support@rupix-wallet.com',
                          Icons.email,
                          primaryColor,
                          secondaryColor,
                        ),
                        SizedBox(height: 8),
                        _buildContactInfo(
                          'Call Center',
                          '1500-123 (24 Jam)',
                          Icons.phone,
                          primaryColor,
                          secondaryColor,
                        ),
                        SizedBox(height: 8),
                        _buildContactInfo(
                          'Jam Operasional',
                          'Senin - Minggu, 08:00 - 22:00 WIB',
                          Icons.access_time,
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactInfo(
    String title,
    String value,
    IconData icon,
    Color primaryColor,
    Color secondaryColor,
  ) {
    return Row(
      children: [
        Icon(icon, color: secondaryColor, size: 18),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12, color: secondaryColor),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
