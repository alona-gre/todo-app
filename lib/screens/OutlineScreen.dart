import 'package:flutter/material.dart';

import '../widgets/OutlineList.dart';

class OutlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outline'),
      ),
      body: OutlineList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[600],
        onPressed: () => null,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
