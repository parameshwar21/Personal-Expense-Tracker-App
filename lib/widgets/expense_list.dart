import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const Center(
        child: Text('No expenses added yet!'),
      );
    }

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final exp = expenses[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          elevation: 2,
          child: ListTile(
            title: Text(exp.title),
            subtitle: Text('${exp.category} • ${DateFormat.yMMMd().format(exp.date)}'),
            trailing: Text('₹${exp.amount.toStringAsFixed(2)}'),
          ),
        );
      },
    );
  }
}
