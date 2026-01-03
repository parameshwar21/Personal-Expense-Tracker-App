import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'database/db_helper.dart';
import 'providers/expense_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open box
  await DBHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: MaterialApp(
        title: 'Personal Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true, // optional for modern look
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
