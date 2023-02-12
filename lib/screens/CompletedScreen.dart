import "package:flutter/material.dart";

import '../widgets/MainDrawer.dart';
import '../widgets/CompletedList.dart';

class CompletedScreen extends StatelessWidget {
  static const routeName = './completed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed'),
      ),
      body: CompletedList(),
      drawer: const MainDrawer(),
    );
  }
}
