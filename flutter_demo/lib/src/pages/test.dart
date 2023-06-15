import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/hometestfb.dart';
import 'package:flutter_demo/src/widgets/overview/header_widget.dart';

import '../menu_app.dart';

class Test extends StatefulWidget {
  const Test({
    super.key,
  });

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  double totalIncome = 5;
  void updateTotalIncome(double income) {
    setState(() {
      totalIncome = income;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
        elevation: 0,
      ),
      drawer: const MenuApp(),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: HeaderApp(
              totalIncome: totalIncome,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Transitions History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: HomeTest()),
        ],
      ),
    );
  }
}
