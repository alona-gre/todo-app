import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Task.dart';
import '../widgets/TaskListItem.dart';
import '../providers/tasks.dart';

class OutlineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context, listen: true);
    final tasks = tasksData.items;

    return ListView.builder(
      itemBuilder: (context, i) => TaskListItem(
        tasks[i].id,
        tasks[i].title,
        tasks[i].context,
        tasks[i].dueDate,
      ),
      itemCount: tasks.length,
    );
  }
}
