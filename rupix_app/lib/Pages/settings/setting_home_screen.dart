// lib/screens/settings_home_screen.dart

import 'package:flutter/material.dart';
// Asumsi path ini benar, jika tidak, ganti dengan path yang sesuai
import 'package:rupix_app/widgets/logout_dialog.dart'; 

const Color customBlue = Color(0xFF3C8DFF); // Menggunakan warna biru dari WalletHomePage
const Color buttonRed = Colors.red;

class SettingsHomeScreen extends StatelessWidget {
  // Tambahkan VoidCallback untuk menangani klik tombol Hamburger
  final VoidCallback onMenuTap; 

  // Inisialisasi di constructor
  const SettingsHomeScreen({super.key, required this.onMenuTap});

// Data menu settings (dibiarkan tetap sama)
  final List<Map<String, dynamic>> menuItems = const [
    {'title': 'Change Email', 'icon': Icons.email, 'route': '/change_email'},
    {'title': 'Change Password', 'icon': Icons.lock, 'route': '/change_password'},
    {'title': 'Change Username', 'icon': Icons.person, 'route': '/change_username'},
    {'title': 'Privacy Policy', 'icon': Icons.privacy_tip, 'route': '/privacy_policy'},
    {'title': 'Help Center', 'icon': Icons.help, 'route': '/help_center'},
    {'title': 'About', 'icon': Icons.info, 'route': '/about'},
  ];

  // Fungsi navigasi yang benar
  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  // Fungsi untuk menampilkan dialog Log Out
  Future<void> _showLogoutDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => const LogoutDialog(),
    );
    if (result == true) {
      // Logika Log Out sesungguhnya (Contoh: Navigasi ke Halaman Login)
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login', // Pastikan rute '/login' Anda telah didefinisikan di main.dart
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    // Menggunakan Safe Area untuk memastikan konten berada di bawah status bar
    // dan tidak ada padding tambahan yang tidak perlu di bagian atas header.
    Widget header = Container(
      // Padding disesuaikan agar tidak ada gap di antara AppBar dan Header
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0), 
      color: customBlue,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150',
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
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // Menggunakan primary: false di AppBar agar body mengambil alih Status Bar
    return Scaffold(
        // REVISI 2: Mengatur AppBar agar tidak secara otomatis menyertakan padding Status Bar
        // Ini memungkinkan header biru mengisi seluruh area dari atas.
      appBar: AppBar(
        backgroundColor: customBlue,
        elevation: 0, // AppBar tidak ada bayangan
        toolbarHeight: 0, // Sembunyikan AppBar standar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
                // Mengganti AppBar dengan tampilan Header kustom yang mencakup tombol Menu
                Container(
                    color: customBlue,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10, // Tambahkan padding untuk Status Bar dan sedikit margin
                        bottom: 10,
                        left: 16,
                        right: 16,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            // REVISI 1: Warna Hamburger Icon menjadi HITAM
                            IconButton(
                                icon: const Icon(
                                    Icons.menu,
                                    color: Colors.black, // Berubah menjadi HITAM
                                ),
                                onPressed: onMenuTap,
                            ),
                            const Text(
                                'Settings', 
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            // Placeholder agar judul tetap di tengah
                            const SizedBox(width: 48), 
                        ],
                    ),
                ),

                // Header pengguna yang asli, sekarang diletakkan di bawah AppBar kustom
                header,

            // Item 'Profile Setting' (Tidak bisa diklik)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, 
                children: <Widget>[
                  const Icon(Icons.person, color: customBlue, size: 24), // Ukuran ikon disesuaikan
                  const SizedBox(width: 25.0), // Jarak disesuaikan
                  const Text(
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

            // Daftar Menu Settings
            ...menuItems.map((item) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(item['icon'] as IconData, color: customBlue),
                    title: Text(item['title'] as String),
                    onTap: () {
                      _navigateTo(context, item['route'] as String);
                    },
                  ),
                  const Divider(height: 1), 
                ],
              );
            }).toList(),

            const SizedBox(height: 30), 

            // Tombol Log Out
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: () => _showLogoutDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonRed,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}