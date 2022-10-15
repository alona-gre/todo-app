import 'package:flutter/material.dart';

import './models/palette.dart';

import './screens/outline.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: OutlineScreen(),
    );
  }
}
