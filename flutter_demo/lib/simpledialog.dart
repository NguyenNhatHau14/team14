import 'package:flutter/material.dart';

class SimpleHau extends StatefulWidget {
  const SimpleHau({super.key});

  @override
  State<SimpleHau> createState() => _SimpleHauState();
}

Future<void> _showDiaLog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('select an option'),
          children: [
            SimpleDialogOption(
              onPressed: () {},
              child: const Text(
                'mai an chuoi',
              ),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('mai an buoi'),
            ),
          ],
        );
      });
}

class _SimpleHauState extends State<SimpleHau> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text('test simple'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('đưa ra lựa chọn đi'),
          onPressed: () {
            _showDiaLog(context);
          },
        ),
      ),
    );
  }
}
