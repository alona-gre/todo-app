import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/TaskPreviewScreen.dart';

import '../providers/tasks.dart';

class OutlineTaskListItem extends StatefulWidget {
  final String id;
  final String title;
  final String? context;
  final DateTime dueDate;

  OutlineTaskListItem(this.id, this.title, this.context, this.dueDate);

  @override
  State<OutlineTaskListItem> createState() => _OutlineTaskListState();
}

class _OutlineTaskListState extends State<OutlineTaskListItem> {
  //int? selectedIndex = null;

  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);
    final tasks = tasksData.items;

    return GestureDetector(
      onDoubleTap: () {},
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: ListTile(
          contentPadding: EdgeInsetsDirectional.only(start: 3),
          // selected: selectedIndex == index ? true : false,
          // selectedTileColor: Color.fromARGB(255, 210, 232, 250),
          // onTap: () {
          //   setState(() {
          //     selectedIndex = index;
          //   });
          // },
          leading: IconButton(
            onPressed: null,
            icon: Icon(Icons.check_box_outline_blank,
                size: 35, color: Colors.grey[400]),
          ),
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                widget.context.toString(),
                style: TextStyle(color: Colors.grey[800]),
              ),
              Text(
                DateFormat.MMMEd().format(widget.dueDate),
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
      ),
    );
  }
}
