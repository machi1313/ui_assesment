import 'package:flutter_ui_assignment/domain/entities/transacttion_entity.dart';

abstract class GetTransactionDetails {
  Future<Transaction> execute(String transactionId);
}