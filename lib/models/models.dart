class Portfolio {
  final double totalValue;
  final double totalGain;
  final double totalGainPercent;
  final double todayChange;
  final double todayChangePercent;
  final List<Holding> holdings;
  final List<PortfolioSnapshot> history;

  const Portfolio({required this.totalValue, required this.totalGain, required this.totalGainPercent, required this.todayChange, required this.todayChangePercent, required this.holdings, this.history = const []});
}

class Holding {
  final String symbol;
  final String name;
  final double shares;
  final double avgCost;
  final double currentPrice;
  final double dayChange;
  final double dayChangePercent;
  final String sector;

  const Holding({required this.symbol, required this.name, required this.shares, required this.avgCost, required this.currentPrice, required this.dayChange, required this.dayChangePercent, required this.sector});

  double get marketValue => shares * currentPrice;
  double get totalGain => (currentPrice - avgCost) * shares;
  double get totalGainPercent => ((currentPrice - avgCost) / avgCost) * 100;
}

class PortfolioSnapshot {
  final String date;
  final double value;
  const PortfolioSnapshot({required this.date, required this.value});
}

class Transaction {
  final String id;
  final String description;
  final double amount;
  final String category;
  final String categoryIcon;
  final DateTime date;
  final bool isExpense;

  const Transaction({required this.id, required this.description, required this.amount, required this.category, required this.categoryIcon, required this.date, required this.isExpense});
}

class BudgetCategory {
  final String name;
  final String icon;
  final double budgeted;
  final double spent;
  final String color;

  const BudgetCategory({required this.name, required this.icon, required this.budgeted, required this.spent, required this.color});

  double get remaining => budgeted - spent;
  double get percentUsed => (spent / budgeted * 100).clamp(0, 100);
}

class WatchlistItem {
  final String symbol;
  final String name;
  final double price;
  final double change;
  final double changePercent;

  const WatchlistItem({required this.symbol, required this.name, required this.price, required this.change, required this.changePercent});
}

class SavingsGoal {
  final String id;
  final String name;
  final String icon;
  final double target;
  final double saved;
  final DateTime? deadline;

  const SavingsGoal({required this.id, required this.name, required this.icon, required this.target, required this.saved, this.deadline});

  double get progressPercent => (saved / target * 100).clamp(0, 100);
  double get remaining => target - saved;
}
