import 'package:flutter/material.dart';

class NumericPad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final Function() onBackspacePressed;

  const NumericPad({
    super.key,
    required this.onNumberPressed,
    required this.onBackspacePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow(['1', '2', '3']),
        _buildRow(['4', '5', '6']),
        _buildRow(['7', '8', '9']),
        _buildRow(['', '0', 'delete']),
      ],
    );
  }

  Widget _buildRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((button) {
        if (button == 'delete') {
          return _buildButton(
            child: const Icon(Icons.backspace, color: Colors.white),
            onTap: onBackspacePressed,
          );
        } else if (button.isEmpty) {
          return _buildButton(child: const SizedBox.shrink(), onTap: () {});
        } else {
          return _buildButton(
            child: Text(
              button,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onTap: () => onNumberPressed(button),
          );
        }
      }).toList(),
    );
  }

  Widget _buildButton({required Widget child, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
