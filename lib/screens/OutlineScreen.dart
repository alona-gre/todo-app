import 'package:flutter/material.dart';

import '../models/Task.dart';
import '../widgets/TaskListItem.dart';

class OutlineScreen extends StatelessWidget {
  final List<Task> loadedTasks = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outline'),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => TaskListItem(
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
