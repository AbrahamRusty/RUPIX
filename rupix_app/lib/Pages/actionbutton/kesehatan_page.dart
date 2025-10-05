import 'package:flutter/material.dart';

class KesehatanPage extends StatefulWidget {
  const KesehatanPage({super.key});

  @override
  State<KesehatanPage> createState() => _KesehatanPageState();
}

class _KesehatanPageState extends State<KesehatanPage> {
  final List<HealthService> _healthServices = [
    HealthService(
      name: 'BPJS Kesehatan',
      description: 'Bayar iuran BPJS Kesehatan',
      icon: Icons.health_and_safety,
      color: Colors.green,
    ),
    HealthService(
      name: 'Asuransi Kesehatan',
      description: 'Premi asuransi kesehatan',
      icon: Icons.medical_services,
      color: Colors.blue,
    ),
    HealthService(
      name: 'Rumah Sakit',
      description: 'Pembayaran rumah sakit',
      icon: Icons.local_hospital,
      color: Colors.red,
    ),
    HealthService(
      name: 'Klinik & Dokter',
      description: 'Konsultasi dokter',
      icon: Icons.medical_information,
      color: Colors.purple,
    ),
    HealthService(
      name: 'Apotek Online',
      description: 'Beli obat & vitamin',
      icon: Icons.medication,
      color: Colors.orange,
    ),
    HealthService(
      name: 'Donasi Kesehatan',
      description: 'Bantu yang membutuhkan',
      icon: Icons.favorite,
      color: Colors.pink,
    ),
  ];

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
          'Kesehatan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade800, Colors.blue.shade800],
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.health_and_safety, color: Colors.white, size: 50),
                const SizedBox(height: 12),
                const Text(
                  'Layanan Kesehatan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kelola pembayaran kesehatan dengan mudah dan aman',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Health Services Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: _healthServices.length,
                itemBuilder: (context, index) {
                  final service = _healthServices[index];
                  return _buildHealthServiceCard(service);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthServiceCard(HealthService service) {
    return Card(
      color: const Color(0xFF1A1A1A),
      child: InkWell(
        onTap: () => _showServiceDialog(service),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(service.icon, color: service.color, size: 24),
              ),
              const SizedBox(height: 12),
              Text(
                service.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                service.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showServiceDialog(HealthService service) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: Row(
          children: [
            Icon(service.icon, color: service.color),
            const SizedBox(width: 8),
            Text(
              service.name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.description,
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 16),
            const Text(
              'Fitur ini akan segera hadir',
              style: TextStyle(color: Colors.orange),
            ),
            const SizedBox(height: 8),
            Text(
              'Kami sedang menyiapkan layanan ${service.name.toLowerCase()} untuk memberikan pengalaman terbaik bagi Anda.',
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Notifikasi untuk ${service.name} akan dikirim ketika fitur tersedia'),
                  backgroundColor: Colors.blue,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: service.color),
            child: const Text('Ingatkan Saya'),
          ),
        ],
      ),
    );
  }
}

class HealthService {
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  HealthService({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}