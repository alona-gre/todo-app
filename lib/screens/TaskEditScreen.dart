import "package:flutter/material.dart";

import "package:provider/provider.dart";
import "../providers/tasks.dart";

class TaskEditScreen extends StatelessWidget {
  static const routeName = './task-edit';

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments
        as String; // this is how we get the id
    final editedTask = Provider.of<Tasks>(context).findById(taskId);

    return Scaffold(
        appBar: AppBar(
          title: Text(editedTask.title),
        ),
        body: Column());
  }
}
