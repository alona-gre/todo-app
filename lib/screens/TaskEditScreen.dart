import "package:flutter/material.dart";

import "package:provider/provider.dart";
import 'package:todo_app/models/Task.dart';
import "../providers/tasks.dart";

class TaskEditScreen extends StatefulWidget {
  static const routeName = './task-edit';

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final _form = GlobalKey<FormState>();
  var _editedTask = Task(
    id: '',
    title: '',
  );

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    Provider.of<Tasks>(context, listen: false).addTask(_editedTask);
    Navigator.of(context).pop;
    // print(_editedTask.title);
    // // print(_editedTask.dueDate);
    // print(_editedTask.context);
    // print(_editedTask.notes);
  }

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments
        as String; // this is how we get the id
    final editedTask = Provider.of<Tasks>(context).findById(taskId);

    return Scaffold(
        appBar: AppBar(
          title: Text(editedTask.title),
          actions: <Widget>[
            TextButton(
              onPressed: _saveForm,
              child: const Text("Save"),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the title";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _editedTask = Task(
                      id: null.toString(),
                      title: newValue.toString(),
                      context: _editedTask.context,
                      notes: _editedTask.notes,
                    );
                  },
                ),
                // TextFormField(
                //   decoration: InputDecoration(labelText: 'Due Date'),
                //   textInputAction: TextInputAction.next,
                //   onSaved: (newValue) {
                //     _editedTask = Task(
                //       id: null.toString(),
                //       title: _editedTask.title,
                //       dueDate: newValue.toString() as DateTime,
                //       context: _editedTask.context,
                //       notes: _editedTask.notes,
                //     );
                //   },
                // ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Context"),
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedTask = Task(
                      id: null.toString(),
                      title: _editedTask.title,
                      context: newValue.toString(),
                      notes: _editedTask.notes,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Notes"),
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedTask = Task(
                      id: null.toString(),
                      title: _editedTask.title,
                      context: _editedTask.context,
                      notes: newValue.toString(),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
