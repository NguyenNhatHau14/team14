import 'package:flutter/material.dart';

class SingleChildScroll extends StatelessWidget {
  const SingleChildScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text('single child Scroll view'),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          color: Colors.red,
          padding: const EdgeInsets.all(100),
          child: const Text('box1'),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.blue,
          padding: const EdgeInsets.all(100),
          child: const Text('box2'),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.yellow,
          padding: const EdgeInsets.all(100),
          child: const Text('box3'),
        ),
      ]),
    );
  }
}
