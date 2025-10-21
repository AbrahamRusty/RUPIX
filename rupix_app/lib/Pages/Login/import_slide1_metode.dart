import 'package:flutter/material.dart';
import 'import_slide2_input.dart';

enum ImportMethod { recoveryPhrase, privateKey, fileKeystore }

class ImportSlide1Metode extends StatefulWidget {
  const ImportSlide1Metode({super.key});

  @override
  State<ImportSlide1Metode> createState() => _ImportSlide1MetodeState();
}

class _ImportSlide1MetodeState extends State<ImportSlide1Metode> {
  ImportMethod? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Judul
            const Text(
              "Pilih Metode Import",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              "Pilih metode yang ingin Anda gunakan untuk mengimpor dompet Anda.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),

            const SizedBox(height: 40),

            // Opsi Recovery Phrase
            RadioListTile<ImportMethod>(
              title: const Text(
                "Recovery Phrase",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: const Text(
                "Impor menggunakan 12 atau 24 kata seed phrase",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              value: ImportMethod.recoveryPhrase,
              groupValue: _selectedMethod,
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
              activeColor: const Color(0xFFB86EFF),
            ),

            // Opsi Private Key
            RadioListTile<ImportMethod>(
              title: const Text(
                "Private Key",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: const Text(
                "Impor menggunakan private key hex",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              value: ImportMethod.privateKey,
              groupValue: _selectedMethod,
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
              activeColor: const Color(0xFFB86EFF),
            ),

            // Opsi File Keystore
            RadioListTile<ImportMethod>(
              title: const Text(
                "File Keystore",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              subtitle: const Text(
                "Impor menggunakan file JSON keystore",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              value: ImportMethod.fileKeystore,
              groupValue: _selectedMethod,
              onChanged: (value) {
                setState(() {
                  _selectedMethod = value;
                });
              },
              activeColor: const Color(0xFFB86EFF),
            ),

            const Spacer(),

            // Tombol Lanjutkan
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedMethod != null
                      ? const Color(0xFFB86EFF)
                      : Colors.grey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _selectedMethod != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImportSlide2Input(
                              selectedMethod: _selectedMethod!,
                            ),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  "Lanjutkan",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
