import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Transfer/transfer_ewallet_form_screen.dart';
import 'package:rupix_app/Widgets/ewallet_list_tile.dart';

// Ubah dari StatelessWidget menjadi StatefulWidget
class TransferEWalletScreen extends StatefulWidget {
  const TransferEWalletScreen({super.key});

  @override
  State<TransferEWalletScreen> createState() => _TransferEWalletScreenState();
}

class _TransferEWalletScreenState extends State<TransferEWalletScreen> {
  // State untuk melacak e-wallet mana yang dipilih
  String? _selectedEWallet;
  String? _selectedEWalletLogoPath;

  // Daftar e-wallet dan path logonya
  final List<Map<String, String>> _eWallets = const [
    {'name': 'Gopay', 'path': 'assets/Transfer/gopay.png'},
    {'name': 'OVO', 'path': 'assets/Transfer/ovo.png'},
    {'name': 'ShopeePay', 'path': 'assets/Transfer/shopeepay.png'},
    {'name': 'Dana', 'path': 'assets/Transfer/dana.png'},
  ];

  @override
  Widget build(BuildContext context) {
    // Tentukan apakah tombol "Continue" harus aktif
    final bool isContinueEnabled = _selectedEWallet != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0088FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transfer e-wallet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Transfer to e-wallet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Search or select recipients e-wallet',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for e-wallet',
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Menggunakan ListView.builder untuk membuat daftar
                  // Ini lebih baik daripada membuat EWalletListTile satu per satu secara manual
                  ..._eWallets.map((ewallet) {
                    final ewalletName = ewallet['name']!;
                    final logoPath = ewallet['path']!;

                    // Kita perlu memodifikasi EWalletListTile agar menerima parameter isSelected
                    // Lihat bagian 'Catatan Penting' di bawah
                    return EWalletListTile(
                      ewalletName: ewalletName,
                      logoPath: logoPath,
                      isSelected:
                          _selectedEWallet == ewalletName, // Cek status pilihan
                      onTap: () {
                        setState(() {
                          // Mengubah state e-wallet yang dipilih
                          _selectedEWallet = ewalletName;
                          _selectedEWalletLogoPath = logoPath;
                        });
                      },
                    );
                  }),

                  // Menggantikan list EWalletListTile yang statis
                ],
              ),
            ),
          ),

          // Tombol Continue sekarang dikontrol oleh state
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // Tombol akan aktif hanya jika isContinueEnabled == true
                onPressed: isContinueEnabled
                    ? () {
                        // Navigasi ke halaman form hanya ketika tombol ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferEWalletFormScreen(
                              ewalletName: _selectedEWallet!,
                              // Anda bisa membawa logoPath jika diperlukan di halaman form
                              // logoPath: _selectedEWalletLogoPath,
                            ),
                          ),
                        );
                      }
                    : null, // Jika isContinueEnabled false, tombol akan disabled

                style: ElevatedButton.styleFrom(
                  // Mengubah warna latar belakang berdasarkan status aktif/nonaktif
                  backgroundColor: isContinueEnabled
                      ? const Color(0xFF0088FF)
                      : Colors.grey, // Warna abu-abu jika disabled

                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
