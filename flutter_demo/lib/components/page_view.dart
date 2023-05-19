import 'package:flutter/material.dart';

class PageViewHau extends StatefulWidget {
  const PageViewHau({super.key});

  @override
  State<PageViewHau> createState() => _PageViewHauState();
}

class _PageViewHauState extends State<PageViewHau> {
  final pageControll = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page view'),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: pageControll,
        children: const [
          Center(
            child: Text(
              'first page',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Center(
            child: Text(
              'first page',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Center(
            child: Text(
              'first page',
              style: TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
    );
  }
}
