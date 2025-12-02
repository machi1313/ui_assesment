import 'package:flutter/material.dart';
import 'package:flutter_ui_assignment/domain/entities/transacttion_entity.dart';

class TransactionSummaryCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionSummaryCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Semi-transparent white background
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Here's the transaction summary:",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 12),
          // Transaction Detail Row
          Row(
            children: [
              // User Avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(transaction.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.senderName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      transaction.date,
                      style: const TextStyle(
                          color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${transaction.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    transaction.type,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Action Prompt
          const Text(
            'Would you like to dispute this payment or add a note to it?',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(height: 8),
          // Thumbs Up/Down Icons
          Row(
            children: [
              const Icon(Icons.thumb_up_alt_outlined,
                  color: Colors.white38, size: 20),
              const SizedBox(width: 10),
              const Icon(Icons.thumb_down_alt_outlined,
                  color: Colors.white38, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}