import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/tasks.dart';
import 'TaskEditScreen.dart';

class TaskPreviewScreen extends StatelessWidget {
  static const routeName = './task-preview';

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments
        as String; // this is how we get the id

    final taskOnPreview =
        Provider.of<Tasks>(context, listen: true).findById(taskId);

    bool isVisible = false;

    bool showVisibleDueDate() {
      if (taskOnPreview.dueDate != null) {
        isVisible = true;
      } else {
        isVisible = false;
      }
      return isVisible;
    }

    bool showVisibleDueDateTime() {
      if (taskOnPreview.dueDateTime != null) {
        isVisible = true;
      } else {
        isVisible = false;
      }
      return isVisible;
    }

    bool showVisibleDueDateIcon() {
      if (taskOnPreview.dueDate != null || taskOnPreview.dueDateTime != null) {
        isVisible = true;
      } else {
        isVisible = false;
      }
      return isVisible;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Preview'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(TaskEditScreen.routeName, arguments: taskId);
            },
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.check_box_outline_blank,
                      size: 35, color: Colors.grey[400]),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[800],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      TaskEditScreen.routeName,
                      arguments: taskId,
                    );
                  },
                  child: Text(
                    taskOnPreview.title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.timer, size: 15, color: Colors.grey[400]),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[800],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      TaskEditScreen.routeName,
                      arguments: taskId,
                    );
                  },
                  child: Text(
                    taskOnPreview.timeRequired.toString(),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Visibility(
                  visible: showVisibleDueDateIcon(),
                  child: Icon(Icons.calendar_month,
                      size: 15, color: Colors.grey[400]),
                ),
                Visibility(
                  visible: showVisibleDueDate(),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[800],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        TaskEditScreen.routeName,
                        arguments: taskId,
                      );
                    },
                    child: Text(
                      taskOnPreview.dueDate != null
                          ? DateFormat.MMMEd()
                              .format(taskOnPreview.dueDate as DateTime)
                          : '',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Visibility(
                  visible: showVisibleDueDateTime(),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[800],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        TaskEditScreen.routeName,
                        arguments: taskId,
                      );
                    },
                    child: Text(
                      taskOnPreview.dueDateTime != null
                          ? taskOnPreview.dueDateTime!.format(context)
                          : '',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
