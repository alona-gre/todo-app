import 'package:flutter/material.dart';

import '../models/taskListItem.dart';
import '../screens/TaskPreviewScreen.dart';

import '../widgets/OutlineTaskListItem.dart';

class OutlineScreen extends StatelessWidget {
  final List<TaskListItem> loadedTasks = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outline'),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => OutlineTaskListItem(
          loadedTasks[i].id,
          loadedTasks[i].title,
          loadedTasks[i].context,
          loadedTasks[i].dueDate,
        ),
        itemCount: loadedTasks.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.green[600],
        onPressed: () => null,
      ),
    );
  }
}
