# Personal Expense Tracker

A **Flutter web and mobile** application to track personal expenses with real-time updates, charts, and local persistence using **Hive**.  

---

## Features

- Add expenses with **title, amount, category, and date** via a **bottom sheet**.
- View expenses in a **scrollable list** with details.
- See a **category-wise bar chart** that updates automatically.
- **Persistent storage** using Hive — data remains after reloads.
- Works on **Chrome / Flutter web** and mobile devices.
- Reactive UI with **Provider** state management.

---


## Getting Started

### Prerequisites

- Flutter >= 3.0
- Dart >= 3.0
- Chrome (for web)
- Optional: Android/iOS emulator

### Installation

1. Clone the repository:

```bash
git clone https://github.com/parameshwar21/Personal-Expense-Tracker-App.git
cd Personal-Expense-Tracker


2.Install dependencies:

flutter pub get


3. Run the app on Chrome:

flutter run -d chrome
Or run on mobile:
flutter run

Folder Structure:


lib/
 ├─ main.dart
 ├─ models/
 │   └─ expense.dart (+ generated expense.g.dart)
 ├─ providers/
 │   └─ expense_provider.dart
 ├─ helpers/
 │   └─ db_helper.dart
 ├─ screens/
 │   ├─ home_screen.dart
 │   └─ add_expense_screen.dart
 └─ widgets/
     ├─ expense_chart.dart
     └─ expense_list.dart
