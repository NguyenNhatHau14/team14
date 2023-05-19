import 'package:flutter/material.dart';

class AlertMixTextField extends StatefulWidget {
  const AlertMixTextField({super.key});

  @override
  State<AlertMixTextField> createState() => _AlertMixTextFieldState();
}

class _AlertMixTextFieldState extends State<AlertMixTextField> {
  final inputCOntroller = TextEditingController();
  Future<void> _showDia(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('enter number'),
            content: TextField(
              controller: inputCOntroller,
              style: const TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _showDia(context);
            },
            child: const Text('show dia')),
      ),
    );
  }
}
