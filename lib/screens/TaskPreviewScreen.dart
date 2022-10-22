import 'dart:io';

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
    final taskId =
        ModalRoute.of(context)!.settings.arguments; // this is how we get the id

    final taskOnPreview = Provider.of<Tasks>(context).items.firstWhere(
          (tsk) => tsk.id == taskId,
        );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Task Preview'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  TaskEditScreen.routeName,
                  arguments: taskId,
                );
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        body: Column(
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
            )
          ],
        ));
  }
}
