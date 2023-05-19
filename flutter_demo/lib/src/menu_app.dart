import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/chart_app.dart';
import 'package:flutter_demo/src/pages/home_app.dart';
import 'package:flutter_demo/src/pages/settings.dart';

import 'package:page_transition/page_transition.dart';

class MenuApp extends StatefulWidget {
  const MenuApp({super.key});

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  void _showScreen(var context, var screen) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      PageTransition(
          child: screen,
          type: PageTransitionType.rightToLeftWithFade,
          duration: const Duration(microseconds: 500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.lightBlue),
          child: Center(
            child: Text(
              'Information',
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.blue,
          ),
          title: const Text('Over View'),
          onTap: () {
            _showScreen(context, const HomeApp());
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.addchart,
            color: Colors.blue,
          ),
          title: const Text('Chart'),
          onTap: () {
            _showScreen(context, const ChartPage());
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Colors.blue),
          title: const Text('Settings'),
          onTap: () {
            _showScreen(context, const SettingApp());
          },
        ),
      ],
    ));
  }
}
