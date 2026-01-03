import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseChart extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    // Group expenses by category
    final Map<String, double> data = {};
    for (var exp in expenses) {
      data[exp.category] = (data[exp.category] ?? 0) + exp.amount;
    }

    if (data.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(child: Text('No expenses to show in chart')),
      );
    }

    // Maximum amount to normalize bar height
    final maxAmount = data.values.reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: data.entries.map((entry) {
            final barHeight = (entry.value / maxAmount) * 100;
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('₹${entry.value.toStringAsFixed(0)}',
                    style: const TextStyle(fontSize: 12)),
                const SizedBox(height: 4),
                Container(
                  width: 20,
                  height: barHeight,
                  color: Colors.blue,
                ),
                const SizedBox(height: 4),
                Text(entry.key, style: const TextStyle(fontSize: 12)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
