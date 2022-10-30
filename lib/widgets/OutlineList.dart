import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/screens/TaskPreviewScreen.dart';
import '../widgets/TaskListItem.dart';
import '../providers/tasks.dart';

class OutlineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context, listen: true);
    final tasks = tasksData.items;

    return

        // GestureDetector(
        //       onPanUpdate: (details) {
        //         // Swiping in right direction.
        //         if (details.delta.dx > 0) {}
        //         // Swiping in left direction.
        //         if (details.delta.dx < 0) {
        //           Navigator.of(context).pushNamed(
        //             TaskPreviewScreen.routeName,
        //             arguments: tasks[i].id,
        //           );
        //         }
        //       },
        //       child:

        ListView.builder(
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
