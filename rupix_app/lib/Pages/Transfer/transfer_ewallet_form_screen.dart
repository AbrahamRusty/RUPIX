import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Transfer/transfer_receipt_screen.dart';

class TransferEWalletFormScreen extends StatefulWidget {
  final String ewalletName;
  const TransferEWalletFormScreen({super.key, required this.ewalletName});

  @override
  State<TransferEWalletFormScreen> createState() =>
      _TransferEWalletFormScreenState();
}

class _TransferEWalletFormScreenState extends State<TransferEWalletFormScreen> {
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _contactController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0088FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.ewalletName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Name/Contact',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contactController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ketik nama atau nomor hp',
                filled: true,
                fillColor: const Color(0xFF2D2D2D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Amount',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixText: 'Rp',
                prefixStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                filled: true,
                fillColor: const Color(0xFF2D2D2D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickAmountButton(50000),
                _buildQuickAmountButton(100000),
                _buildQuickAmountButton(200000),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_contactController.text.isNotEmpty &&
                      _amountController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransferReceiptScreen(
                          amount: _amountController.text,
                          recipientName: _contactController.text,
                          recipientDetails: widget.ewalletName,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0088FF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAmountButton(int amount) {
    return ElevatedButton(
      onPressed: () {
        _amountController.text = amount.toString();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2D2D2D),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        'Rp${amount.toString()}',
        style: const TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
