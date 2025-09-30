import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rupix_app/Pages/Login/welcome.dart'; // bumper Rupiah Wallet
import 'package:rupix_app/Pages/Login/welcomecrypto.dart'; // bumper Crypto Wallet

class CryptoHomePage extends StatefulWidget {
  const CryptoHomePage({super.key});

  @override
  State<CryptoHomePage> createState() => _CryptoHomePageState();
}

class _CryptoHomePageState extends State<CryptoHomePage> {
  String selectedWallet = "Crypto Wallet";
  final List<String> wallets = ["Crypto Wallet", "Rupiah Wallet"];

  String selectedTimeFrame = "Live";

  // Dummy data analytics (rapi & konsisten)
  final Map<String, Map<String, dynamic>> chartData = {
    "Live": {
      "spots": [
        FlSpot(0, 1.2),
        FlSpot(1, 1.6),
        FlSpot(2, 1.3),
        FlSpot(3, 1.8),
        FlSpot(4, 2.2),
      ],
      "percentage": 1.35,
    },
    "1D": {
      "spots": [
        FlSpot(0, 1.0),
        FlSpot(1, 1.4),
        FlSpot(2, 1.8),
        FlSpot(3, 1.6),
        FlSpot(4, 2.1),
      ],
      "percentage": 2.20,
    },
    "1W": {
      "spots": [
        FlSpot(0, 2.5),
        FlSpot(1, 2.0),
        FlSpot(2, 2.8),
        FlSpot(3, 2.4),
        FlSpot(4, 3.2),
      ],
      "percentage": -0.85,
    },
    "1M": {
      "spots": [
        FlSpot(0, 2.0),
        FlSpot(1, 2.4),
        FlSpot(2, 2.8),
        FlSpot(3, 3.6),
        FlSpot(4, 3.2),
      ],
      "percentage": 4.12,
    },
    "3M": {
      "spots": [
        FlSpot(0, 1.8),
        FlSpot(1, 2.6),
        FlSpot(2, 3.0),
        FlSpot(3, 2.2),
        FlSpot(4, 3.8),
      ],
      "percentage": -2.45,
    },
    "1Y": {
      "spots": [
        FlSpot(0, 2.0),
        FlSpot(1, 3.2),
        FlSpot(2, 2.6),
        FlSpot(3, 4.0),
        FlSpot(4, 3.8),
      ],
      "percentage": 12.76,
    },
  };

  @override
  Widget build(BuildContext context) {
    final currentData = chartData[selectedTimeFrame] ?? chartData["Live"]!;
    final double percentage = currentData["percentage"];
    final Color changeColor =
        percentage >= 0 ? Colors.greenAccent : Colors.redAccent;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu, color: Colors.white),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey[900],
                      value: selectedWallet,
                      alignment: Alignment.center,
                      items: wallets.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == "Rupiah Wallet") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomePage()),
                          );
                        } else if (value == "Crypto Wallet") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeCrypto()),
                          );
                        }
                        setState(() {
                          selectedWallet = value!;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Scan QR clicked")),
                      );
                    },
                    icon: const Icon(Icons.qr_code_scanner,
                        color: Colors.white, size: 26),
                  ),
                ],
              ),
            ),

            // Balance Section
            Center(
              child: Column(
                children: [
                  const Text(
                    "\$3240.50",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${percentage >= 0 ? "+" : ""}${percentage.toStringAsFixed(2)}% Today",
                    style: TextStyle(
                      color: changeColor,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Chart Section
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List<FlSpot>.from(currentData['spots']),
                      isCurved: true,
                      color: changeColor,
                      barWidth: 3,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Time Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (var frame in chartData.keys)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeFrame = frame;
                      });
                    },
                    child: _timeTab(frame, selectedTimeFrame == frame),
                  ),
              ],
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton(Icons.swap_horiz, "SWAP", Colors.purpleAccent),
                _actionButton(Icons.send, "SEND", Colors.pinkAccent),
                _actionButton(Icons.call_received, "RECEIVE", Colors.cyanAccent),
              ],
            ),
            const SizedBox(height: 20),

            // Trade Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Trade",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _tradeTile("ETH to USDC", "Ethereum", "\$2924.66", "+1.35%",
                      Colors.greenAccent),
                  _tradeTile("BTC to USDC", "Bitcoin", "\$22658.01", "-1.35%",
                      Colors.redAccent),
                  _tradeTile("SOL to USDT", "Solana", "\$125.20", "+4.82%",
                      Colors.greenAccent),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _timeTab(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: active ? Colors.grey[800] : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[900],
          radius: 28,
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        )
      ],
    );
  }

  Widget _tradeTile(String title, String subtitle, String price, String change,
      Color changeColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Text(
                change,
                style: TextStyle(color: changeColor, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
