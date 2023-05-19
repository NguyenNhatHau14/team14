import 'package:flutter/material.dart';

class SayHello extends StatefulWidget {
  const SayHello({super.key});

  @override
  State<SayHello> createState() => _SayHelloState();
}

class _SayHelloState extends State<SayHello> {
  String _mess = '';

  void _sayHi() {
    setState(() {
      _mess = "hi, hau}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('say hello'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _sayHi,
                child: const Text(
                  'Say Hi',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Text(
                _mess,
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
