import 'package:flutter/material.dart';
import 'package:rupix_transfer/screens/transfer_receipt_screen.dart';
import 'package:rupix_transfer/widgets/numeric_pad.dart';

class RupiXTransferAmountScreen extends StatefulWidget {
  final String contactName;
  final String contactDetails;

  const RupiXTransferAmountScreen({
    super.key,
    required this.contactName,
    required this.contactDetails,
  });

  @override
  State<RupiXTransferAmountScreen> createState() =>
      _RupiXTransferAmountScreenState();
}

class _RupiXTransferAmountScreenState extends State<RupiXTransferAmountScreen> {
  String _amount = '';

  void _onNumberPressed(String number) {
    setState(() {
      if (_amount.length < 12) {
        _amount += number;
      }
    });
  }

  void _onBackspacePressed() {
    setState(() {
      if (_amount.isNotEmpty) {
        _amount = _amount.substring(0, _amount.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D3FD3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D3FD3),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Your Wallet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.contactName,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.contactDetails,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Amount to Transfer',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              _amount.isEmpty ? 'Rp0' : 'Rp$_amount',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          NumericPad(
            onNumberPressed: _onNumberPressed,
            onBackspacePressed: _onBackspacePressed,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: _amount.isNotEmpty && _amount != '0'
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferReceiptScreen(
                            amount: _amount,
                            recipientName: widget.contactName,
                            recipientDetails: widget.contactDetails,
                          ),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF5D3FD3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
