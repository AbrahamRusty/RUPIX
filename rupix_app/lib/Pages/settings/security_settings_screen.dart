import 'package:flutter/material.dart';

// Global ValueNotifier untuk dark mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);

class SecuritySettingsScreen extends StatefulWidget {
  const SecuritySettingsScreen({super.key});

  @override
  State<SecuritySettingsScreen> createState() => _SecuritySettingsScreenState();
}

class _SecuritySettingsScreenState extends State<SecuritySettingsScreen> {
  bool _biometricEnabled = true;
  bool _twoFactorAuth = false;
  bool _loginAlerts = true;
  bool _transactionConfirmation = true;
  bool _deviceManagement = true;
  bool _suspiciousActivityAlerts = true;
  bool _autoLogout = true;

  final Color appBarColor = Color.fromARGB(255, 0, 60, 144);
  final Color accentColor = Color.fromARGB(255, 0, 60, 144);

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

  void _enableAllSecurityFeatures() {
    setState(() {
      _biometricEnabled = true;
      _twoFactorAuth = true;
      _loginAlerts = true;
      _transactionConfirmation = true;
      _deviceManagement = true;
      _suspiciousActivityAlerts = true;
      _autoLogout = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Semua fitur keamanan diaktifkan'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
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

        return Theme(
          data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              title: Text(
                'Pengaturan Keamanan',
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
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(
                            Icons.security,
                            color: Colors.green,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status Keamanan: AMAN',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Akun Anda terlindungi dengan fitur keamanan terbaik',
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

                  // Security Score
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blue.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.assessment_outlined,
                          color: Colors.blue,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Skor Keamanan: 85/100',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              LinearProgressIndicator(
                                value: 0.85,
                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        OutlinedButton(
                          onPressed: _enableAllSecurityFeatures,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.blue,
                            side: BorderSide(color: Colors.blue),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Tingkatkan'),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Authentication Section
                  Text(
                    'Autentikasi',
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
                      children: [
                        _buildSecuritySetting(
                          'Login Biometrik',
                          'Gunakan sidik jari/wajah untuk login',
                          Icons.fingerprint,
                          _biometricEnabled,
                          (value) => setState(() => _biometricEnabled = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildSecuritySetting(
                          'Two-Factor Authentication',
                          'Verifikasi 2 langkah untuk keamanan ekstra',
                          Icons.verified_user_outlined,
                          _twoFactorAuth,
                          (value) => setState(() => _twoFactorAuth = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildSecuritySetting(
                          'Auto Logout',
                          'Keluar otomatis setelah 15 menit tidak aktif',
                          Icons.timer_outlined,
                          _autoLogout,
                          (value) => setState(() => _autoLogout = value),
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Alerts & Monitoring
                  Text(
                    'Monitoring & Alert',
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
                      children: [
                        _buildSecuritySetting(
                          'Alert Login Baru',
                          'Notifikasi saat ada login dari perangkat baru',
                          Icons.login_outlined,
                          _loginAlerts,
                          (value) => setState(() => _loginAlerts = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildSecuritySetting(
                          'Alert Aktivitas Mencurigakan',
                          'Peringatan untuk aktivitas tidak biasa',
                          Icons.warning_outlined,
                          _suspiciousActivityAlerts,
                          (value) =>
                              setState(() => _suspiciousActivityAlerts = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildSecuritySetting(
                          'Konfirmasi Transaksi',
                          'Verifikasi PIN untuk setiap transaksi',
                          Icons.account_balance_wallet_outlined,
                          _transactionConfirmation,
                          (value) =>
                              setState(() => _transactionConfirmation = value),
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Device Management
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
                        Row(
                          children: [
                            Icon(
                              Icons.devices_outlined,
                              color: accentColor,
                              size: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'Manajemen Perangkat',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Kelola perangkat yang terhubung dengan akun Anda',
                          style: TextStyle(color: secondaryColor, fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Membuka manajemen perangkat',
                                      ),
                                      backgroundColor: Colors.blue,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: accentColor,
                                  side: BorderSide(color: accentColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: Text('Lihat Perangkat Terhubung'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Security Actions
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
                          'Aksi Keamanan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 16),
                        _buildSecurityAction(
                          'Ubah PIN',
                          'Perbarui PIN keamanan Anda',
                          Icons.lock_reset_outlined,
                          primaryColor,
                          secondaryColor,
                        ),
                        SizedBox(height: 12),
                        _buildSecurityAction(
                          'Riwayat Keamanan',
                          'Lihat aktivitas keamanan akun',
                          Icons.history_outlined,
                          primaryColor,
                          secondaryColor,
                        ),
                        SizedBox(height: 12),
                        _buildSecurityAction(
                          'Sesi Aktif',
                          'Kelola sesi login yang aktif',
                          Icons.computer_outlined,
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Security Tips
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
                          'Jangan bagikan PIN atau OTP kepada siapapun',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildTipItem(
                          'Gunakan PIN yang kuat dan unik',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildTipItem(
                          'Selalu logout dari perangkat bersama',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildTipItem(
                          'Periksa riwayat transaksi secara berkala',
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSecuritySetting(
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
      title: Text(
        title,
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: secondaryColor, fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.green,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildSecurityAction(
    String title,
    String subtitle,
    IconData icon,
    Color primaryColor,
    Color secondaryColor,
  ) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: accentColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: secondaryColor, fontSize: 12),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: secondaryColor),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Membuka: $title'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 2),
          ),
        );
      },
    );
  }

  Widget _buildTipItem(String text, Color primaryColor, Color secondaryColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.security, size: 14, color: Colors.green),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: secondaryColor, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
