import 'package:flutter/material.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang home'),
      ),
      body: const Center(
        child: Text('Đây là trang home'),
      ),
    );
  }
}