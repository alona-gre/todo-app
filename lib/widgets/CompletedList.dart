import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/TaskListItem.dart';

import '../providers/tasks.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<Tasks>(context, listen: true);
    final completedTasks = tasks.completedTasks;

    return ListView.builder(
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: completedTasks[i],
        child: TaskListItem(),
      ),
      itemCount: completedTasks.length,
    );
  }
}


// ListView.builder(
//       itemBuilder: (context, i) => ChangeNotifierProvider.value(
//         value: tasks[i],
//         child: TaskListItem(),
//       ),
//       itemCount: tasks.length,
//     );
