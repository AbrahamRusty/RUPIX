import 'package:flutter/material.dart';
import 'import_slide5_success.dart';

class ImportSlide4Loading extends StatefulWidget {
  const ImportSlide4Loading({super.key});

  @override
  State<ImportSlide4Loading> createState() => _ImportSlide4LoadingState();
}

class _ImportSlide4LoadingState extends State<ImportSlide4Loading> {
  @override
  void initState() {
    super.initState();
    // Simulate loading for 3 seconds, then navigate to success
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ImportSlide5Success()),
        );
      }
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Progress Indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB86EFF)),
            ),

            const SizedBox(height: 40),

            // Loading Text
            const Text(
              "Mengimpor dompet...",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Subtitle
            const Text(
              "Mohon tunggu sebentar, proses import sedang berlangsung.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
