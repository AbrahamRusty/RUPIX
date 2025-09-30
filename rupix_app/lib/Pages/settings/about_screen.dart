import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Warna AppBar disesuaikan dengan identitas RupiX
    const Color rupixPrimaryColor = Color(0xFF1976D2); // Darker blue

    return Scaffold(
      appBar: AppBar(
        title: const Text('About RupiX'),
        backgroundColor: rupixPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- Bagian Pengantar ---
            const Text(
              'RupiX adalah aplikasi e-money digital yang dirancang untuk menjadikan transaksi finansial Anda lebih cepat, aman, dan nyaman. Dengan RupiX, Anda dapat mengisi saldo, transfer uang, membayar tagihan, dan berbelanja online maupun offline — semuanya dalam satu aplikasi.',
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),

            // --- Bagian Misi ---
            const Text(
              'Misi Kami',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: rupixPrimaryColor),
            ),
            const Divider(color: rupixPrimaryColor),
            const SizedBox(height: 10),
            
            _buildMissionPoint(
              icon: Icons.lightbulb_outline,
              text: 'Sederhanakan aktivitas finansial harian Anda.',
            ),
            _buildMissionPoint(
              icon: Icons.lock_outline,
              text: 'Amankan setiap transaksi dengan enkripsi canggih dan verifikasi KYC.',
            ),
            _buildMissionPoint(
              icon: Icons.handshake_outlined,
              text: 'Sediakan layanan tepercaya sesuai dengan regulasi keuangan yang berlaku.',
            ),
            _buildMissionPoint(
              icon: Icons.rocket_launch_outlined,
              text: 'Dukung gaya hidup digital Anda dengan solusi pembayaran modern.',
            ),
            const SizedBox(height: 30),

            // --- Bagian Fitur Utama ---
            const Text(
              'Fitur Unggulan RupiX',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: rupixPrimaryColor),
            ),
            const Divider(color: rupixPrimaryColor),
            const SizedBox(height: 10),
            
            _buildFeaturePoint(
              text: 'Top-Up Saldo melalui bank transfer, mobile banking, internet banking, dan merchant resmi.',
            ),
            _buildFeaturePoint(
              text: 'Transfer Instan ke sesama pengguna RupiX atau langsung ke rekening bank.',
            ),
            _buildFeaturePoint(
              text: 'Pembayaran Tagihan (listrik, air, internet, telepon, dan lainnya).',
            ),
            _buildFeaturePoint(
              text: 'Belanja Online & Offline dengan berbagai merchant partner.',
            ),
            _buildFeaturePoint(
              text: 'Promosi & Cashback Eksklusif untuk menjadikan setiap transaksi lebih menguntungkan.',
            ),
            const SizedBox(height: 30),

            // --- Penutup ---
            const Center(
              child: Text(
                'Dengan RupiX, semua kebutuhan pembayaran Anda hanya berjarak satu ketukan. 🌟',
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1565C0), // Slightly lighter blue
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk poin Misi
  Widget _buildMissionPoint({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, color: const Color(0xFF1976D2), size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget untuk poin Fitur
  Widget _buildFeaturePoint({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Icon(Icons.check_circle, color: Colors.green, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
