# flutter-finance-dashboard

![CI](https://github.com/Shaisolaris/flutter-finance-dashboard/actions/workflows/ci.yml/badge.svg)

Flutter personal finance dashboard with investment portfolio tracking, stock holdings with gain/loss, budget categories with progress bars, savings goals, transaction history, watchlist, and income vs expense summary. Dart-only with ChangeNotifier state and Material Design 3.

## Stack

- **Framework:** Flutter 3.x, Dart 3.3+
- **State:** ChangeNotifier (FinanceProvider)
- **Design:** Material Design 3 with NavigationBar

## Features

### Portfolio
- Total portfolio value with daily and all-time gain/loss
- Gradient portfolio header card with change indicators
- 9-month portfolio value bar chart
- 7 stock holdings with shares, avg cost, current price, day change, total gain
- Holdings sorted by market value
- Sector labels per holding
- 5-item watchlist with price and change percentage

### Budget
- Monthly summary: budgeted, spent, remaining
- 8 budget categories with progress bars and remaining/over indicators
- Color-coded progress (red when over 90% spent)
- 3 savings goals with progress bars and target amounts
- Goal percentage completion display

### Transactions
- Income vs expenses summary cards with icons
- 10 transactions with category icons, amounts, and relative dates
- Green for income, red for expenses
- Category labeling per transaction

## Architecture

```
lib/
├── main.dart                          # App with 3-tab NavigationBar
├── models/models.dart                 # Portfolio, Holding, Transaction, BudgetCategory, SavingsGoal, WatchlistItem
├── providers/finance_provider.dart    # All mock data and computed properties
├── screens/
│   ├── portfolio_screen.dart          # Portfolio value, chart, holdings, watchlist
│   ├── budget_screen.dart             # Budget summary, categories, savings goals
│   └── transactions_screen.dart       # Income/expenses, transaction list
└── widgets/                           # (inline widgets in screens)
```

## Data

- Portfolio: $47,823.56 total value, 7 holdings (AAPL, MSFT, GOOGL, AMZN, NVDA, JPM, V)
- 10 transactions across 8 categories with income and expense types
- 8 budget categories with realistic monthly allocations
- 5 watchlist stocks (TSLA, META, AMD, DIS, NFLX)
- 3 savings goals (emergency fund, vacation, new car)
- 9 months of portfolio history

## Setup

```bash
git clone https://github.com/Shaisolaris/flutter-finance-dashboard.git
cd flutter-finance-dashboard
flutter create .
flutter pub get
flutter run
```

## Key Design Decisions

**Computed properties in provider.** Total budget, total spent, monthly income, and expenses are computed from raw data rather than stored. This prevents data drift and makes the provider the single source of truth for derived values.

**Color-coded budget thresholds.** Budget progress bars turn red when spending exceeds 90% of the allocated amount. This provides immediate visual feedback on categories approaching their limits without requiring the user to read numbers.

**Gradient portfolio card.** The main portfolio value uses a dark gradient card to visually separate it from the rest of the content. This is a common pattern in fintech apps (Robinhood, Coinbase) that draws attention to the primary metric.

**Holdings with dual gain display.** Each holding shows both the market value and the total gain. This lets users see both the current allocation and the performance without switching views.

## License

MIT
