import 'package:flutter/material.dart';

import '../widgets/OutlineList.dart';
import '../widgets/MainDrawer.dart';

class OutlineScreen extends StatelessWidget {
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
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
