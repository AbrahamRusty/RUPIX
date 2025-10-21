import 'package:flutter/material.dart';
import 'recovery_slide2_input.dart';

class RecoverySlide1Context extends StatelessWidget {
  const RecoverySlide1Context({super.key});

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

            // Illustration placeholder
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFFB86EFF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.restore, color: Colors.black, size: 60),
              ),
            ),

            const SizedBox(height: 20),

            // Title
            const Center(
              child: Text(
                "Pemulihan Dompet",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Pulihkan akses ke dompet Anda menggunakan Recovery Phrase yang telah Anda simpan sebelumnya.",
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Reasons
            const Text(
              "Mengapa perlu Recovery Phrase?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Reason 1
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB86EFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.black, size: 16),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    "Recovery Phrase adalah satu-satunya cara untuk memulihkan dompet Anda",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Reason 2
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB86EFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.black, size: 16),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    "Simpan Recovery Phrase di tempat yang aman dan rahasia",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Reason 3
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB86EFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.black, size: 16),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    "Jangan bagikan Recovery Phrase dengan siapapun",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Spacer(),

            // Mulai Pemulihan Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB86EFF),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RecoverySlide2Input(),
                    ),
                  );
                },
                child: const Text(
                  "Mulai Pemulihan",
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
