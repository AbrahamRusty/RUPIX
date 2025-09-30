import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        // Mengubah warna AppBar menjadi warna identitas RupiX, misalnya
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- Pembuka ---
            const Text(
              'Terakhir diperbarui: 30 September 2025', // Tanggal saat ini
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Text(
              'Privasi Anda adalah prioritas utama bagi RupiX. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, mengungkapkan, dan melindungi informasi pribadi Anda terkait penggunaan layanan e-money dan pembayaran digital RupiX.',
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 24),

            // --- 1. Informasi yang Kami Kumpulkan ---
            const Text(
              '1. Informasi yang Kami Kumpulkan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPrivacyPoint(
              title: 'A. Data Pendaftaran dan Identifikasi (KYC)',
              content: 'Nama lengkap, nomor telepon, alamat email, tanggal lahir, alamat, dan dokumen identitas resmi (KTP/Paspor) untuk verifikasi **Know Your Customer (KYC)**, termasuk foto diri.',
            ),
            _buildPrivacyPoint(
              title: 'B. Data Transaksi',
              content: 'Rincian setiap transaksi yang Anda lakukan, termasuk jumlah, waktu, penerima/pengirim, merchant, dan riwayat top-up/pembayaran tagihan.',
            ),
            _buildPrivacyPoint(
              title: 'C. Data Perangkat dan Akses',
              content: 'Informasi tentang perangkat yang Anda gunakan (model, OS, ID unik), alamat IP, data lokasi (jika diizinkan), dan log penggunaan aplikasi untuk keamanan dan analisis.',
            ),
            const SizedBox(height: 24),

            // --- 2. Bagaimana Kami Menggunakan Informasi Anda ---
            const Text(
              '2. Bagaimana Kami Menggunakan Informasi Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildPrivacyPoint(
              title: 'A. Penyediaan Layanan Inti',
              content: 'Untuk memproses semua transaksi (top-up, transfer, pembayaran), memverifikasi identitas Anda, dan mengelola akun RupiX Anda.',
            ),
            _buildPrivacyPoint(
              title: 'B. Keamanan dan Kepatuhan',
              content: 'Untuk mencegah penipuan, mengamankan layanan, dan mematuhi semua peraturan keuangan yang berlaku (seperti anti pencucian uang/APU dan pencegahan pendanaan terorisme/PPT).',
            ),
            _buildPrivacyPoint(
              title: 'C. Komunikasi dan Promosi',
              content: 'Mengirimkan notifikasi transaksi, pembaruan layanan, informasi produk baru, dan penawaran/cashback eksklusif RupiX.',
            ),
            const SizedBox(height: 24),

            // --- 3. Pengungkapan Informasi ---
            const Text(
              '3. Pengungkapan Informasi kepada Pihak Ketiga',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kami tidak akan menjual atau menyewakan informasi pribadi Anda kepada pihak ketiga. Kami hanya dapat mengungkapkannya kepada:',
              style: TextStyle(fontSize: 15),
            ),
            _buildBulletedText('Otoritas pemerintah atau regulator keuangan (untuk kepatuhan hukum).'),
            _buildBulletedText('Bank, merchant mitra, atau penyedia layanan pihak ketiga yang terlibat langsung dalam pemrosesan transaksi (misalnya, bank untuk top-up/transfer).'),
            _buildBulletedText('Penyedia layanan IT, audit, dan analitik yang terikat perjanjian kerahasiaan untuk membantu operasional RupiX.'),
            const SizedBox(height: 24),

            // --- Penutup ---
            const Text(
              'Persetujuan Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dengan menggunakan layanan RupiX, Anda dianggap telah membaca dan menyetujui Kebijakan Privasi ini. Kami dapat memperbarui Kebijakan ini dari waktu ke waktu.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('© 2025 RupiX. All rights reserved.', style: TextStyle(color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk membuat poin-poin kebijakan privasi
  Widget _buildPrivacyPoint({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• $title',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              content,
              style: const TextStyle(fontSize: 15, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget untuk membuat list bullet
  Widget _buildBulletedText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('  •  ', style: TextStyle(fontSize: 15)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.4),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}