import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalAmount;
  final double countPctOfTotal;

  ChartBar(this.label, this.totalAmount, this.countPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 20,
        child: FittedBox(
          child: Text(totalAmount == 0
              ? '${totalAmount.toStringAsFixed(0)}'
              : '${totalAmount.toStringAsFixed(1)}'),
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Container(
        height: 60,
        width: 15,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            FractionallySizedBox(
              heightFactor: countPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(label),
    ]);
  }
}
