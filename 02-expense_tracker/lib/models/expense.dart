import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category {
  food,
  travel,
  leisure,
  work,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.expenses,
    required this.category,
  });

  // extra constructor for category total
  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where(
              (expense) => expense.category == category,
            )
            .toList();

  final List<Expense> expenses;
  final Category category;

  double get totalExpenses {
    double total = 0.0;
    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
