import 'package:flutter/material.dart';

class GridHau extends StatefulWidget {
  const GridHau({super.key});

  @override
  State<GridHau> createState() => _GridHauState();
}

class _GridHauState extends State<GridHau> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('grid'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: const Text('box 1'),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: const Text('box 2'),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: const Text('box 3'),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: const Text('box 5'),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.orange,
            child: const Text('box 4'),
          )
        ],
      ),
    );
  }
}
