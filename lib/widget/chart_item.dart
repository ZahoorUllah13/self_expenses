import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double totalSpend;
  final double totalPctSpend;

  const ChartBar(this.lable, this.totalSpend, this.totalPctSpend);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Container(
            height: 20,
            child: Text(
              '\$${totalSpend.toStringAsFixed(0)}',
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 70,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: const Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: totalPctSpend,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(lable)
      ],
    );
  }
}
