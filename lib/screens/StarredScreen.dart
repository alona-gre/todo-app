import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import "package:flutter/material.dart";

import '../widgets/MainDrawer.dart';
import '../widgets/StarredList.dart';

class StarredScreen extends StatelessWidget {
  static const routeName = './starred';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Starred'),
      ),
      body: StarredList(),
      drawer: const MainDrawer(),
    );
  }
}
