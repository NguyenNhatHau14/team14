import 'package:flutter/material.dart';

class Img extends StatefulWidget {
  const Img({super.key});

  @override
  State<Img> createState() => _ImgState();
}

class _ImgState extends State<Img> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Img'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          'assets/img/imgdemo.jpeg',
        ),
      ),
    );
  }
}
