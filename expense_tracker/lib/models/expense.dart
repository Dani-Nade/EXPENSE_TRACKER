// models/expense.dart
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum category { food, travel, leisure, work }

const categoryIcon = {
  category.food: Icons.restaurant_rounded,
  category.travel: Icons.flight_takeoff_rounded,
  category.leisure: Icons.movie_rounded,
  category.work: Icons.work_rounded,
};

const categoryColors = {
  category.food: Color(0xFFFF6B6B),
  category.travel: Color(0xFF4ECDC4),
  category.leisure: Color(0xFFFFE66D),
  category.work: Color(0xFF95E1D3),
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.cat,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final category cat;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.cat, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.cat)
    : expenses = allExpenses.where((expense) => expense.cat == cat).toList();

  final category cat;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
