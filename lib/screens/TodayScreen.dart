import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/OutlineList.dart';

import '../widgets/todayView/TodayView.dart';
import '../widgets/MainDrawer.dart';

class TodayScreen extends StatefulWidget {
  static const routeName = './today';

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TodayView(),
            Container(
              height: 600,
              child: OutlineList(),
            )
          ],
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}
