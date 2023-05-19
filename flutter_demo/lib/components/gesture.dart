import 'package:flutter/material.dart';

class GestureHau extends StatefulWidget {
  const GestureHau({super.key});

  @override
  State<GestureHau> createState() => _GestureHauState();
}

class _GestureHauState extends State<GestureHau> {
  var _bgColor = Colors.red;
  void _changeColor(var color) {
    setState(() {
      _bgColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('gesture')),
      body: GestureDetector(
        onTap: () => _changeColor(Colors.orange),
        onDoubleTap: () => _changeColor(Colors.yellow),
        onLongPress: () => _changeColor(Colors.blue),
        onHorizontalDragDown: (_) => _changeColor(Colors.green),
        child: Container(
          color: _bgColor,
        ),
      ),
    );
  }
}
