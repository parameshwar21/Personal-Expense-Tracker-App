import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/expense.dart';
import '../providers/expense_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  String _category = 'Food';
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16 + bottomInset,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: _category,
              items: ['Food', 'Travel', 'Shopping', 'Other']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => _category = val!),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(DateFormat.yMMMd().format(_selectedDate)),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2022),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) setState(() => _selectedDate = picked);
                  },
                  child: const Text('Pick Date'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isEmpty ||
                    _amountController.text.isEmpty) return;

                Provider.of<ExpenseProvider>(context, listen: false).addExpense(
                  Expense(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    amount: double.parse(_amountController.text),
                    category: _category,
                    date: _selectedDate,
                  ),
                );

                Navigator.pop(context); // close bottom sheet
              },
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
