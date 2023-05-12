import 'package:flutter/material.dart';

class FullDia extends StatefulWidget {
  const FullDia({super.key});

  @override
  State<FullDia> createState() => _FullDiaState();
}

class _FullDiaState extends State<FullDia> {
  Future<Object?> _showDia(BuildContext context) async {
    return showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'hello full man hinh ne',
                    style: TextStyle(fontSize: 24),
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('tat'))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: const Text('full màn hình'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('mo full man hinh'),
          onPressed: () {
            _showDia(context);
          },
        ),
      ),
    );
  }
}
