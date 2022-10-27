import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Task.dart';
import '../widgets/TaskListItem.dart';
import '../providers/tasks.dart';

class StarredList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context, listen: true);
    final tasks = tasksData.starredTasks;

    return ListView.builder(
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        // create: (c) => tasks[i],
        value: tasks[i],
        child: TaskListItem(
            //   tasks[i].id,
            //   tasks[i].title,
            //   tasks[i].context,
            //   tasks[i].dueDate,
            ),
      ),
      itemCount: tasks.length,
    );
  }
}
