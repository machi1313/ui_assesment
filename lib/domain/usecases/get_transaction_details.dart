import 'package:flutter_ui_assignment/domain/entities/transacttion_entity.dart';

/// Abstract use case contract
abstract class GetTransactionDetails {
  Future<Transaction> execute(String transactionId);
}

/// Mock version for now (since you don’t have a repository yet)
class MockGetTransactionDetails implements GetTransactionDetails {
  @override
  Future<Transaction> execute(String transactionId) async {
    await Future.delayed(const Duration(milliseconds: 50));

    return Transaction(
      senderName: 'Madelyn Franci',
      date: '22 Sep 2025',
      amount: 100.00,
      type: 'Transfer',
      imageUrl: 'https://i.pravatar.cc/150?img=1',
    );
  }
}
