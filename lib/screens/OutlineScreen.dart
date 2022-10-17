import 'package:flutter/material.dart';

import '../models/taskListItem.dart';
import '../screens/TaskPreviewScreen.dart';

import '../widgets/OutlineTaskList.dart';

class OutlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outline'),
      ),
      body: OutlineTaskList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.green[600],
        onPressed: () => null,
      ),
    );
  }
}
