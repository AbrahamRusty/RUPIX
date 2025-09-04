import 'package:flutter/material.dart';
import 'package:rupix_app/WalletHomePage.dart';

void main() {
  runApp(RupiahWalletApp());
}

class RupiahWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rupiah Wallet',
      home: WalletHomePage(),
    );
  }
}

class WalletHome extends StatelessWidget {
  final String balance = 'Rp100.000.000';
  final String used = 'Rp50.000.000';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rupiah Wallet'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle profile click
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[50],
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Balance Section
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'SALDO',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      balance,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$used sudah terpakai di Agustus',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // Action Buttons Section
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Top Up
                  },
                  child: Text('TOP UP'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle Transfer
                  },
                  child: Text('TRANSFER'),
                ),
              ],
            ),

            // Transaction History
            SizedBox(height: 20),
            Text(
              'Riwayat Transaksi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Icon(Icons.water),
              title: Text('Tagihan Air'),
              subtitle: Text('Hari ini 13:00'),
              trailing: Text('Rp100.000'),
            ),

            // Additional Services Section
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  serviceCard('Split Bill'),
                  serviceCard('E-Banking'),
                  serviceCard('Tarik Dana'),
                  serviceCard('E-Wallet'),
                  serviceCard('Promo'),
                  serviceCard('Tabungan'),
                  serviceCard('Air'),
                  serviceCard('Listrik'),
                  serviceCard('Kesehatan'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget serviceCard(String title) {
    return Card(
      child: Center(
        child: Text(title),
      ),
    );
  }
}