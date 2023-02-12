import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/Task.dart';

import '../providers/tasks.dart';
import '../screens/TaskPreviewScreen.dart';

class TaskListItem extends StatefulWidget {
  @override
  State<TaskListItem> createState() => _OutlineTaskListState();
}

class _OutlineTaskListState extends State<TaskListItem> {
  // int? selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    var yellow = Icon(
      Icons.star,
      size: 35,
      color: Colors.yellow.shade600,
    );

    return Consumer2<Task, Tasks>(
      builder: ((context, task, tasks, child) => Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            child: ListTile(
              // contentPadding: EdgeInsetsDirectional.only(start: 3),
              // selected: selectedIndex == index ? true : false,
              // selectedTileColor: Color.fromARGB(255, 210, 232, 250),
              // onTap: () {
              //   setState(() {
              //     selectedIndex = index;
              //     task.toggleSelected();
              //   });

              onTap: () {
                Navigator.of(context)
                    .pushNamed(TaskPreviewScreen.routeName, arguments: task.id);
              },
              leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (_) {
                    task.toggleCompleted();
                    tasks.updateCompleted(task);
                  }),
              title: Text(
                task.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    task.context.toString(),
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  Text(
                    task.dueDate != null
                        ? DateFormat.MMMEd().format(task.dueDate as DateTime)
                        : '',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: task.isStarred
                    ? yellow
                    : Icon(Icons.star_border_outlined,
                        size: 35, color: Colors.grey[400]),
                onPressed: () {
                  task.toggleStar();
                  tasks.updateStarred(task);
                },
              ),
            ),
          )),
    );
  }
}
