import 'package:flutter/material.dart';
import 'recovery_slide4_security.dart';

class RecoverySlide3Validation extends StatefulWidget {
  final String recoveryPhrase;

  const RecoverySlide3Validation({super.key, required this.recoveryPhrase});

  @override
  State<RecoverySlide3Validation> createState() =>
      _RecoverySlide3ValidationState();
}

class _RecoverySlide3ValidationState extends State<RecoverySlide3Validation> {
  bool _isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    final words = widget.recoveryPhrase
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Title
            const Text(
              "Validasi Recovery Phrase",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Pastikan Recovery Phrase yang Anda masukkan sudah benar. Kata-kata akan ditampilkan dalam urutan yang benar.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),

            const SizedBox(height: 40),

            // Validation Results
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFFB86EFF),
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "${words.length} kata terdeteksi",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Kata-kata Recovery Phrase:",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: words.asMap().entries.map((entry) {
                      final index = entry.key + 1;
                      final word = entry.value;
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB86EFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "$index. $word",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Confirmation Checkbox
            Row(
              children: [
                Checkbox(
                  value: _isConfirmed,
                  onChanged: (value) {
                    setState(() {
                      _isConfirmed = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFFB86EFF),
                  checkColor: Colors.black,
                ),
                const Expanded(
                  child: Text(
                    "Saya telah memverifikasi bahwa Recovery Phrase ini benar dan lengkap",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Lanjutkan Pemulihan Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isConfirmed
                      ? const Color(0xFFB86EFF)
                      : Colors.grey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _isConfirmed
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RecoverySlide4Security(),
                          ),
                        );
                      }
                    : null,
                child: const Text(
                  "Lanjutkan Pemulihan",
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
