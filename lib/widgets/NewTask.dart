import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:todo_app/providers/Task.dart';

import '../providers/tasks.dart';

class NewTask extends StatefulWidget {
  static const routeName = './new-task-copy';

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _form = GlobalKey<FormState>();

  var _newTask = Task(
    id: '',
    title: ' ',
    timeRequired: 0,
    dueDate: null,
    dueDateTime: null,
  );

  void _submitForm() {
    _form.currentState!.save;

    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount.toString().isEmpty ||
        enteredAmount <= 0) {
      return;
    }

    Provider.of<Tasks>(context, listen: false).addTask(
      Task(
        id: DateTime.now().toString(),
        title: enteredTitle,
        timeRequired: enteredAmount,
        dueDate: _selectedDate,
        dueDateTime: _selectedTime,
      ),
    );
    print(_newTask.title);
    print(_newTask.timeRequired);
    print(_newTask.dueDate);
    print(_newTask.dueDateTime);

    Navigator.of(context).pop();
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _titleController.dispose();
    _amountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  _newTask = Task(
                    id: null.toString(),
                    title: value.toString(),
                    dueDate: _selectedDate,
                    timeRequired: _newTask.timeRequired,
                    dueDateTime: _selectedTime,
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Hours'),
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  Task(
                    id: null.toString(),
                    title: _newTask.title,
                    dueDate: _selectedDate,
                    timeRequired: double.parse(
                      value.toString(),
                    ),
                    dueDateTime: _selectedTime,
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter the required time in hours";
                  }
                  if (double.tryParse(value) == null ||
                      double.tryParse(value)! <= 0) {
                    return "Enter a valid number";
                  }
                  return null;
                },
              ),
              Container(
                height: 70,
                child: Row(
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
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedTime == null
                            ? 'No time set!'
                            : 'Picked Time: ${_selectedTime!.format(context)}',
                      ),
                    ),
                    TextButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Theme.of(context).primaryColor,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: Text('Set time'),
                      onPressed: _presentTimePicker,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Task'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
