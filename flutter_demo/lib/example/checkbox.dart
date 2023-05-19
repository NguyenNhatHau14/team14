import 'package:flutter/material.dart';

class Checkbox2 extends StatefulWidget {
  const Checkbox2({super.key});

  @override
  State<Checkbox2> createState() => _Checkbox2State();
}

class _Checkbox2State extends State<Checkbox2> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('check box')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 2,
            child: Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
          ),
          const Text(
            "Remeber me",
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
