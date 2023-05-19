import 'package:flutter/material.dart';

class Swhau extends StatefulWidget {
  const Swhau({super.key});

  @override
  State<Swhau> createState() => _SwhauState();
}

class _SwhauState extends State<Swhau> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('switch'),
      ),
      body: Row(
        children: [
          const Text(
            'wifi',
            style: TextStyle(fontSize: 25),
          ),
          const Spacer(),
          Switch(
              value: _isOn,
              onChanged: (bool? value) {
                setState(() => _isOn = value!);
              })
        ],
      ),
    );
  }
}
