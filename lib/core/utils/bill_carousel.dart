// ... imports
import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/presentation/bloc/paymentbloc/payment_state.dart';


class BillCardCarousel extends StatelessWidget {
  final List<Bill> bills;
  const BillCardCarousel({super.key, required this.bills});

  @override
  Widget build(BuildContext context) {
    // Implement a PageView.builder here for the swipe effect
    return Column(
      children: [
        SizedBox(
          height: 200, // Fixed height for the card
          child: PageView.builder(
            itemCount: bills.length,
            itemBuilder: (context, index) {
              final bill = bills[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BillCard(bill: bill),
              );
            },
          ),
        ),
        // Add a page indicator here (dots below the card)
        const SizedBox(height: 10),
        // Placeholder for the Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bills.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.pink : Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BillCard extends StatelessWidget {
  final Bill bill;
  const BillCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // Use a gradient that matches the pink/orange soft glow
        gradient: const LinearGradient(
          colors: [Color(0xFFF7C3C3), Color(0xFFFDECDA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                bill.type,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // Due in tag
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Due in ${bill.daysUntilDue} days',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'XXXX XXXX ${bill.lastFourDigits}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Amount Due',
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                '\$${bill.amountDue.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}