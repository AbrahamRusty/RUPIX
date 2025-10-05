import 'package:flutter/material.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  final List<Promo> _promos = [
    Promo(
      title: 'Cashback 20%',
      description: 'Dapatkan cashback 20% untuk semua transaksi pertama',
      discount: '20%',
      validUntil: '30 Des 2024',
      color: Colors.blue,
      isActive: true,
    ),
    Promo(
      title: 'Free Transfer',
      description: 'Transfer gratis ke semua bank tanpa biaya admin',
      discount: 'GRATIS',
      validUntil: '25 Des 2024',
      color: Colors.green,
      isActive: true,
    ),
    Promo(
      title: 'Diskon Top Up 10%',
      description: 'Diskon 10% untuk top up saldo minimal Rp 100.000',
      discount: '10%',
      validUntil: '20 Des 2024',
      color: Colors.orange,
      isActive: true,
    ),
    Promo(
      title: 'Bonus Saldo',
      description: 'Dapatkan bonus saldo Rp 5.000 untuk transaksi pertama',
      discount: 'Rp 5.000',
      validUntil: '15 Des 2024',
      color: Colors.purple,
      isActive: false,
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
          'Promo & Diskon',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Header Info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.purple.shade800],
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.local_offer_outlined, color: Colors.white, size: 40),
                const SizedBox(height: 8),
                const Text(
                  'Nikmati Berbagai Promo Menarik',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tersedia promo khusus untuk pengguna Rupix',
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
                ),
              ],
            ),
          ),

          // Promo List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _promos.length,
              itemBuilder: (context, index) {
                final promo = _promos[index];
                return _buildPromoCard(promo);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoCard(Promo promo) {
    return Card(
      color: const Color(0xFF1A1A1A),
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: promo.color.withOpacity(0.3), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: promo.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    promo.discount,
                    style: TextStyle(
                      color: promo.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const Spacer(),
                if (!promo.isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'EXPIRED',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              promo.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              promo.description,
              style: TextStyle(color: Colors.grey[400], fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey[400], size: 16),
                const SizedBox(width: 4),
                Text(
                  'Berlaku hingga ${promo.validUntil}',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
                const Spacer(),
                if (promo.isActive)
                  ElevatedButton(
                    onPressed: () => _usePromo(promo),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: promo.color,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Pakai',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _usePromo(Promo promo) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Promo "${promo.title}" berhasil digunakan'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class Promo {
  final String title;
  final String description;
  final String discount;
  final String validUntil;
  final Color color;
  final bool isActive;

  Promo({
    required this.title,
    required this.description,
    required this.discount,
    required this.validUntil,
    required this.color,
    required this.isActive,
  });
}