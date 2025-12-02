import 'package:flutter_ui_assignment/presentation/bloc/paymentbloc/payment_state.dart';
import 'package:intl/intl.dart';
// import '../bloc/payment_state.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<TransactionItem> history;

  const HistoryList({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    // Using ListView.builder inside a Column requires a fixed height
    // or using ListView.separated with shrinkWrap: true and physics: NeverScrollableScrollPhysics()
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Important for SingleChildScrollView parent
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      itemCount: history.length,
      separatorBuilder: (context, index) => const Divider(height: 20),
      itemBuilder: (context, index) {
        final item = history[index];
        return _HistoryItemTile(item: item);
      },
    );
  }
}

class _HistoryItemTile extends StatelessWidget {
  final TransactionItem item;

  const _HistoryItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final amountText = item.isCredit
        ? '+\$ ${item.amount.toStringAsFixed(2)}'
        : '-\$ ${item.amount.toStringAsFixed(2)}';
    // final amountColor = item.isCredit ? Colors.green : Colors.red;

    return Row(
      children: [
        // Avatar (Placeholder for CircleAvatar)       
         const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 15),

        // Name and Date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 2),
              Text(
                DateFormat('dd MMM yyyy').format(item.date),
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),

        // Amount and Description
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amountText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              item.description,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}