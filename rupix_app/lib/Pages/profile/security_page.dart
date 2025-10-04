import 'package:flutter/material.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

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
          'Keamanan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSecurityCard(
              Icons.lock_outline,
              "Ubah PIN",
              "Perbarui PIN transaksi Anda",
              () => _showChangePinDialog(context),
            ),
            _buildSecurityCard(
              Icons.fingerprint_outlined,
              "Autentikasi Biometrik",
              "Gunakan sidik jari atau wajah",
              () => _showBiometricSettings(context),
            ),
            _buildSecurityCard(
              Icons.password_outlined,
              "Ubah Password",
              "Perbarui kata sandi login",
              () => _showChangePassword(context),
            ),
            _buildSecurityCard(
              Icons.devices_outlined,
              "Perangkat Terhubung",
              "Keluali perangkat yang terhubung",
              () => _showConnectedDevices(context),
            ),
            _buildSecurityCard(
              Icons.history_outlined,
              "Riwayat Login",
              "Lihat riwayat aktivitas login",
              () => _showLoginHistory(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityCard(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.orange, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangePinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text("Ubah PIN", style: TextStyle(color: Colors.white)),
        content: Text(
          "Fitur ubah PIN akan segera hadir",
          style: TextStyle(color: Colors.grey[400]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  void _showBiometricSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Pengaturan biometrik akan segera hadir"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showChangePassword(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Fitur ubah password akan segera hadir"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showConnectedDevices(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Fitur perangkat terhubung akan segera hadir"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showLoginHistory(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Riwayat login akan segera hadir"),
        duration: Duration(seconds: 2),
      ),
    );
  }
}