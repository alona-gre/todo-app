import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "package:provider/provider.dart";
import 'package:todo_app/models/Task.dart';
import 'package:todo_app/screens/StarredScreen.dart';
import "../providers/tasks.dart";
import 'TaskPreviewScreen.dart';

class TaskEditScreen extends StatefulWidget {
  const TaskEditScreen({super.key});

  static const routeName = './task-edit';

  @override
  State<TaskEditScreen> createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final _titleController = TextEditingController();
  final _timeRequiredController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _form = GlobalKey<FormState>();
  var _editedTask = Task(
    id: '',
    title: '',
    timeRequired: 0,
    dueDate: DateTime.now(),
    dueDateTime: TimeOfDay.now(),
  );

  var _isInit = true;
  var _initValues = {
    'title': '',
    'timeRequired': '',
    'dueDate': '',
    'dueDateTime': '',
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (_editedTask.id.isNotEmpty) {
      Provider.of<Tasks>(context, listen: false)
          .updateTask(_editedTask.id, _editedTask);
      print('something');
    } else {
      Provider.of<Tasks>(context, listen: false).addTask(_editedTask);
    }

    Navigator.of(context).pop();
    print(_editedTask.title);
    print(_editedTask.timeRequired);
    print(_editedTask.dueDate);
    print(_editedTask.dueDateTime);
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final taskId = ModalRoute.of(context)!.settings.arguments
          as String; // this is how we get the id
      if (taskId.isNotEmpty) {
        _editedTask =
            Provider.of<Tasks>(context, listen: false).findById(taskId);
        _initValues = {
          'title': '',
          'timeRequired': '',
          'dueDate': _editedTask.dueDate.toString(),
          'dueDateTime': _editedTask.dueDateTime.toString(),
        };
        _titleController.text = _editedTask.title;
        _timeRequiredController.text = _editedTask.timeRequired.toString();
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _timeRequiredController.dispose();
    super.dispose();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
    print('...');
  }

  void _presentTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedTime = value;
      });
      print('...');
    });
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
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the title";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedTask = Task(
                    id: _editedTask.id,
                    title: newValue.toString(),
                    timeRequired: _editedTask.timeRequired,
                    dueDate: _editedTask.dueDate,
                    dueDateTime: _editedTask.dueDateTime,
                  );
                },
              ),
              TextFormField(
                controller: _timeRequiredController,
                decoration: const InputDecoration(labelText: 'Time Required'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the time required";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedTask = Task(
                    id: _editedTask.id,
                    title: _editedTask.title,
                    timeRequired: double.parse(newValue.toString()),
                    dueDate: _editedTask.dueDate,
                    dueDateTime: _editedTask.dueDateTime,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Due Date"),
                initialValue: _initValues['dueDate'],
                textInputAction: TextInputAction.next,
                onChanged: (newValue) {
                  _editedTask = Task(
                    id: null.toString(),
                    title: _editedTask.title,
                    timeRequired: _editedTask.timeRequired,
                    dueDate: _editedTask.dueDate,
                    dueDateTime: _editedTask.dueDateTime,
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedTime == null
                          ? 'No time set!'
                          : 'Picked Date: ${_selectedTime!.format(context)}',
                    ),
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Text('Choose time'),
                    onPressed: _presentTimePicker,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
