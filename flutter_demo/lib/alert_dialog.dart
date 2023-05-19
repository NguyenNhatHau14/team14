import 'package:flutter/material.dart';

class AlertHau extends StatelessWidget {
  const AlertHau({super.key});
  Future<void> _showDia(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dialog'),
            content: const Text('quay dau la bo'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok bro'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('alert')),
      body: Center(
        child: ElevatedButton(
          child: const Text('show dialog'),
          onPressed: () {
            _showDia(context);
          },
        ),
      ),
    );
  }
}
