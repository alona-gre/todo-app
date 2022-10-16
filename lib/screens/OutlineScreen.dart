import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/taskListItem.dart';
import '../screens/TaskPreviewScreen.dart';

class OutlineScreen extends StatefulWidget {
  @override
  State<OutlineScreen> createState() => _OutlineScreenState();
}

class _OutlineScreenState extends State<OutlineScreen> {
  int? selectedIndex = null;

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
            //                           child: (GestureDetector(onTap: () {
            //   Navigator.of(context).pushNamed(TaskPreviewScreen.routeName, arguments: addedTasks[index].id);
            // }),),

            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            child: ListTile(
              contentPadding: EdgeInsetsDirectional.only(start: 3),
              selected: selectedIndex == index ? true : false,
              selectedTileColor: Color.fromARGB(255, 210, 232, 250),
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
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
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  Text(
                    DateFormat.MMMEd().format(addedTasks[index].dueDate),
                    style: TextStyle(color: Colors.grey[800]),
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
