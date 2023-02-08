import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "package:provider/provider.dart";
import 'package:todo_app/models/Task.dart';
import "../providers/tasks.dart";

class TaskEditScreen extends StatefulWidget {
  static const routeName = './task-edit';

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  DateTime? _selectedDate;
  final _form = GlobalKey<FormState>();
  var _editedTask = Task(
    id: null.toString(),
    title: '',
    timeRequired: 0,
    dueDate: null,
  );
  var _isInit = true;
  var _initValues = {
    'title': '',
    'timeRequired': '',
    'dueDate': '',
  };

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (_editedTask.id != null) {
      Provider.of<Tasks>(context, listen: false)
          .updateTask(_editedTask.id, _editedTask);
    } else {
      Provider.of<Tasks>(context, listen: false).addTask(_editedTask);
    }

    Navigator.of(context).pop();
    print(_editedTask.title);
    print(_editedTask.timeRequired);
    // print(_editedTask.dueDate);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final taskId = ModalRoute.of(context)!.settings.arguments
          as String; // this is how we get the id
      if (taskId != null) {
        final _editedTask =
            Provider.of<Tasks>(context, listen: false).findById(taskId);
        _initValues = {
          'title': _editedTask.title,
          'timeRequired': _editedTask.timeRequired.toString(),
          'dueDate': _editedTask.dueDate.toString(),
        };
      }
      ;
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_editedTask.title),
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
                  initialValue: _initValues['title'],
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
                      timeRequired: _editedTask.timeRequired,
                      dueDate: _editedTask.dueDate,
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
                  decoration: InputDecoration(labelText: "Time Required"),
                  initialValue: _initValues['timeRequired'],
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedTask = Task(
                      id: null.toString(),
                      title: _editedTask.title,
                      timeRequired: double.parse(newValue.toString()),
                      dueDate: _editedTask.dueDate,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Due Date"),
                  initialValue: _initValues['dueDate'],
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedTask = Task(
                      id: null.toString(),
                      title: _editedTask.title,
                      timeRequired: _editedTask.timeRequired,
                      dueDate: _selectedDate,
                    );
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Theme.of(context).primaryColor,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: Text('Choose date'),
                      onPressed: _presentDatePicker,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
