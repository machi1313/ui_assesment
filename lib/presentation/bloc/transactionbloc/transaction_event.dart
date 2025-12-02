import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
  @override
  List<Object> get props => [];
}

class LoadTransactionDetails extends TransactionEvent {
  final String transactionId;
  const LoadTransactionDetails(this.transactionId);
  
  @override
  List<Object> get props => [transactionId];
}

class ShowTransactionSummary extends TransactionEvent {}