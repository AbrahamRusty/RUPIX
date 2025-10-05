import 'package:flutter/material.dart';
import 'notaovo.dart';

class Pinovo extends StatelessWidget {
  const Pinovo({super.key});

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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TransaksiBerhasilovoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Color definitions
    final backgroundColor = isDarkMode ? Color(0xFF121212) : Color(0xFF121212);
    final primaryColor = isDarkMode ? Colors.white : Colors.white;
    final secondaryColor = isDarkMode
        ? Colors.grey.shade400
        : Colors.grey.shade400;
    final buttonColor = isDarkMode ? Color(0xFF2D2D2D) : Color(0xFF2D2D2D);
    final filledDotColor = isDarkMode ? Color(0xFF8B2F8F) : Color(0xFF8B2F8F);
    final emptyDotColor = isDarkMode ? Color(0xFF424242) : Color(0xFF424242);

    Widget buildDot(bool filled) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 14,
        height: 14,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: filled ? filledDotColor : emptyDotColor,
          shape: BoxShape.circle,
        ),
      );
    }

    Widget buildNumberButton(
      String label, {
      void Function()? onTap,
      Widget? child,
    }) {
      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 76,
          width: 76,
          decoration: BoxDecoration(shape: BoxShape.circle, color: buttonColor),
          child: Center(
            child:
                child ??
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: primaryColor,
                  ),
                ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: primaryColor),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Title & subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    'Masukkan PIN',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Gunakan PIN OVO Anda.",
                    style: TextStyle(fontSize: 14, color: secondaryColor),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Dot indicators
            SizedBox(
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pinLength,
                  (i) => buildDot(i < _pin.length),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // Keypad
            Expanded(
              child: Column(
                children: [
                  const Spacer(),

                  // Row 1-3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildNumberButton('1', onTap: () => _onNumberPressed(1)),
                      buildNumberButton('2', onTap: () => _onNumberPressed(2)),
                      buildNumberButton('3', onTap: () => _onNumberPressed(3)),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Row 4-6
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildNumberButton('4', onTap: () => _onNumberPressed(4)),
                      buildNumberButton('5', onTap: () => _onNumberPressed(5)),
                      buildNumberButton('6', onTap: () => _onNumberPressed(6)),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Row 7-9
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildNumberButton('7', onTap: () => _onNumberPressed(7)),
                      buildNumberButton('8', onTap: () => _onNumberPressed(8)),
                      buildNumberButton('9', onTap: () => _onNumberPressed(9)),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Bottom row: empty / 0 / delete
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildNumberButton(
                        '',
                        onTap: null,
                        child: const SizedBox.shrink(),
                      ),
                      buildNumberButton('0', onTap: () => _onNumberPressed(0)),
                      buildNumberButton(
                        '',
                        onTap: _onDeletePressed,
                        child: Icon(
                          Icons.backspace_outlined,
                          size: 22,
                          color: secondaryColor,
                        ),
                      ),
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
