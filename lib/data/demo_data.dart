class DemoFinance {
  static final Map<String, dynamic> portfolio = {'totalValue': 124500.00, 'dayChange': 1250.00, 'dayChangePercent': 1.01};
  static final List<Map<String, dynamic>> holdings = [
    {'symbol': 'AAPL', 'name': 'Apple Inc', 'shares': 50, 'value': 8750.00, 'change': 1.2},
    {'symbol': 'GOOGL', 'name': 'Alphabet Inc', 'shares': 20, 'value': 5680.00, 'change': -0.8},
    {'symbol': 'MSFT', 'name': 'Microsoft', 'shares': 40, 'value': 16800.00, 'change': 0.5},
    {'symbol': 'VOO', 'name': 'Vanguard S&P 500', 'shares': 100, 'value': 45000.00, 'change': 0.3},
    {'symbol': 'BND', 'name': 'Total Bond Market', 'shares': 200, 'value': 15400.00, 'change': 0.1},
  ];
  static final List<Map<String, dynamic>> recentTransactions = [
    {'id': '1', 'type': 'buy', 'symbol': 'AAPL', 'shares': 10, 'price': 175.00, 'date': '2026-04-01'},
    {'id': '2', 'type': 'dividend', 'symbol': 'VOO', 'amount': 125.00, 'date': '2026-03-28'},
    {'id': '3', 'type': 'sell', 'symbol': 'TSLA', 'shares': 5, 'price': 248.00, 'date': '2026-03-25'},
  ];
  static final List<Map<String, dynamic>> monthlyPerformance = [
    {'month': 'Nov', 'value': 108000}, {'month': 'Dec', 'value': 112000},
    {'month': 'Jan', 'value': 115000}, {'month': 'Feb', 'value': 118500},
    {'month': 'Mar', 'value': 123250}, {'month': 'Apr', 'value': 124500},
  ];
}
