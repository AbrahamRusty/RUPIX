import 'package:flutter/material.dart';

// Global ValueNotifier untuk dark mode
ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  HelpCenterScreenState createState() => HelpCenterScreenState();
}

class HelpCenterScreenState extends State<HelpCenterScreen> {
  // Data FAQ
  final List<Item> _data = [
    Item(
      headerValue: 'Akun & Registrasi',
      faqContent: [
        'Q: Bagaimana cara mendaftar akun RupiX?',
        'A: Download aplikasi RupiX, buka, dan pilih "Daftar". Isi detail pribadi Anda, verifikasi nomor telepon, dan atur PIN yang aman.',
        'Q: Mengapa saya perlu menyelesaikan verifikasi KYC?',
        'A: KYC (Know Your Customer) diperlukan oleh regulasi untuk memastikan keamanan akun Anda dan memungkinkan Anda menggunakan semua fitur RupiX (seperti top-up, transfer, dan penarikan).',
        'Q: Saya lupa PIN, apa yang harus dilakukan?',
        'A: Ketuk "Lupa PIN" di layar login, ikuti langkah verifikasi, dan buat PIN baru.',
      ],
    ),
    Item(
      headerValue: 'Transaksi & Pembayaran',
      faqContent: [
        'Q: Di mana saya bisa menggunakan RupiX untuk membayar?',
        'A: RupiX dapat digunakan untuk membayar di merchant online, toko offline, dan pembayaran tagihan (listrik, air, internet, dll.) yang terdaftar di aplikasi.',
        'Q: Bisakah saya transfer uang ke pengguna RupiX lain?',
        'A: Ya. Pergi ke "Transfer", masukkan nomor telepon atau ID RupiX penerima, input jumlah, dan konfirmasi dengan PIN Anda.',
        'Q: Apakah ada biaya transaksi?',
        'A: Transaksi dalam RupiX umumnya gratis. Beberapa layanan (misalnya transfer antar bank) mungkin dikenakan biaya kecil tergantung bank mitra.',
      ],
    ),
    Item(
      headerValue: 'Keamanan',
      faqContent: [
        'Q: Bagaimana cara menjaga keamanan akun saya?',
        'A: Jangan pernah berbagi PIN atau OTP dengan siapa pun, bahkan jika mereka mengaku dari RupiX. Selalu gunakan aplikasi resmi dan aktifkan fitur keamanan perangkat.',
        'Q: Apa yang harus saya lakukan jika mencurigai aktivitas tidak sah?',
        'A: Segera ubah PIN Anda dan hubungi Layanan Pelanggan RupiX untuk mengamankan akun Anda.',
      ],
    ),
    Item(
      headerValue: 'Promo & Hadiah',
      faqContent: [
        'Q: Bagaimana cara berpartisipasi dalam promo?',
        'A: Pantau pengumuman dalam aplikasi dan media sosial kami untuk program promo dan hadiah terbaru. Ikuti syarat dan ketentuan khusus untuk setiap promo.',
        'Q: Bagaimana cara menukar hadiah saya?',
        'A: Hadiah dapat ditukarkan melalui bagian "Hadiah" di aplikasi Anda. Ikuti instruksi untuk setiap jenis hadiah.',
      ],
    ),
  ];

  // Fungsi untuk mendapatkan warna berdasarkan dark mode
  Color _getBackgroundColor(bool isDark) => isDark ? Color(0xFF121212) : Color(0xFF121212);
  Color _getPrimaryColor(bool isDark) => isDark ? Colors.white : Colors.white;
  Color _getSecondaryColor(bool isDark) => isDark ? Colors.grey.shade400 : Colors.grey.shade400;
  Color _getCardColor(bool isDark) => isDark ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
  Color _getBorderColor(bool isDark) => isDark ? Colors.grey.shade800 : Colors.grey.shade800;
  final Color accentColor = Color.fromARGB(255, 0, 60, 144);
  final Color appBarColor = Color.fromARGB(255, 0, 60, 144);

  // Fungsi untuk menampilkan dialog pop-up FAQ
  void _showFaqDialog(
    BuildContext context,
    String title,
    List<String> content,
    bool isDarkMode,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        final dialogBackgroundColor = isDarkMode ? Color(0xFF1E1E1E) : Color(0xFF1E1E1E);
        final dialogTextColor = isDarkMode ? Colors.white : Colors.white;
        final dialogSecondaryColor = isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: dialogBackgroundColor,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: dialogTextColor,
              fontSize: 18,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content.map((text) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: text.startsWith('Q:') ? dialogTextColor : dialogSecondaryColor,
                      fontWeight: text.startsWith('Q:') ? FontWeight.w600 : FontWeight.normal,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Tutup',
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
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
                'Pusat Bantuan',
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
                            color: accentColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(
                            Icons.help_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Butuh Bantuan?',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Temukan jawaban untuk pertanyaan umum atau hubungi kami',
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

                  // FAQ Section
                  Text(
                    'Pertanyaan Umum',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Bagian FAQ
                  ..._data.map<Widget>((Item item) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: borderColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Icon(
                          Icons.help_outline,
                          color: accentColor,
                        ),
                        title: Text(
                          item.headerValue,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: secondaryColor,
                        ),
                        onTap: () {
                          _showFaqDialog(context, item.headerValue, item.faqContent, isDarkMode);
                        },
                      ),
                    );
                  }),

                  SizedBox(height: 32),

                  // Contact Section
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
                          'Hubungi Kami',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tim support kami siap membantu Anda 24/7',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),

                        // Email Support
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: accentColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.email, color: accentColor),
                            ),
                            title: Text(
                              'Email Support',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                            subtitle: Text(
                              'support@rupix-wallet.com',
                              style: TextStyle(color: secondaryColor),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: secondaryColor),
                            onTap: () {
                              Navigator.pushNamed(context, '/email_support');
                            },
                          ),
                        ),

                        SizedBox(height: 12),

                        // Chat Bot
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: accentColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.chat, color: accentColor),
                            ),
                            title: Text(
                              'Chat Bot AI',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                            subtitle: Text(
                              'Bantuan instan 24/7',
                              style: TextStyle(color: secondaryColor),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: secondaryColor),
                            onTap: () {
                              Navigator.pushNamed(context, '/chatbot');
                            },
                          ),
                        ),

                        SizedBox(height: 12),

                        // Phone Support
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor),
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: accentColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(Icons.phone, color: accentColor),
                            ),
                            title: Text(
                              'Call Center',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                            subtitle: Text(
                              '1500-123 (24 Jam)',
                              style: TextStyle(color: secondaryColor),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios, size: 16, color: secondaryColor),
                            onTap: () {
                              // TODO: Implement phone call
                            },
                          ),
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
}

// Kelas Item untuk menyimpan data FAQ
class Item {
  Item({
    required this.headerValue,
    required this.faqContent,
  });
  String headerValue;
  List<String> faqContent;
}