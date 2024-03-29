import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/CompletedScreen.dart';
import 'package:todo_app/screens/TodayScreen.dart';
import 'package:todo_app/widgets/CompletedList.dart';
import 'package:todo_app/widgets/NewTask.dart';

import './models/Palette.dart';

import './providers/tasks.dart';

import '/screens/OutlineScreen.dart';
import '/screens/TaskPreviewScreen.dart';
import '/screens/TaskEditScreen.dart';
import '/screens/StarredScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Tasks(),
      child: MaterialApp(
        title: 'To Do App',
        theme: ThemeData(
          primarySwatch: Colors.green,
          //Palette.kToDark,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Palette.kToDark,
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontFamily: 'Quicksand',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.black54),
          ),
        ),
        home: OutlineScreen(),
        routes: {
          TaskPreviewScreen.routeName: (ctx) => TaskPreviewScreen(),
          TaskEditScreen.routeName: (ctx) => TaskEditScreen(),
          StarredScreen.routeName: (ctx) => StarredScreen(),
          TodayScreen.routeName: (ctx) => TodayScreen(),
          NewTask.routeName: (ctx) => NewTask(),
          CompletedScreen.routeName: (ctx) => CompletedScreen(),
        },
      ),
    );
  }
}
