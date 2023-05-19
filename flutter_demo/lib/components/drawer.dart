import 'package:flutter/material.dart';

class DrawerHau extends StatefulWidget {
  const DrawerHau({super.key});

  @override
  State<DrawerHau> createState() => _DrawerHauState();
}

class _DrawerHauState extends State<DrawerHau> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                'Hau đẹp trau',
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.traffic_sharp),
              title: const Text('thử 1'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.ac_unit_outlined),
              title: const Text('thử 2'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.car_crash),
              title: const Text('thử 3'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: const Center(child: Text('this is body appp')),
    );
  }
}
