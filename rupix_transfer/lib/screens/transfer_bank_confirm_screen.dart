import 'package:flutter/material.dart';
import 'package:rupix_transfer/screens/transfer_receipt_screen.dart';
import 'package:intl/intl.dart';

class TransferBankConfirmScreen extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final String amount;
  final String recipientName;

  const TransferBankConfirmScreen({
    super.key,
    required this.bankName,
    required this.accountNumber,
    required this.amount,
    required this.recipientName,
  });

  @override
  Widget build(BuildContext context) {
    final double transferAmount = double.tryParse(amount) ?? 0;
    const double transferFee = 2500;
    final double totalAmount = transferAmount + transferFee;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Recipient',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Informasi Rekening Penerima
            _buildInfoRow(recipientName, accountNumber),
            const SizedBox(height: 20),
            const Text(
              'Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Detail Transaksi
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildDetailRow(
                    'Amount',
                    'Rp${NumberFormat('#,##0').format(transferAmount)}',
                  ),
                  _buildDetailRow(
                    'Fee',
                    'Rp${NumberFormat('#,##0').format(transferFee)}',
                  ),
                  const Divider(),
                  _buildDetailRow(
                    'Total',
                    'Rp${NumberFormat('#,##0').format(totalAmount)}',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferReceiptScreen(
                        amount: amount,
                        recipientName: recipientName,
                        recipientDetails: '$bankName - $accountNumber',
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
                  'Confirm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget untuk tampilan nama dan nomor rekening
  Widget _buildInfoRow(String name, String number) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            number,
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
