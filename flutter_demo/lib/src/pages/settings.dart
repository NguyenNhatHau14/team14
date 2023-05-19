import 'package:flutter/material.dart';
import 'package:flutter_demo/src/menu_app.dart';

class SettingApp extends StatelessWidget {
  const SettingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang 2'),
      ),
      drawer: const MenuApp(),
      body: const Center(
        child: Text('Đây là trang 2'),
      ),
    );
  }
}
