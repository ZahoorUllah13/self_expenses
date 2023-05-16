import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:u_dumy_self_expenses_app/component/transaction.dart';
import 'package:u_dumy_self_expenses_app/widget/chart_item.dart';
import 'dart:core';

class Chart extends StatelessWidget {
  List<Transaction> recentTransaction;
  Chart(this.recentTransaction);
  List<Map<String, dynamic>> get groupTransactionValue {
    return List.generate(7, (index){
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;
        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }
  double get totalSpending {
    return groupTransactionValue.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionValue.map((data) {
            return Flexible(
              fit:FlexFit.tight ,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0 ? 0.0
                      :(data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
