
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_assignment/core/utils/bill_carousel.dart';
import 'package:flutter_ui_assignment/core/utils/history_list.dart';
import 'package:flutter_ui_assignment/core/utils/statistic_summary.dart';
import 'package:flutter_ui_assignment/presentation/bloc/paymentbloc/payment_bloc.dart';
import 'package:flutter_ui_assignment/presentation/bloc/paymentbloc/payment_event.dart';
import 'package:flutter_ui_assignment/presentation/bloc/paymentbloc/payment_state.dart';


class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PaymentBloc>().add(FetchPaymentData());

    return Scaffold(
      backgroundColor: const Color(0xFFF7F2F2), // Light background color
      appBar: AppBar(
        title: const Text('Payment',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading || state is PaymentInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PaymentError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is PaymentLoaded) {
            return _LoadedContent(state: state);
          }
          return Container();
        },
      ),
    );
  }
}
class _LoadedContent extends StatelessWidget {
  final PaymentLoaded state;

  const _LoadedContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        color: const Color.fromARGB(255, 241, 230, 222),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        
            // --- Carousel inside Light Card Background ---
            BillCardCarousel(bills: state.bills),
        
            const SizedBox(height: 30),
        
            // --- STATISTICS WHITE SECTION ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistic',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  StatisticSummary(
                    income: state.income,
                    expense: state.expense,
                  ),
                ],
              ),
            ),
        
            // --- HISTORY SECTION ---
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See More',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
        
            // History List inside white background
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Colors.white,
              child: HistoryList(history: state.history),
            ),
          ],
        ),
      ),
    );
  }
}
