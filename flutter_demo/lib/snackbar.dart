import 'package:flutter/material.dart';

class snackbarTest extends StatelessWidget {
  const snackbarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Snackbar'),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Hello, Hau'),
              ),
            );
          },
        ),
      ),
    );
  }
}
