import 'package:flutter/material.dart';
import 'recovery_slide3_validation.dart';

class RecoverySlide2Input extends StatefulWidget {
  const RecoverySlide2Input({super.key});

  @override
  State<RecoverySlide2Input> createState() => _RecoverySlide2InputState();
}

class _RecoverySlide2InputState extends State<RecoverySlide2Input> {
  final TextEditingController _phraseController = TextEditingController();
  String? _errorText;

  void _validatePhrase() {
    final phrase = _phraseController.text.trim();
    final words = phrase
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();

    if (words.length != 12 && words.length != 24) {
      setState(() {
        _errorText = 'Recovery Phrase harus terdiri dari 12 atau 24 kata';
      });
    } else {
      setState(() {
        _errorText = null;
      });
    }
  }

  bool get _isValid =>
      _errorText == null && _phraseController.text.trim().isNotEmpty;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Title
            const Text(
              "Masukkan Recovery Phrase",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Masukkan 12 atau 24 kata Recovery Phrase Anda dengan spasi di antara kata-kata.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),

            const SizedBox(height: 40),

            // Text Area
            TextField(
              controller: _phraseController,
              maxLines: 6,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                hintText: "Masukkan recovery phrase Anda di sini...",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorText: _errorText,
                errorStyle: const TextStyle(color: Colors.redAccent),
              ),
              onChanged: (value) {
                _validatePhrase();
              },
            ),

            const SizedBox(height: 20),

            // Tips Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tips:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "• Pastikan setiap kata dipisahkan dengan spasi\n• Periksa ejaan kata dengan teliti\n• Recovery Phrase case-sensitive",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Lanjutkan Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isValid
                      ? const Color(0xFFB86EFF)
                      : Colors.grey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: _isValid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecoverySlide3Validation(
                              recoveryPhrase: _phraseController.text.trim(),
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

  @override
  void dispose() {
    _phraseController.dispose();
    super.dispose();
  }
}
