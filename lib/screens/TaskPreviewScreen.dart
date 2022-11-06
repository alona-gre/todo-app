import 'dart:io';
import 'package:intl/intl.dart';

import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../screens/TaskEditScreen.dart';
import '../providers/tasks.dart';

class TaskPreviewScreen extends StatelessWidget {
  // final String title;

  // TaskPreviewScreen(this.title);

  static const routeName = './task-preview';

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments
        as String; // this is how we get the id

    final taskOnPreview =
        Provider.of<Tasks>(context, listen: false).findById(taskId);

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
                children: <Widget>[
                  Icon(Icons.watch, size: 15, color: Colors.grey[400]),
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
                      ('${taskOnPreview.timeRequired} hours'),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.calendar_month, size: 15, color: Colors.grey[400]),
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
                      DateFormat.MMMEd()
                          .format(taskOnPreview.dueDate as DateTime),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
