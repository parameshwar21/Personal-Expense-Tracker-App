import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/expense_provider.dart';
import '../widgets/expense_chart.dart';
import '../widgets/expense_list.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchExpensesOnce();
  }

  void _fetchExpensesOnce() async {
    await Provider.of<ExpenseProvider>(context, listen: false).fetchExpenses();
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                ExpenseChart(expenses: expenseProvider.expenses),
                Expanded(
                  child: ExpenseList(expenses: expenseProvider.expenses),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const AddExpenseScreen(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
