import 'package:flutter/material.dart';

class Inkwell1 extends StatefulWidget {
  const Inkwell1({super.key});

  @override
  State<Inkwell1> createState() => _Inkwell1State();
}

class _Inkwell1State extends State<Inkwell1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Center(
          child: InkWell(
        onTap: () {},
        child: Image.asset('assets/img/imgdemo.jpeg'),
      )),
    );
  }
}
