import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/home_app.dart';
import 'ThemeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drawer Navigation',
       theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: HomeApp(),
    );
  }
}
