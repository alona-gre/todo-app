import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/taskListItem.dart';

class OutlineScreen extends StatelessWidget {
  final List<TaskListItem> addedTasks = [
    TaskListItem(
      id: 't1',
      title: 'Buy milk',
      context: '@Home',
      dueDate: DateTime.now(),
    ),
    TaskListItem(
      id: 't2',
      title: 'Call boss',
      dueDate: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outline'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            child: ListTile(
              contentPadding: EdgeInsetsDirectional.only(start: 3),
              leading: IconButton(
                onPressed: null,
                icon: Icon(Icons.check_box_outline_blank,
                    size: 35, color: Colors.grey[400]),
              ),
              title: Text(
                addedTasks[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    addedTasks[index].context.toString(),
                  ),
                  Text(
                    DateFormat.MMMEd().format(addedTasks[index].dueDate),
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: null,
                icon: Icon(Icons.star_border_outlined,
                    size: 35, color: Colors.grey[400]),
              ),
            ),
          );
        },
        itemCount: addedTasks.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.green[600],
        onPressed: () => null,
      ),
    );
  }
}
