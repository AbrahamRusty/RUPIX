import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Transfer/transfer_receipt_screen.dart';

class TransferBankConfirmScreen extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final String amount;

  const TransferBankConfirmScreen({
    super.key,
    required this.bankName,
    required this.accountNumber,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final double transferAmount = double.tryParse(amount) ?? 0;
    const double transferFee = 2500;
    final double totalAmount = transferAmount + transferFee;
    final String recipientName = 'Patricia Natania';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0088FF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Confirmation',
          style: TextStyle(
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
              'Recipient',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow(recipientName, accountNumber),
            const SizedBox(height: 20),
            const Text(
              'Bank',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildInfoRow(bankName, 'assets/Transfer/bca.png'),
            const SizedBox(height: 20),
            const Text(
              'Transfer Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildDetailRow('Transfer Amount', 'Rp$amount'),
            _buildDetailRow(
              'Transfer Fee',
              'Rp${transferFee.toStringAsFixed(0)}',
            ),
            _buildDetailRow('Total', 'Rp${totalAmount.toStringAsFixed(0)}'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferReceiptScreen(
                        amount: totalAmount.toStringAsFixed(0),
                        recipientName: recipientName,
                        recipientDetails: accountNumber,
                      ),
                    ),
                  );
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
                  'Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (value.contains('assets'))
            Image.asset(value, width: 40)
          else
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
