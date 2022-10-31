import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/TaskListItem.dart';
import '../providers/tasks.dart';

class OutlineList extends StatefulWidget {
  @override
  State<OutlineList> createState() => _OutlineListState();
}

class _OutlineListState extends State<OutlineList> {
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
        //child:
        ListView.builder(
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        // create: (c) => tasks[i],
        value: tasks[i],
        child: Dismissible(
          key: ValueKey(tasks),
          onDismissed: (direction) {
            // Remove the dismissed item from the list
            Provider.of<Tasks>(context, listen: false).deleteTask(tasks[i].id);
          },
          background: Container(
            color: Theme.of(context).errorColor,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,
            ),
          ),
          direction: DismissDirection.endToStart,
          child: TaskListItem(
              //   tasks[i].id,
              //   tasks[i].title,
              //   tasks[i].context,
              //   tasks[i].dueDate,
              ),
        ),
      ),
      itemCount: tasks.length,
    );
  }
}
