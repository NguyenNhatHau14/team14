import 'package:flutter/material.dart';

class IcBut extends StatefulWidget {
  const IcBut({super.key});

  @override
  State<IcBut> createState() => _IcButState();
}

class _IcButState extends State<IcBut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("icon button"),
          centerTitle: true,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.volume_down),
                  color: Colors.red,
                  iconSize: 60,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.voice_chat),
                  color: Colors.blue,
                  iconSize: 69,
                )
              ],
            )
          ],
        ));
  }
}
