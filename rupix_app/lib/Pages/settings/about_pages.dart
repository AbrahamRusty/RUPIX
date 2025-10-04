import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    // Color definitions
    final backgroundColor = isDarkMode ? Color(0xFF121212) : Color(0xFF121212);
    final primaryColor = isDarkMode ? Colors.white : Colors.white;
    final secondaryColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400;
    final cardColor = isDarkMode ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
    final accentColor = Color.fromARGB(255, 0, 60, 144);
    final borderColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade800;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Tentang Aplikasi',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
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
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: accentColor.withOpacity(0.3),
                            blurRadius: 15,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.wallet_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'RupiX Wallet',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'All-in-One Crypto & Rupiah Wallet',
                      style: TextStyle(
                        fontSize: 16,
                        color: accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Versi 1.0.0',
                      style: TextStyle(
                        fontSize: 14,
                        color: secondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),

            // Description Section
            _buildSection(
              title: 'Tentang RupiX Wallet',
              content: 'RupiX Wallet adalah platform dompet digital revolusioner yang menggabungkan kemudahan transaksi Rupiah dengan kekuatan teknologi Crypto dalam satu aplikasi. Nikmati pengelolaan keuangan yang terintegrasi dan aman untuk kebutuhan finansial modern Anda.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Features Section
            _buildSection(
              title: 'Fitur Utama',
              content: '',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _buildFeatureItem(
                  'Dompet Rupiah & Crypto',
                  'Kelola mata uang tradisional dan digital dalam satu platform',
                  Icons.currency_exchange,
                  accentColor,
                  primaryColor,
                  secondaryColor,
                ),
                _buildFeatureItem(
                  'Trading Crypto',
                  'Beli, jual, dan trade berbagai aset crypto dengan mudah',
                  Icons.trending_up,
                  accentColor,
                  primaryColor,
                  secondaryColor,
                ),
                _buildFeatureItem(
                  'Transfer Instan',
                  'Kirim uang Rupiah dan Crypto dengan cepat dan aman',
                  Icons.send_to_mobile,
                  accentColor,
                  primaryColor,
                  secondaryColor,
                ),
                _buildFeatureItem(
                  'Top Up Dompet Digital',
                  'Isi ulang OVO, GoPay, Dana, dan dompet digital lainnya',
                  Icons.phone_android,
                  accentColor,
                  primaryColor,
                  secondaryColor,
                ),
                _buildFeatureItem(
                  'Pembayaran & Tagihan',
                  'Bayar tagihan, belanja, dan transaksi sehari-hari',
                  Icons.receipt_long,
                  accentColor,
                  primaryColor,
                  secondaryColor,
                ),
                _buildFeatureItem(
                  'Keamanan Multi-Layer',
                  'Proteksi dana dengan teknologi keamanan terdepan',
                  Icons.security,
                  accentColor,
                  primaryColor,
                  secondaryColor,
                ),
              ],
            ),

            SizedBox(height: 20),

            // Vision Section
            _buildSection(
              title: 'Visi Kami',
              content: 'Menjadi platform keuangan digital terdepan yang menghubungkan ekosistem Rupiah dan Crypto, memberikan akses keuangan yang inklusif, aman, dan mudah bagi semua orang di Indonesia.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Technology Section
            _buildSection(
              title: 'Teknologi Canggih',
              content: 'Dibangun dengan blockchain technology dan sistem keamanan bank-grade untuk memastikan setiap transaksi Anda terlindungi dengan standar tertinggi.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Contact Section
            _buildSection(
              title: 'Kontak & Dukungan',
              content: 'Tim support kami siap membantu Anda 24/7',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _buildContactItem(
                  'Email Support',
                  'support@rupix-wallet.com',
                  Icons.email,
                  primaryColor,
                  secondaryColor,
                ),
                _buildContactItem(
                  'Call Center',
                  '1500-123 (24 Jam)',
                  Icons.phone,
                  primaryColor,
                  secondaryColor,
                ),
                _buildContactItem(
                  'Website',
                  'www.rupix-wallet.com',
                  Icons.language,
                  primaryColor,
                  secondaryColor,
                ),
                _buildContactItem(
                  'Office',
                  'Plaza RupiX, Jakarta Selatan',
                  Icons.location_on,
                  primaryColor,
                  secondaryColor,
                ),
              ],
            ),

            SizedBox(height: 24),

            // Security Badge
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: accentColor.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified_user, color: accentColor, size: 24),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Terdaftar dan Diawasi oleh Otoritas Jasa Keuangan',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Copyright
            Center(
              child: Column(
                children: [
                  Text(
                    '© 2024 RupiX Wallet Indonesia',
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'All Rights Reserved',
                    style: TextStyle(
                      fontSize: 11,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required Color primaryColor,
    required Color secondaryColor,
    required Color cardColor,
    required Color borderColor,
    List<Widget> children = const [],
  }) {
    return Container(
      width: double.infinity,
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
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          if (content.isNotEmpty) ...[
            SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(
                fontSize: 14,
                color: secondaryColor,
                height: 1.6,
              ),
            ),
          ],
          if (children.isNotEmpty) ...[
            SizedBox(height: 16),
            Column(children: children),
          ],
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    String title,
    String description,
    IconData icon,
    Color iconColor,
    Color primaryColor,
    Color secondaryColor,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: secondaryColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    String title,
    String value,
    IconData icon,
    Color primaryColor,
    Color secondaryColor,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: primaryColor, size: 18),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    color: secondaryColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}