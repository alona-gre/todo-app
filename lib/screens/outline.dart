import 'package:flutter/material.dart';
import 'dart:io';

import '../models/taskListItem.dart';

class OutlineScreen extends StatelessWidget {
  final List<TaskListItem> addedTasks = [
    TaskListItem(
      id: 't1',
      title: 'Buy milk',
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
        itemBuilder: (context, index) {
          return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: ListTile(
                leading: Icon(Icons.check_box_outline_blank,
                    size: 35, color: Colors.grey[600]),
                title: Text(
                  addedTasks[index].title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ));
        },
        itemCount: addedTasks.length,
      ),
    );
  }
}
