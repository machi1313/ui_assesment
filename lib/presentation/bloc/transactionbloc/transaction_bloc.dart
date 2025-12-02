import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_assignment/domain/entities/transacttion_entity.dart';
import 'package:flutter_ui_assignment/domain/usecases/get_transaction_details.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final GetTransactionDetails getTransactionDetails;

  TransactionBloc({required this.getTransactionDetails})
      : super(const TransactionState()) {
    on<LoadTransactionDetails>(_onLoadTransactionDetails);
    on<ShowTransactionSummary>(_onShowTransactionSummary);
  }

  Future<void> _onLoadTransactionDetails(
    LoadTransactionDetails event,
    Emitter<TransactionState> emit,
  ) async {
    // This is the initial state, mimicking the start of the chat.
    // The actual "loading" for details is triggered by the user response.
    emit(state.copyWith(isLoading: true));
    
    // Simulate fetching details - in a real app, this calls the use case.
    // For this recreation, we just load the fixed mock data.
    await Future.delayed(const Duration(milliseconds: 500)); 
    
    // Using a mock transaction for UI recreation
    final mockTransaction = Transaction(
      senderName: 'Madelyn Franci',
      date: '22 Sep 2025',
      amount: 100.00,
      type: 'Transfer',
      imageUrl: 'https://i.pravatar.cc/150?img=1', // Placeholder
    );

    emit(state.copyWith(
      isLoading: false,
      transaction: mockTransaction,
      showSummary: false, // Initially false
    ));
  }

  void _onShowTransactionSummary(
    ShowTransactionSummary event,
    Emitter<TransactionState> emit,
  ) {
    emit(state.copyWith(showSummary: true));
  }
}