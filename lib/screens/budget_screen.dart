import 'package:flutter/material.dart';
import '../providers/finance_provider.dart';

class BudgetScreen extends StatelessWidget {
  final FinanceProvider provider;
  const BudgetScreen({super.key, required this.provider});

  static const _colors = {'blue': Colors.blue, 'green': Colors.green, 'orange': Colors.orange, 'purple': Colors.purple, 'red': Colors.red, 'teal': Colors.teal, 'amber': Colors.amber, 'pink': Colors.pink};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Budget', style: TextStyle(fontWeight: FontWeight.w700))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[200]!)),
            child: Row(children: [
              _summaryItem('Budgeted', '\$${provider.totalBudgeted.toStringAsFixed(0)}', Colors.blue),
              Container(width: 1, height: 40, color: Colors.grey[300]),
              _summaryItem('Spent', '\$${provider.totalSpent.toStringAsFixed(0)}', Colors.orange),
              Container(width: 1, height: 40, color: Colors.grey[300]),
              _summaryItem('Remaining', '\$${(provider.totalBudgeted - provider.totalSpent).toStringAsFixed(0)}', Colors.green),
            ]),
          ),

          // Budget categories
          const SizedBox(height: 20),
          const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...provider.budgets.map((b) {
            final color = _colors[b.color] ?? Colors.grey;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text(b.icon, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 10),
                    Expanded(child: Text(b.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15))),
                    Text('\$${b.spent.toStringAsFixed(0)} / \$${b.budgeted.toStringAsFixed(0)}', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                  ]),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: b.percentUsed / 100,
                      backgroundColor: Colors.grey[200],
                      color: b.percentUsed > 90 ? Colors.red : color,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(b.remaining >= 0 ? '\$${b.remaining.toStringAsFixed(0)} remaining' : '\$${(-b.remaining).toStringAsFixed(0)} over budget', style: TextStyle(fontSize: 12, color: b.remaining >= 0 ? Colors.green[700] : Colors.red)),
                ]),
              ),
            );
          }),

          // Savings Goals
          const SizedBox(height: 20),
          const Text('Savings Goals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...provider.goals.map((g) => Card(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Text(g.icon, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 10),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(g.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text('\$${g.saved.toStringAsFixed(0)} of \$${g.target.toStringAsFixed(0)}', style: TextStyle(fontSize: 13, color: Colors.grey[600])),
                  ])),
                  Text('${g.progressPercent.toStringAsFixed(0)}%', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
                ]),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(value: g.progressPercent / 100, backgroundColor: Colors.grey[200], color: Colors.green, minHeight: 8),
                ),
              ]),
            ),
          )),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _summaryItem(String label, String value, Color color) => Expanded(
    child: Column(children: [
      Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color)),
      const SizedBox(height: 2),
      Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
    ]),
  );
}
