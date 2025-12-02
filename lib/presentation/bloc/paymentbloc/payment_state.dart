
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentLoaded extends PaymentState {
  final List<Bill> bills;
  final double income;
  final double expense;
  final List<TransactionItem> history;

  PaymentLoaded({
    required this.bills,
    required this.income,
    required this.expense,
    required this.history,
  });
}

class PaymentError extends PaymentState {
  final String message;
  PaymentError(this.message);
}

// Data models (Simplified - ideally in domain/entities)
class Bill {
  final String lastFourDigits;
  final String type;
  final double amountDue;
  final int daysUntilDue;

  Bill({
    required this.lastFourDigits,
    required this.type,
    required this.amountDue,
    required this.daysUntilDue,
  });
}

class TransactionItem {
  final String name;
  final DateTime date;
  final double amount;
  final String description;
  final String avatarUrl; // Placeholder
  final bool isCredit;

  TransactionItem({
    required this.name,
    required this.date,
    required this.amount,
    required this.description,
    required this.avatarUrl,
    required this.isCredit,
  });
}