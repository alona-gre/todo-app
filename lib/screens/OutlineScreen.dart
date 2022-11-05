import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/OutlineList.dart';
import '../widgets/MainDrawer.dart';
import '../widgets/NewTask.dart';
import '../widgets/NewTask.dart';

class OutlineScreen extends StatelessWidget {
  void _startAddTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTask(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outline'),
      ),
      body: OutlineList(),
      drawer: MainDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[600],
        onPressed: () {
          _startAddTask(context);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
