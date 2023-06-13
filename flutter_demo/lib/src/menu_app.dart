import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/chart_app.dart';
import 'package:flutter_demo/src/pages/home_app.dart';
import 'package:flutter_demo/src/pages/settings.dart';
import 'package:flutter_demo/ThemeProvider.dart';
import 'package:provider/provider.dart';
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

  final user = FirebaseAuth.instance.currentUser!;

  void signUserout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.lightBlue),
          child: Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  user.email!,
                  textScaleFactor: 1.5,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.orange,
          ),
          title: const Text('Over View'),
          onTap: () {
            _showScreen(context, const HomeApp());
          },
        ),
        // ListTile(
        //   leading: const Icon(
        //     Icons.addchart,
        //     color: Colors.green,
        //   ),
        //   title: const Text('Chart'),
        //   onTap: () {
        //     _showScreen(context, const draw1());
        //   },
        // ),
        ListTile(
          leading: const Icon(Icons.settings,
              color: Color.fromARGB(255, 143, 122, 122)),
          title: const Text('Settings'),
          onTap: () {
            _showScreen(context, const SettingApp());
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.dark_mode,
            color: Colors.purple,
          ),
          title: const Text('Dark Mode'),
          trailing: Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleThemeMode();
            },
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.red,
          ),
          title: const Text('Logout'),
          onTap: signUserout,
        ),
      ],
    ));
  }
}
