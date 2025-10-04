import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 60, 144),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Syarat & Ketentuan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header - DIUBAH MENJADI CENTER
            _buildHeader(),
            const SizedBox(height: 24),
            
            // Content
            _buildTermSection(
              "1. Penerimaan Syarat",
              "Dengan mengakses dan menggunakan aplikasi Rupix, Anda setuju untuk terikat oleh syarat dan ketentuan yang ditetapkan di sini.",
            ),
            
            _buildTermSection(
              "2. Definisi",
              """
- 'Pengguna' merujuk pada individu yang menggunakan aplikasi Rupix
- 'Layanan' mencakup semua fitur yang disediakan oleh Rupix
- 'Akun' adalah profil pengguna yang terdaftar di sistem Rupix
""",
            ),
            
            _buildTermSection(
              "3. Pendaftaran Akun",
              """
- Pengguna harus berusia minimal 17 tahun
- Data yang didaftarkan harus akurat dan valid
- Pengguna bertanggung jawab atas kerahasiaan akun
""",
            ),
            
            _buildTermSection(
              "4. Transaksi Keuangan",
              """
- Setiap transaksi bersifat final dan tidak dapat dibatalkan
- Rupix berhak menahan transaksi yang mencurigakan
- Limit transaksi mengikuti tingkat verifikasi akun
""",
            ),
            
            _buildTermSection(
              "5. Biaya Layanan",
              """
- Top up: Gratis
- Transfer sesama Rupix: Gratis
- Transfer antar bank: Sesuai ketentuan bank penerima
- Pembayaran tagihan: Sesuai ketentuan penyedia jasa
""",
            ),
            
            _buildTermSection(
              "6. Privasi dan Keamanan",
              """
- Data pribadi pengguna dilindungi sesuai kebijakan privasi
- Rupix menggunakan enkripsi untuk melindungi data
- Pengguna wajib melaporkan aktivitas mencurigakan
""",
            ),
            
            _buildTermSection(
              "7. Pembatasan Penggunaan",
              """
- Dilarang menggunakan aplikasi untuk aktivitas ilegal
- Tidak diperbolehkan melakukan reverse engineering
- Dilarang menyebarkan konten yang melanggar hukum
""",
            ),
            
            _buildTermSection(
              "8. Hak Kekayaan Intelektual",
              """
- Seluruh konten dalam aplikasi merupakan hak milik Rupix
- Dilarang menyalin, memodifikasi, atau mendistribusikan tanpa izin
- Logo dan merek dagang Rupix dilindungi undang-undang
""",
            ),
            
            _buildTermSection(
              "9. Pembatasan Tanggung Jawab",
              """
- Rupix tidak bertanggung jawab atas kerugian akibat force majeure
- Tanggung jawab terbatas pada nilai transaksi yang diproses
- Pengguna bertanggung jawab atas kesalahan input data
""",
            ),
            
            _buildTermSection(
              "10. Perubahan Syarat",
              """
- Rupix berhak mengubah syarat dan ketentuan sewaktu-waktu
- Perubahan akan diumumkan melalui aplikasi
- Penggunaan berkelanjutan dianggap sebagai penerimaan perubahan
""",
            ),
            
            _buildTermSection(
              "11. Hukum yang Berlaku",
              "Syarat dan ketentuan ini tunduk pada hukum Republik Indonesia.",
            ),
            
            const SizedBox(height: 32),
            
            // Agreement Checkbox
            _buildAgreementSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.description_outlined,
            size: 60,
            color: Colors.blue[200],
          ),
          const SizedBox(height: 16),
          const Align( // DIUBAH MENGGUNAKAN Align
            alignment: Alignment.center,
            child: Text(
              'Syarat & Ketentuan Rupix',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Align( // DIUBAH MENGGUNAKAN Align
            alignment: Alignment.center,
            child: Text(
              'Terakhir diperbarui: 1 Desember 2024',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermSection(String title, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[700]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAgreementSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Dengan menggunakan aplikasi Rupix, saya menyetujui semua syarat dan ketentuan yang berlaku.",
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}