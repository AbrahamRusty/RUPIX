import 'package:flutter/material.dart';
import 'notapulsa.dart';

class Pinpulsa extends StatelessWidget {
  const Pinpulsa({super.key});

  @override
  Widget build(BuildContext context) {
    return const PinEntryPage();
  }
}

/// Halaman Masukkan PIN
class PinEntryPage extends StatefulWidget {
  const PinEntryPage({super.key});

  @override
  State<PinEntryPage> createState() => _PinEntryPageState();
}

class _PinEntryPageState extends State<PinEntryPage> {
  static const int pinLength = 6;
  final List<int> _pin = [];

  void _onNumberPressed(int n) {
    if (_pin.length >= pinLength) return;
    setState(() {
      _pin.add(n);
    });

    if (_pin.length == pinLength) {
      _onCompleted(_pin);
    }
  }

  void _onDeletePressed() {
    if (_pin.isEmpty) return;
    setState(() {
      _pin.removeLast();
    });
  }

  /// Panggil saat PIN lengkap (6 digit)
  void _onCompleted(List<int> pin) {
    // Navigate to TransaksiBerhasilpulsaPage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TransaksiBerhasilpulsaPage()),
    );
  }

  Widget _buildDot(bool filled) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 14,
      height: 14,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: filled ? const Color.fromARGB(255, 0, 60, 144) : const Color.fromARGB(77, 111, 111, 111),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildNumberButton(String label, {void Function()? onTap, Widget? child}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 76,
        width: 76,
        decoration: BoxDecoration(
          color: onTap != null ? const Color.fromARGB(77, 111, 111, 111) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: child ??
              Text(
                label,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: onTap != null ? Colors.white : Colors.grey.shade600,
                ),
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0), // Background dark
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // title & subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    'Masukkan PIN',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Gunakan PIN Anda.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            // dot indicators
            SizedBox(
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pinLength,
                  (i) => _buildDot(i < _pin.length),
                ),
              ),
            ),

            const SizedBox(height: 28),
            // keypad
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  // numbers 1-3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton('1', onTap: () => _onNumberPressed(1)),
                      _buildNumberButton('2', onTap: () => _onNumberPressed(2)),
                      _buildNumberButton('3', onTap: () => _onNumberPressed(3)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // 4-6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton('4', onTap: () => _onNumberPressed(4)),
                      _buildNumberButton('5', onTap: () => _onNumberPressed(5)),
                      _buildNumberButton('6', onTap: () => _onNumberPressed(6)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // 7-9
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton('7', onTap: () => _onNumberPressed(7)),
                      _buildNumberButton('8', onTap: () => _onNumberPressed(8)),
                      _buildNumberButton('9', onTap: () => _onNumberPressed(9)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // bottom row: empty / 0 / delete
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Empty space for layout balance
                      _buildNumberButton('', onTap: null, child: const SizedBox.shrink()),
                      _buildNumberButton('0', onTap: () => _onNumberPressed(0)),
                      _buildNumberButton('', onTap: _onDeletePressed, child: Icon(Icons.backspace_outlined, size: 22, color: Colors.grey.shade400)),
                    ],
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}