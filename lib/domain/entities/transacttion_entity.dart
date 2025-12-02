class Transaction {
  final String senderName;
  final String date;
  final double amount;
  final String type;
  final String imageUrl;

  Transaction({
    required this.senderName,
    required this.date,
    required this.amount,
    required this.type,
    required this.imageUrl,
  });
}