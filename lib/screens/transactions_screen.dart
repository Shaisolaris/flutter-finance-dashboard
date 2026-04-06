import '../data/demo_data.dart';
import 'package:flutter/material.dart';
import '../providers/finance_provider.dart';

class TransactionsScreen extends StatelessWidget {
  final FinanceProvider provider;
  const TransactionsScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final income = provider.monthlyIncome;
    final expenses = provider.monthlyExpenses;

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions', style: TextStyle(fontWeight: FontWeight.w700))),
      body: ListView(
        children: [
          // Income vs Expenses
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(children: [
              _summaryCard('Income', income, Colors.green, Icons.arrow_downward),
              const SizedBox(width: 12),
              _summaryCard('Expenses', expenses, Colors.red, Icons.arrow_upward),
            ]),
          ),

          // Transaction List
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Recent', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 8),
          ...provider.transactions.map((t) {
            final days = DateTime.now().difference(t.date).inDays;
            final dateStr = days == 0 ? 'Today' : days == 1 ? 'Yesterday' : '${t.date.month}/${t.date.day}';
            return ListTile(
              leading: Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: (t.isExpense ? Colors.red : Colors.green).withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text(t.categoryIcon, style: const TextStyle(fontSize: 20))),
              ),
              title: Text(t.description, style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('$dateStr · ${t.category}', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              trailing: Text(
                '${t.isExpense ? "-" : "+"}\$${t.amount.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: t.isExpense ? Colors.red[700] : Colors.green[700]),
              ),
            );
          }),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _summaryCard(String label, double amount, Color color, IconData icon) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.2))),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          Text('\$${amount.toStringAsFixed(0)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color)),
        ]),
      ]),
    ));
  }
}
