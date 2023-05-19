import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
  const MyIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' my icons'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 24,
            ),
            Icon(
              Icons.branding_watermark,
              color: Colors.green,
              size: 24,
            ),
            Icon(
              Icons.audio_file,
              color: Colors.yellow,
              size: 24,
            )
          ]),
    );
  }
}
