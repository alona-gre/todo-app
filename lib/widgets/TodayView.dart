import 'package:intl/intl.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../models/Task.dart';
import '../widgets/ChartBar.dart';
import '../providers/tasks.dart';

class TodayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context, listen: true);
    final thisWeekTasks = tasksData.recentTasks;
    final groupedTasksRequiredTime = tasksData.groupedTasksValues;
    final totalRequiredTime = tasksData.totalTime;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Total hours required',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTasksRequiredTime.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['hours'],
                      totalRequiredTime == 0.0
                          ? 0.0
                          : (data['hours'] as double) / totalRequiredTime),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
