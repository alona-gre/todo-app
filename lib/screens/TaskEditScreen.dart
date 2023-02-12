import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "package:provider/provider.dart";
import 'package:todo_app/providers/Task.dart';
import "../providers/tasks.dart";

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

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    if (_editedTask.id.isNotEmpty) {
      Provider.of<Tasks>(context, listen: false).updateTask(
        _editedTask.id,
        Task(
          id: _editedTask.id,
          title: _editedTask.title,
          timeRequired: _editedTask.timeRequired,
          dueDate: _selectedDate,
          dueDateTime: _selectedTime,
        ),
      );
    } else {
      Provider.of<Tasks>(context, listen: false).addTask(_editedTask);
    }

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final taskId = ModalRoute.of(context)!.settings.arguments
          as String; // this is how we get the id
      if (taskId.isNotEmpty) {
        _editedTask =
            Provider.of<Tasks>(context, listen: false).findById(taskId);
        _titleController.text = _editedTask.title;
        _timeRequiredController.text = _editedTask.timeRequired.toString();
        _selectedDate = _editedTask.dueDate;
        _selectedTime = _editedTask.dueDateTime;
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
              SizedBox(
                height: 20,
              ),
              const Text(style: TextStyle(fontSize: 12), 'Date & Time'),
              Column(
                children: <Widget>[
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
                        onPressed: _presentDatePicker,
                        child: _selectedDate == null
                            ? const Text('Set date')
                            : const Text('Edit date'),
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
                        onPressed: _presentTimePicker,
                        child: _selectedTime == null
                            ? const Text('Set time')
                            : const Text('Edit time'),
                      ),
                    ],
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
