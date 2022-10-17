import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/Palette.dart';

import './providers/tasks.dart';

import '/screens/OutlineScreen.dart';
import '/screens/TaskPreviewScreen.dart';
import '/screens/TaskEditScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
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
          ),
        ),
        home: PageView(
          children: [
            OutlineScreen(),
            TaskPreviewScreen(),
          ],
        ),
        routes: {
          TaskPreviewScreen.routeName: (context) => TaskPreviewScreen(),
          TaskEditScreen.routeName: (context) => TaskEditScreen(),
        },
      ),
    );
  }
}
