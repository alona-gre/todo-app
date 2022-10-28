import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/screens/TodayScreen.dart';

import '../screens/StarredScreen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("MLO"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.inbox),
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushReplacementNamed(StarredScreen.routeName);
                    },
                  ),
                  const Text("Inbox"),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(StarredScreen.routeName);
                    },
                  ),
                  const Text("Starred"),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.near_me),
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushReplacementNamed(StarredScreen.routeName);
                    },
                  ),
                  const Text("Nearby"),
                ],
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Today"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TodayScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text("All Tasks"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
    );
  }
}
