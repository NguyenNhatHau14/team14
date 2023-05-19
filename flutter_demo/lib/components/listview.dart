import 'package:flutter/material.dart';

class ListHauView extends StatefulWidget {
  const ListHauView({super.key});

  @override
  State<ListHauView> createState() => _ListHauViewState();
}

class _ListHauViewState extends State<ListHauView> {
  final entries = ['1', '2', '3', '4', '5'];
  final colorCodes = [100, 200, 300, 400, 500];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List view')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int idx) {
          return Container(
            height: 100,
            alignment: Alignment.center,
            color: Colors.orange[colorCodes[idx]],
            child: Text('box ${entries[idx]}'),
          );
        },
        separatorBuilder: (context, idx) => const Divider(),
      ),
    );
  }
}
