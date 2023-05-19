import 'package:flutter/material.dart';

class RadioCheck extends StatefulWidget {
  const RadioCheck({super.key});

  @override
  State<RadioCheck> createState() => _RadioCheckState();
}

class _RadioCheckState extends State<RadioCheck> {
   int _groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text(
          'check radio',
          style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          " ban muon gi",
          style: TextStyle(fontSize: 40),
        ),
        ListTile(
          title: const Text('choi game'),
          leading: Radio(
            groupValue: _groupValue,
            value: 0,
            onChanged: (int? value) {
              setState(()=>_groupValue =value!);
            },
          ),
        ),
        ListTile(
          title: const Text('choi d*'),
          leading: Radio(
            groupValue: _groupValue,
            value: 1,
            onChanged: (int? value) {
              setState(()=>_groupValue =value!);
            },
          ),
        )
      ]),
    );
  }
}
