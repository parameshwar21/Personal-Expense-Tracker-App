import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../database/db_helper.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => List.unmodifiable(_expenses);

  Future<void> fetchExpenses() async {
    _expenses.clear();
    _expenses.addAll(DBHelper.getExpenses());
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    _expenses.add(expense);
    await DBHelper.addExpense(expense);
    notifyListeners();
  }
}
