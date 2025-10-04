  import 'package:flutter/material.dart';

// Global ValueNotifier untuk dark mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _transactionAlerts = true;
  bool _promoNotifications = true;
  bool _securityAlerts = true;
  bool _priceAlerts = false;
  bool _newsUpdates = false;
  bool _vibration = true;
  bool _sound = true;
  
  final Color appBarColor = Color.fromARGB(255, 0, 60, 144);
  final Color accentColor = Color.fromARGB(255, 0, 60, 144);

  // Fungsi untuk mendapatkan warna berdasarkan dark mode
  Color _getBackgroundColor(bool isDark) => isDark ? Color(0xFF121212) : Color(0xFF121212);
  Color _getPrimaryColor(bool isDark) => isDark ? Colors.white : Colors.white;
  Color _getSecondaryColor(bool isDark) => isDark ? Colors.grey.shade400 : Colors.grey.shade400;
  Color _getCardColor(bool isDark) => isDark ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
  Color _getBorderColor(bool isDark) => isDark ? Colors.grey.shade800 : Colors.grey.shade800;

  void _toggleAllNotifications(bool value) {
    setState(() {
      _pushNotifications = value;
      _emailNotifications = value;
      _transactionAlerts = value;
      _promoNotifications = value;
      _securityAlerts = value;
      _priceAlerts = value;
      _newsUpdates = value;
    });
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
                'Pengaturan Notifikasi',
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
                            color: accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(
                            Icons.notifications_active_outlined,
                            color: accentColor,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kelola Notifikasi',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Atur preferensi notifikasi untuk aplikasi RupiX',
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

                  // Quick Actions
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _toggleAllNotifications(true),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.green,
                            side: BorderSide(color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text('Aktifkan Semua'),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _toggleAllNotifications(false),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text('Matikan Semua'),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Notification Types Section
                  Text(
                    'Jenis Notifikasi',
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
                        _buildNotificationSetting(
                          'Notifikasi Push',
                          'Terima notifikasi langsung di perangkat',
                          Icons.notifications,
                          _pushNotifications,
                          (value) => setState(() => _pushNotifications = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildNotificationSetting(
                          'Notifikasi Email',
                          'Kirim notifikasi ke email Anda',
                          Icons.email_outlined,
                          _emailNotifications,
                          (value) => setState(() => _emailNotifications = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildNotificationSetting(
                          'Alert Transaksi',
                          'Notifikasi untuk setiap transaksi',
                          Icons.account_balance_wallet,
                          _transactionAlerts,
                          (value) => setState(() => _transactionAlerts = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildNotificationSetting(
                          'Notifikasi Promo',
                          'Info promo dan penawaran khusus',
                          Icons.local_offer_outlined,
                          _promoNotifications,
                          (value) => setState(() => _promoNotifications = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildNotificationSetting(
                          'Alert Keamanan',
                          'Peringatan keamanan akun',
                          Icons.security_outlined,
                          _securityAlerts,
                          (value) => setState(() => _securityAlerts = value),
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Market & News Section
                  Text(
                    'Market & Berita',
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
                        _buildNotificationSetting(
                          'Alert Harga Crypto',
                          'Notifikasi perubahan harga crypto',
                          Icons.trending_up_outlined,
                          _priceAlerts,
                          (value) => setState(() => _priceAlerts = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildNotificationSetting(
                          'Update Berita',
                          'Berita terbaru seputar crypto & finansial',
                          Icons.newspaper_outlined,
                          _newsUpdates,
                          (value) => setState(() => _newsUpdates = value),
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Notification Preferences Section
                  Text(
                    'Preferensi Notifikasi',
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
                        _buildNotificationSetting(
                          'Getar',
                          'Aktifkan getar untuk notifikasi',
                          Icons.vibration,
                          _vibration,
                          (value) => setState(() => _vibration = value),
                          primaryColor,
                          secondaryColor,
                        ),
                        Divider(height: 1, color: borderColor, indent: 16),
                        _buildNotificationSetting(
                          'Suara',
                          'Putar suara untuk notifikasi',
                          Icons.volume_up_outlined,
                          _sound,
                          (value) => setState(() => _sound = value),
                          primaryColor,
                          secondaryColor,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Quiet Hours Section
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
                            Icon(Icons.nightlight_outlined, color: accentColor, size: 20),
                            SizedBox(width: 12),
                            Text(
                              'Jam Tenang',
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
                          'Nonaktifkan notifikasi selama jam tertentu untuk tidak mengganggu',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Fitur Jam Tenang akan segera hadir'),
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
                                child: Text('Atur Jam Tenang'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // Information Section
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
                          'Informasi:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        _buildInfoItem(
                          'Beberapa notifikasi penting akan tetap dikirim untuk keamanan',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildInfoItem(
                          'Pengaturan dapat diubah kapan saja',
                          primaryColor,
                          secondaryColor,
                        ),
                        _buildInfoItem(
                          'Notifikasi transaksi penting selalu aktif untuk keamanan',
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

  Widget _buildNotificationSetting(
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
      title: Text(title, style: TextStyle(color: primaryColor, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: TextStyle(color: secondaryColor, fontSize: 12)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: accentColor,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildInfoItem(String text, Color primaryColor, Color secondaryColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
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