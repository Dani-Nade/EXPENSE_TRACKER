import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'chart_bar.dart';

class Chart extends StatefulWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutBack),
        );
    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(widget.expenses, category.food),
      ExpenseBucket.forCategory(widget.expenses, category.leisure),
      ExpenseBucket.forCategory(widget.expenses, category.travel),
      ExpenseBucket.forCategory(widget.expenses, category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.6),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              'Spending Overview',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in buckets)
                    ChartBar(
                      fill: bucket.totalExpenses == 0
                          ? 0
                          : bucket.totalExpenses / maxTotalExpense,
                      color: categoryColors[bucket.cat]!,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buckets
                  .map(
                    (bucket) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: categoryColors[bucket.cat]!.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            categoryIcon[bucket.cat],
                            color: categoryColors[bucket.cat],
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          bucket.cat.name.toUpperCase(),
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
