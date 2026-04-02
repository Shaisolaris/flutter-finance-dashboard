import 'package:flutter/foundation.dart';
import '../models/models.dart';

class FinanceProvider extends ChangeNotifier {
  final portfolio = const Portfolio(
    totalValue: 47823.56,
    totalGain: 8234.12,
    totalGainPercent: 20.8,
    todayChange: 342.15,
    todayChangePercent: 0.72,
    holdings: [
      Holding(symbol: 'AAPL', name: 'Apple Inc.', shares: 25, avgCost: 142.50, currentPrice: 178.72, dayChange: 2.34, dayChangePercent: 1.33, sector: 'Technology'),
      Holding(symbol: 'MSFT', name: 'Microsoft Corp.', shares: 15, avgCost: 280.00, currentPrice: 378.91, dayChange: -1.23, dayChangePercent: -0.32, sector: 'Technology'),
      Holding(symbol: 'GOOGL', name: 'Alphabet Inc.', shares: 10, avgCost: 120.00, currentPrice: 141.80, dayChange: 0.95, dayChangePercent: 0.67, sector: 'Technology'),
      Holding(symbol: 'AMZN', name: 'Amazon.com', shares: 20, avgCost: 128.50, currentPrice: 178.25, dayChange: 3.12, dayChangePercent: 1.78, sector: 'Consumer'),
      Holding(symbol: 'NVDA', name: 'NVIDIA Corp.', shares: 8, avgCost: 450.00, currentPrice: 875.30, dayChange: 12.45, dayChangePercent: 1.44, sector: 'Technology'),
      Holding(symbol: 'JPM', name: 'JPMorgan Chase', shares: 12, avgCost: 145.00, currentPrice: 196.42, dayChange: -0.87, dayChangePercent: -0.44, sector: 'Finance'),
      Holding(symbol: 'V', name: 'Visa Inc.', shares: 10, avgCost: 230.00, currentPrice: 276.50, dayChange: 1.15, dayChangePercent: 0.42, sector: 'Finance'),
    ],
    history: [
      PortfolioSnapshot(date: 'Jan', value: 39500),
      PortfolioSnapshot(date: 'Feb', value: 41200),
      PortfolioSnapshot(date: 'Mar', value: 40800),
      PortfolioSnapshot(date: 'Apr', value: 43500),
      PortfolioSnapshot(date: 'May', value: 44100),
      PortfolioSnapshot(date: 'Jun', value: 45800),
      PortfolioSnapshot(date: 'Jul', value: 44200),
      PortfolioSnapshot(date: 'Aug', value: 46500),
      PortfolioSnapshot(date: 'Sep', value: 47823),
    ],
  );

  final List<Transaction> transactions = [
    Transaction(id: 't1', description: 'Whole Foods Market', amount: 127.43, category: 'Groceries', categoryIcon: '🛒', date: DateTime.now().subtract(const Duration(hours: 3)), isExpense: true),
    Transaction(id: 't2', description: 'Salary Deposit', amount: 5200.00, category: 'Income', categoryIcon: '💰', date: DateTime.now().subtract(const Duration(days: 1)), isExpense: false),
    Transaction(id: 't3', description: 'Netflix', amount: 15.99, category: 'Entertainment', categoryIcon: '🎬', date: DateTime.now().subtract(const Duration(days: 2)), isExpense: true),
    Transaction(id: 't4', description: 'Shell Gas Station', amount: 52.80, category: 'Transportation', categoryIcon: '⛽', date: DateTime.now().subtract(const Duration(days: 2)), isExpense: true),
    Transaction(id: 't5', description: 'Starbucks', amount: 6.45, category: 'Dining', categoryIcon: '☕', date: DateTime.now().subtract(const Duration(days: 3)), isExpense: true),
    Transaction(id: 't6', description: 'Dividend - AAPL', amount: 24.50, category: 'Dividends', categoryIcon: '📈', date: DateTime.now().subtract(const Duration(days: 4)), isExpense: false),
    Transaction(id: 't7', description: 'Gym Membership', amount: 49.99, category: 'Health', categoryIcon: '🏋️', date: DateTime.now().subtract(const Duration(days: 5)), isExpense: true),
    Transaction(id: 't8', description: 'Electric Bill', amount: 89.20, category: 'Utilities', categoryIcon: '⚡', date: DateTime.now().subtract(const Duration(days: 6)), isExpense: true),
    Transaction(id: 't9', description: 'Freelance Payment', amount: 1500.00, category: 'Income', categoryIcon: '💻', date: DateTime.now().subtract(const Duration(days: 7)), isExpense: false),
    Transaction(id: 't10', description: 'Amazon Purchase', amount: 67.99, category: 'Shopping', categoryIcon: '📦', date: DateTime.now().subtract(const Duration(days: 8)), isExpense: true),
  ];

  final List<BudgetCategory> budgets = const [
    BudgetCategory(name: 'Housing', icon: '🏠', budgeted: 2000, spent: 1850, color: 'blue'),
    BudgetCategory(name: 'Groceries', icon: '🛒', budgeted: 600, spent: 487, color: 'green'),
    BudgetCategory(name: 'Transportation', icon: '🚗', budgeted: 300, spent: 215, color: 'orange'),
    BudgetCategory(name: 'Entertainment', icon: '🎬', budgeted: 200, spent: 178, color: 'purple'),
    BudgetCategory(name: 'Dining', icon: '🍽️', budgeted: 400, spent: 342, color: 'red'),
    BudgetCategory(name: 'Health', icon: '🏋️', budgeted: 150, spent: 50, color: 'teal'),
    BudgetCategory(name: 'Utilities', icon: '⚡', budgeted: 250, spent: 189, color: 'amber'),
    BudgetCategory(name: 'Shopping', icon: '🛍️', budgeted: 300, spent: 268, color: 'pink'),
  ];

  final List<WatchlistItem> watchlist = const [
    WatchlistItem(symbol: 'TSLA', name: 'Tesla Inc.', price: 248.50, change: 5.32, changePercent: 2.19),
    WatchlistItem(symbol: 'META', name: 'Meta Platforms', price: 505.75, change: -3.20, changePercent: -0.63),
    WatchlistItem(symbol: 'AMD', name: 'AMD', price: 162.30, change: 4.15, changePercent: 2.62),
    WatchlistItem(symbol: 'DIS', name: 'Walt Disney', price: 101.20, change: -0.45, changePercent: -0.44),
    WatchlistItem(symbol: 'NFLX', name: 'Netflix', price: 628.90, change: 8.70, changePercent: 1.40),
  ];

  final List<SavingsGoal> goals = const [
    SavingsGoal(id: 'g1', name: 'Emergency Fund', icon: '🏦', target: 15000, saved: 12500),
    SavingsGoal(id: 'g2', name: 'Vacation', icon: '✈️', target: 5000, saved: 2800),
    SavingsGoal(id: 'g3', name: 'New Car', icon: '🚗', target: 30000, saved: 8500),
  ];

  double get totalBudgeted => budgets.fold(0, (s, b) => s + b.budgeted);
  double get totalSpent => budgets.fold(0, (s, b) => s + b.spent);
  double get monthlyIncome => transactions.where((t) => !t.isExpense).fold(0.0, (s, t) => s + t.amount);
  double get monthlyExpenses => transactions.where((t) => t.isExpense).fold(0.0, (s, t) => s + t.amount);
}
