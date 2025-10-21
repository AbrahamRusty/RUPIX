import 'dart:async';
import 'package:flutter/material.dart';
import 'recovery_slide6_success.dart';

class RecoverySlide5Process extends StatefulWidget {
  const RecoverySlide5Process({super.key});

  @override
  State<RecoverySlide5Process> createState() => _RecoverySlide5ProcessState();
}

class _RecoverySlide5ProcessState extends State<RecoverySlide5Process> {
  int _currentStep = 0;
  Timer? _timer;

  final List<String> _steps = [
    "Memverifikasi Recovery Phrase...",
    "Memulihkan dompet...",
    "Mengatur keamanan...",
    "Menyelesaikan pemulihan...",
  ];

  @override
  void initState() {
    super.initState();
    _startProcess();
  }

  void _startProcess() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_currentStep < _steps.length - 1) {
          _currentStep++;
        } else {
          _timer?.cancel();
          // Navigate to success after completion
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecoverySlide6Success(),
                ),
              );
            }
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
            // Loading Animation
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFB86EFF),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.sync, color: Colors.black, size: 60),
            ),

            const SizedBox(height: 40),

            // Title
            const Text(
              "Memulihkan Dompet",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Current Step
            Text(
              _steps[_currentStep],
              style: const TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // Progress Steps
            Column(
              children: List.generate(_steps.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: index <= _currentStep
                              ? const Color(0xFFB86EFF)
                              : Colors.grey[700],
                          shape: BoxShape.circle,
                        ),
                        child: index < _currentStep
                            ? const Icon(
                                Icons.check,
                                color: Colors.black,
                                size: 16,
                              )
                            : index == _currentStep
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.black,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          _steps[index],
                          style: TextStyle(
                            color: index <= _currentStep
                                ? Colors.white
                                : Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),

            const SizedBox(height: 40),

            // Progress Bar
            LinearProgressIndicator(
              value: (_currentStep + 1) / _steps.length,
              backgroundColor: Colors.grey[700],
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFB86EFF),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "${_currentStep + 1} dari ${_steps.length}",
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
