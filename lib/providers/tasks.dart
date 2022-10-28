import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Task.dart';

class Tasks with ChangeNotifier {
  final List<Task> _items = [
    Task(
      id: 't1',
      title: 'Buy milk',
      context: '@Home',
      dueDate: DateTime.now(),
      timeRequired: 4.5,
    ),
    Task(
      id: 't2',
      title: 'Call boss',
      dueDate: DateTime.now().subtract(
        Duration(days: 2),
      ),
      timeRequired: 3.5,
    ),
  ];

  List<Task> get items {
    return [..._items];
  }

  Task findById(String id) {
    //finds the task by id
    return _items.firstWhere(
      (tsk) => tsk.id == id,
    );
  }

  void addTask() {
    // tasks.add(value);
    notifyListeners();
  }

  List<Task> get starredTasks {
    return items.where((tsk) => tsk.isStarred).toList();
  }

  List<Task> get recentTasks {
    return _items.where((tsk) {
      return tsk.dueDate.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  List<Map<String, dynamic>> get groupedTasksValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().add(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTasks.length; i++) {
        if (recentTasks[i].dueDate.day == weekDay.day &&
            recentTasks[i].dueDate.month == weekDay.month &&
            recentTasks[i].dueDate.year == weekDay.year) {
          totalSum += recentTasks[i].timeRequired;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'hours': totalSum
      };
    }).reversed.toList();
  }

  double get totalTime {
    return groupedTasksValues.fold(0.0, (sum, item) {
      return sum + item['hours'];
    });
  }
}
