import 'package:flutter_bloc/flutter_bloc.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {


  PaymentBloc() : super(PaymentInitial()) {
    on<FetchPaymentData>(_onFetchPaymentData);
  }

  void _onFetchPaymentData(
    FetchPaymentData event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 800)); 

      final mockBills = [
        Bill(
          lastFourDigits: '2149',
          type: 'Phone Bill',
          amountDue: 2050.00,
          daysUntilDue: 3,
        ),
        Bill(
          lastFourDigits: '1313',
          type: 'Netfix Bill',
          amountDue: 2090.00,
          daysUntilDue: 5,
        ),
      ];

      final mockHistory = [
        TransactionItem(
          name: 'Mia Park',
          date: DateTime(2025, 11, 8),
          amount: 120.00,
          description: 'Transfer in',
          avatarUrl: 'mia_park.jpg',
          isCredit: true,
        ),
        TransactionItem(
          name: 'Netflix',
          date: DateTime(2025, 11, 6),
          amount: 13.99,
          description: 'Subscription',
          avatarUrl: 'netflix.jpg',
          isCredit: false,
        ),
        TransactionItem(
          name: 'Amir Khan',
          date: DateTime(2025, 11, 6),
          amount: 100.00,
          description: 'Transfer out',
          avatarUrl: 'amir_khan.jpg',
          isCredit: false,
        ),
      ];

      emit(PaymentLoaded(
        bills: mockBills,
        income: 680.00,
        expense: 1120.00,
        history: mockHistory,
      ));
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }
}