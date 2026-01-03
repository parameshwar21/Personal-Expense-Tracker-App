import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';

class DBHelper {
  static const String boxName = 'expensesBox';

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseAdapter()); // register model adapter
    await Hive.openBox<Expense>(boxName);
  }

  // Add an expense
  static Future<void> addExpense(Expense expense) async {
    final box = Hive.box<Expense>(boxName);
    await box.put(expense.id, expense);
  }

  // Fetch all expenses
  static List<Expense> getExpenses() {
    final box = Hive.box<Expense>(boxName);
    return box.values.toList();
  }
}
