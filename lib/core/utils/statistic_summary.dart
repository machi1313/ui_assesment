// ... imports
import 'package:flutter/material.dart';


// import '../bloc/payment_state.dart'; // Not strictly needed, but good practice

class StatisticSummary extends StatelessWidget {
  final double income;
  final double expense;

  const StatisticSummary({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate total for percentage display
    final total = income + expense;
    final incomeRatio = total > 0 ? income / total : 0.5;
    final expenseRatio = total > 0 ? expense / total : 0.5;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Donut Chart          
          SizedBox(
            width: 80,
            height: 80,
            child: CustomPaint(
              painter: _DonutChartPainter(
                incomeRatio: incomeRatio,
                expenseRatio: expenseRatio,
              ),
            ),),
          

          // Right: Income and Expense Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  _StatItem(
                    color: Colors.green,
                    label: 'Income',
                    amount: income,
                  ),
                  const SizedBox(height: 10),
                  _StatItem(
                    color: Colors.amber,
                    label: 'Expense',
                    amount: expense,
                  ),
                ],
              ),
            ),
          ),
        ],
      ));
  
  }
}

// Helper widget for the text details
class _StatItem extends StatelessWidget {
  final Color color;
  final String label;
  final double amount;

  const _StatItem({
    required this.color,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        Text(
          '\$${amount.toStringAsFixed(0)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

// CustomPainter for the donut chart (Simplified for brevity)
class _DonutChartPainter extends CustomPainter {
  final double incomeRatio;
  final double expenseRatio;

  _DonutChartPainter({required this.incomeRatio, required this.expenseRatio});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw expense (yellow)
    final expensePaint = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0, // Start angle (right side)
      2 * 3.14159265 * expenseRatio, // Sweep angle
      false,
      expensePaint,
    );

    // Draw income (green)
    final incomePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      2 * 3.14159265 * expenseRatio, // Start after expense
      2 * 3.14159265 * incomeRatio, // Sweep angle
      false,
      incomePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) {
    return oldDelegate.incomeRatio != incomeRatio ||
        oldDelegate.expenseRatio != expenseRatio;
  }
}