import 'package:flutter/material.dart';

import '../models/TaskListItem.dart';

class Tasks with ChangeNotifier {
  final List<TaskListItem> _items = [
    TaskListItem(
      id: 't1',
      title: 'Buy milk',
      context: '@Home',
      dueDate: DateTime.now(),
    ),
    TaskListItem(
      id: 't2',
      title: 'Call boss',
      dueDate: DateTime.now(),
    ),
  ];

  List<TaskListItem> get items {
    return [..._items];
  }

  void addTask() {
    // tasks.add(value);
    notifyListeners();
  }
}
