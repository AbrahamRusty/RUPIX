import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String message;

  const SuccessScreen({super.key, this.message = 'SUCCESS'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 150, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              message.toUpperCase(),
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
