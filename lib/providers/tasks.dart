import 'package:flutter/material.dart';

import '../models/Task.dart';

class Tasks with ChangeNotifier {
  final List<Task> _items = [
    Task(
      id: 't1',
      title: 'Buy milk',
      context: '@Home',
      dueDate: DateTime.now(),
    ),
    Task(
      id: 't2',
      title: 'Call boss',
      dueDate: DateTime.now(),
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
}
