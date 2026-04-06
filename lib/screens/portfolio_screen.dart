import '../data/demo_data.dart';
import 'package:flutter/material.dart';
import '../providers/finance_provider.dart';

class PortfolioScreen extends StatelessWidget {
  final FinanceProvider provider;
  const PortfolioScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final p = provider.portfolio;
    final isUp = p.todayChange >= 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Portfolio', style: TextStyle(fontWeight: FontWeight.w700))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Total Value Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [const Color(0xFF1A1A2E), const Color(0xFF16213E)]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Total Portfolio', style: TextStyle(color: Colors.white60, fontSize: 14)),
              const SizedBox(height: 4),
              Text('\$${p.totalValue.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              Row(children: [
                Icon(isUp ? Icons.trending_up : Icons.trending_down, color: isUp ? Colors.greenAccent : Colors.redAccent, size: 18),
                const SizedBox(width: 4),
                Text('${isUp ? "+" : ""}\$${p.todayChange.toStringAsFixed(2)} (${p.todayChangePercent.toStringAsFixed(2)}%) today', style: TextStyle(color: isUp ? Colors.greenAccent : Colors.redAccent, fontWeight: FontWeight.w500)),
              ]),
              const SizedBox(height: 4),
              Text('All time: +\$${p.totalGain.toStringAsFixed(2)} (+${p.totalGainPercent.toStringAsFixed(1)}%)', style: const TextStyle(color: Colors.white54, fontSize: 13)),
            ]),
          ),

          // Chart
          const SizedBox(height: 20),
          Container(
            height: 120,
            decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey[200]!)),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: p.history.map((s) => Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Container(height: ((s.value - 38000) / 12000 * 70).clamp(4.0, 70.0), decoration: BoxDecoration(color: Colors.blue.withOpacity(0.6), borderRadius: BorderRadius.circular(3))),
                  const SizedBox(height: 4),
                  Text(s.date, style: TextStyle(fontSize: 9, color: Colors.grey[600])),
                ]),
              ))).toList(),
            ),
          ),

          // Holdings
          const SizedBox(height: 20),
          const Text('Holdings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          ...p.holdings.map((h) {
            final gainColor = h.totalGain >= 0 ? Colors.green : Colors.red;
            return Card(
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.blue[50], child: Text(h.symbol.substring(0, 2), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: Colors.blue[700]))),
                title: Text(h.symbol, style: const TextStyle(fontWeight: FontWeight.w700)),
                subtitle: Text('${h.shares.toStringAsFixed(0)} shares · \$${h.avgCost.toStringAsFixed(2)} avg', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('\$${h.marketValue.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text('${h.totalGain >= 0 ? "+" : ""}\$${h.totalGain.toStringAsFixed(2)}', style: TextStyle(fontSize: 12, color: gainColor, fontWeight: FontWeight.w500)),
                ]),
              ),
            );
          }),

          // Watchlist
          const SizedBox(height: 20),
          const Text('Watchlist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          ...provider.watchlist.map((w) => ListTile(
            dense: true,
            title: Text(w.symbol, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text(w.name, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            trailing: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('\$${w.price.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.w600)),
              Text('${w.change >= 0 ? "+" : ""}${w.changePercent.toStringAsFixed(2)}%', style: TextStyle(fontSize: 12, color: w.change >= 0 ? Colors.green : Colors.red)),
            ]),
          )),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
