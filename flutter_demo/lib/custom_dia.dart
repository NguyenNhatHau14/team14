import 'package:flutter/material.dart';

class CustomDia extends StatelessWidget {
  const CustomDia({super.key});

  Future<void> _showDIa(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'may nho gi khong'),
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('save'))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('show custom dia'),
          onPressed: () => _showDIa(context),
        ),
      ),
    );
  }
}
