import 'package:flutter/material.dart';

class SayMyName extends StatefulWidget {
  const SayMyName({super.key});

  @override
  State<SayMyName> createState() => _SayMyNameState();
}

class _SayMyNameState extends State<SayMyName> {
  String _mess = '';
  final _inputController = TextEditingController();
  void _sayHi() {
    setState(() {
      _mess = "hi, ${_inputController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Say heloo"),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Your name",
                  hintText: "Enter your name"),
            ),
            ElevatedButton(
              onPressed: _sayHi,
              child: const Text("say hi"),
            ),
            Text(
              _mess,
              style: const TextStyle(fontSize: 24),
            )
          ]),
        ),
      ),
    );
  }
}
