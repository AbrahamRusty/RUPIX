import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Kebijakan Privasi',
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
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.privacy_tip,
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
                          'Kebijakan Privasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Terakhir diperbarui: 1 Desember 2024',
                          style: TextStyle(
                            fontSize: 12,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Introduction Section
            _buildSection(
              title: 'Pendahuluan',
              content: 'RupiX Wallet sangat menghargai dan melindungi privasi Anda. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, mengungkapkan, dan melindungi informasi pribadi Anda ketika Anda menggunakan aplikasi RupiX Wallet.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Information Collection Section
            _buildSection(
              title: 'Informasi yang Kami Kumpulkan',
              content: '',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _buildListItem(
                  'Informasi Pribadi: Nama, alamat email, nomor telepon, data KTP',
                  primaryColor,
                ),
                _buildListItem(
                  'Informasi Finansial: Data rekening bank, riwayat transaksi',
                  primaryColor,
                ),
                _buildListItem(
                  'Informasi Perangkat: Alamat IP, tipe perangkat, sistem operasi',
                  primaryColor,
                ),
                _buildListItem(
                  'Data Penggunaan: Log aktivitas, preferensi, perilaku penggunaan',
                  primaryColor,
                ),
              ],
            ),

            SizedBox(height: 20),

            // How We Use Information Section
            _buildSection(
              title: 'Penggunaan Informasi',
              content: 'Kami menggunakan informasi yang dikumpulkan untuk:',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _buildListItem(
                  'Menyediakan dan memelihara layanan RupiX Wallet',
                  primaryColor,
                ),
                _buildListItem(
                  'Memverifikasi identitas dan mencegah penipuan',
                  primaryColor,
                ),
                _buildListItem(
                  'Memproses transaksi dan pembayaran',
                  primaryColor,
                ),
                _buildListItem(
                  'Meningkatkan pengalaman pengguna dan mengembangkan fitur baru',
                  primaryColor,
                ),
                _buildListItem(
                  'Mengirim notifikasi penting dan pembaruan layanan',
                  primaryColor,
                ),
                _buildListItem(
                  'Memenuhi kewajiban hukum dan regulasi',
                  primaryColor,
                ),
              ],
            ),

            SizedBox(height: 20),

            // Data Sharing Section
            _buildSection(
              title: 'Berbagi Informasi',
              content: 'Kami tidak menjual informasi pribadi Anda. Informasi hanya dibagikan dengan:',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _buildListItem(
                  'Penyedia layanan yang membantu operasional kami',
                  primaryColor,
                ),
                _buildListItem(
                  'Lembaga keuangan dan mitra pembayaran',
                  primaryColor,
                ),
                _buildListItem(
                  'Otoritas hukum ketika diwajibkan oleh undang-undang',
                  primaryColor,
                ),
                _buildListItem(
                  'Pihak ketiga dengan persetujuan eksplisit dari Anda',
                  primaryColor,
                ),
              ],
            ),

            SizedBox(height: 20),

            // Data Security Section
            _buildSection(
              title: 'Keamanan Data',
              content: 'Kami menerapkan langkah-langkah keamanan teknis dan organisasi yang ketat untuk melindungi informasi pribadi Anda dari akses, pengungkapan, perubahan, atau penghancuran yang tidak sah.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Data Retention Section
            _buildSection(
              title: 'Penyimpanan Data',
              content: 'Kami menyimpan informasi pribadi Anda selama diperlukan untuk memenuhi tujuan yang diuraikan dalam kebijakan ini, atau sesuai dengan persyaratan hukum dan regulasi yang berlaku.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Your Rights Section
            _buildSection(
              title: 'Hak-Hak Anda',
              content: 'Anda memiliki hak untuk:',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
              children: [
                _buildListItem(
                  'Mengakses dan memperoleh salinan informasi pribadi Anda',
                  primaryColor,
                ),
                _buildListItem(
                  'Memperbaiki informasi pribadi yang tidak akurat',
                  primaryColor,
                ),
                _buildListItem(
                  'Menghapus informasi pribadi Anda dalam kondisi tertentu',
                  primaryColor,
                ),
                _buildListItem(
                  'Membatasi atau menolak pemrosesan informasi pribadi',
                  primaryColor,
                ),
                _buildListItem(
                  'Memindahkan data Anda ke penyedia layanan lain',
                  primaryColor,
                ),
              ],
            ),

            SizedBox(height: 20),

            // Cookies Section
            _buildSection(
              title: 'Cookies dan Teknologi Serupa',
              content: 'Kami menggunakan cookies dan teknologi pelacakan serupa untuk mengumpulkan informasi tentang aktivitas Anda di aplikasi, menganalisis tren, dan meningkatkan layanan.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Children Privacy Section
            _buildSection(
              title: 'Privasi Anak',
              content: 'Layanan kami tidak ditujukan untuk anak di bawah 18 tahun. Kami tidak secara sadar mengumpulkan informasi pribadi dari anak di bawah 18 tahun.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Changes to Policy Section
            _buildSection(
              title: 'Perubahan Kebijakan',
              content: 'Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Kami akan memberi tahu Anda tentang perubahan material melalui pemberitahuan di aplikasi atau melalui email.',
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
              cardColor: cardColor,
              borderColor: borderColor,
            ),

            SizedBox(height: 20),

            // Contact Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: accentColor.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kontak Kami',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Jika Anda memiliki pertanyaan tentang Kebijakan Privasi ini, silakan hubungi:',
                    style: TextStyle(
                      fontSize: 14,
                      color: secondaryColor,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 12),
                  _buildContactInfo(
                    'Email:',
                    'privacy@rupix-wallet.com',
                    primaryColor,
                    secondaryColor,
                  ),
                  _buildContactInfo(
                    'Telepon:',
                    '1500-123',
                    primaryColor,
                    secondaryColor,
                  ),
                  _buildContactInfo(
                    'Alamat:',
                    'Plaza RupiX, Jakarta Selatan',
                    primaryColor,
                    secondaryColor,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Compliance Badge
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified, color: Colors.green, size: 24),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Memenuhi regulasi OJK dan peraturan perlindungan data Indonesia',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
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
              fontSize: 18,
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
            SizedBox(height: 12),
            Column(children: children),
          ],
        ],
      ),
    );
  }

  Widget _buildListItem(String text, Color primaryColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.circle,
            size: 6,
            color: primaryColor,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: primaryColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(String label, String value, Color primaryColor, Color secondaryColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}