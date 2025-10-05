import 'package:flutter/material.dart';

class TabunganPage extends StatefulWidget {
  const TabunganPage({super.key});

  @override
  State<TabunganPage> createState() => _TabunganPageState();
}

class _TabunganPageState extends State<TabunganPage> {
  double _savingsBalance = 5000000;
  double _targetAmount = 10000000;
  final List<SavingsGoal> _savingsGoals = [
    SavingsGoal(
      name: 'Dana Darurat',
      target: 10000000,
      current: 5000000,
      deadline: '30 Jun 2025',
    ),
    SavingsGoal(
      name: 'Liburan Bali',
      target: 5000000,
      current: 2000000,
      deadline: '15 Mar 2025',
    ),
    SavingsGoal(
      name: 'Beli Laptop',
      target: 15000000,
      current: 3000000,
      deadline: '31 Dec 2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final progress = _savingsBalance / _targetAmount;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 60, 144),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tabungan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Savings Card
            Card(
              color: const Color(0xFF1A1A1A),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Total Tabungan',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Rp ${_savingsBalance.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[800],
                      color: Colors.green,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp 0',
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                        Text(
                          'Target: Rp ${_targetAmount.toStringAsFixed(0)}',
                          style: TextStyle(color: Colors.grey[400], fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions
            const Text(
              'Aksi Cepat',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    icon: Icons.add,
                    label: 'Tambah',
                    color: Colors.green,
                    onTap: _showAddSavingsDialog,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    icon: Icons.remove,
                    label: 'Tarik',
                    color: Colors.orange,
                    onTap: _showWithdrawSavingsDialog,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildActionButton(
                    icon: Icons.flag,
                    label: 'Target',
                    color: Colors.blue,
                    onTap: _showSetGoalDialog,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Savings Goals
            const Text(
              'Target Tabungan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              child: ListView.builder(
                itemCount: _savingsGoals.length,
                itemBuilder: (context, index) {
                  final goal = _savingsGoals[index];
                  return _buildSavingsGoalCard(goal);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color(0xFF1A1A1A),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSavingsGoalCard(SavingsGoal goal) {
    final progress = goal.current / goal.target;

    return Card(
      color: const Color(0xFF1A1A1A),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  goal.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[800],
              color: Colors.blue,
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rp ${goal.current.toStringAsFixed(0)}',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
                Text(
                  'Rp ${goal.target.toStringAsFixed(0)}',
                  style: TextStyle(color: Colors.grey[400], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey[400], size: 12),
                const SizedBox(width: 4),
                Text(
                  'Target: ${goal.deadline}',
                  style: TextStyle(color: Colors.grey[400], fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddSavingsDialog() {
    showDialog(
      context: context,
      builder: (context) => _buildSavingsDialog(
        title: 'Tambah Tabungan',
        action: 'Tambah',
        onConfirm: (amount) {
          setState(() {
            _savingsBalance += amount;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Berhasil menambah tabungan Rp ${amount.toStringAsFixed(0)}'),
              backgroundColor: Colors.green,
            ),
          );
        },
      ),
    );
  }

  void _showWithdrawSavingsDialog() {
    showDialog(
      context: context,
      builder: (context) => _buildSavingsDialog(
        title: 'Tarik Tabungan',
        action: 'Tarik',
        onConfirm: (amount) {
          if (amount <= _savingsBalance) {
            setState(() {
              _savingsBalance -= amount;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Berhasil menarik tabungan Rp ${amount.toStringAsFixed(0)}'),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Saldo tabungan tidak cukup'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSavingsDialog({
    required String title,
    required String action,
    required Function(double) onConfirm,
  }) {
    final controller = TextEditingController();

    return AlertDialog(
      backgroundColor: const Color(0xFF1A1A1A),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Masukkan jumlah',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: const Icon(Icons.attach_money, color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {
            final amount = double.tryParse(controller.text) ?? 0;
            if (amount > 0) {
              Navigator.pop(context);
              onConfirm(amount);
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: Text(action),
        ),
      ],
    );
  }

  void _showSetGoalDialog() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur set target akan segera hadir'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class SavingsGoal {
  final String name;
  final double target;
  final double current;
  final String deadline;

  SavingsGoal({
    required this.name,
    required this.target,
    required this.current,
    required this.deadline,
  });
}