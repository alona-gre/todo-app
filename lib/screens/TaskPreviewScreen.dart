import 'dart:ui';

import "package:flutter/material.dart";
import 'package:todo_app/screens/TaskEditScreen.dart';

class TaskPreviewScreen extends StatelessWidget {
  static const routeName = './task-preview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task Preview'),
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => TaskEditScreen()),
                    );
                  },
                  child: Text(
                    'Task Title',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
