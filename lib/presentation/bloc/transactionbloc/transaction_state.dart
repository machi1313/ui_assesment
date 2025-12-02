import 'package:equatable/equatable.dart';
import 'package:flutter_ui_assignment/domain/entities/transacttion_entity.dart';

class TransactionState extends Equatable {
  final bool isLoading;
  final Transaction? transaction;
  final bool showSummary;
  final String? error;

  const TransactionState({
    this.isLoading = false,
    this.transaction,
    this.showSummary = false,
    this.error,
  });

  TransactionState copyWith({
    bool? isLoading,
    Transaction? transaction,
    bool? showSummary,
    String? error,
  }) {
    return TransactionState(
      isLoading: isLoading ?? this.isLoading,
      transaction: transaction ?? this.transaction,
      showSummary: showSummary ?? this.showSummary,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, transaction, showSummary, error];
}