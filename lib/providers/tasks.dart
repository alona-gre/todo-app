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
      dueDate: DateTime.now().add(
        Duration(days: 2),
      ),
      timeRequired: 3.5,
    ),
    Task(
      id: 't3',
      title: 'Send a report',
      context: '@Office',
      dueDate: DateTime.now().add(
        Duration(days: 1),
      ),
      timeRequired: 1.5,
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

  void addTask(String tskTitle, DateTime chosenDate) {
    final newTsk = Task(
      id: DateTime.now().toString(),
      title: tskTitle,
      dueDate: chosenDate,
    );
    _items.add(newTsk);
    notifyListeners();
  }

  void startAddTask(String tskTitle, DateTime chosenDate) {
    // opens modal sheet to add a new task
    notifyListeners();
  }

  void deleteTask(String tskId) {
    _items.remove(tskId);
    notifyListeners();
  }

  List<Task> get starredTasks {
    return _items.where((tsk) => tsk.isStarred).toList();
  }

  List<Task> get nextWeekTasks {
    return _items.where((tsk) {
      return tsk.dueDate.isBefore(
        DateTime.now().add(
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

      for (var i = 0; i < nextWeekTasks.length; i++) {
        if (nextWeekTasks[i].dueDate.day == weekDay.day &&
            nextWeekTasks[i].dueDate.month == weekDay.month &&
            nextWeekTasks[i].dueDate.year == weekDay.year) {
          totalSum += nextWeekTasks[i].timeRequired;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'hours': totalSum
      };
    }).toList();
  }

  double get totalTime {
    return groupedTasksValues.fold(0.0, (sum, item) {
      return sum + item['hours'];
    });
  }
}
