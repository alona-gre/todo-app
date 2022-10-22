import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/TaskPreviewScreen.dart';

import '../providers/tasks.dart';
import '../models/Task.dart';

class TaskListItem extends StatefulWidget {
  // final String id;
  // final String title;
  // final String? context;
  // final DateTime dueDate;

  // TaskListItem(this.id, this.title, this.context, this.dueDate);

  @override
  State<TaskListItem> createState() => _OutlineTaskListState();
}

class _OutlineTaskListState extends State<TaskListItem> {
  //int? selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);

    return GestureDetector(
      onPanUpdate: (details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {}
        // Swiping in left direction.
        if (details.delta.dx < 0) {
          Navigator.of(context).pushNamed(
            TaskPreviewScreen.routeName,
            arguments: task.id,
          );
        }
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: ListTile(
          contentPadding: EdgeInsetsDirectional.only(start: 3),
          // selected: selectedIndex == index ? true : false,
          // selectedTileColor: Color.fromARGB(255, 210, 232, 250),
          // onTap: () {
          //   setState(() {
          //     selectedIndex = index;
          //   });
          // },
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.check_box_outline_blank,
                size: 35, color: Colors.grey[400]),
          ),
          title: Text(
            task.title,
            //widget.title,
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
                DateFormat.MMMEd().format(task.dueDate),
                style: TextStyle(color: Colors.grey[800]),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: null,
            icon: Icon(Icons.star_border_outlined,
                size: 35, color: Colors.grey[400]),
          ),
        ),
      ),
    );
  }
}
