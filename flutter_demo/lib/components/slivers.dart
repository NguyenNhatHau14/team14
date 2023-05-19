import 'package:flutter/material.dart';

class sliHau extends StatefulWidget {
  const sliHau({super.key});

  @override
  State<sliHau> createState() => _sliHauState();
}

class _sliHauState extends State<sliHau> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          child: CustomScrollView(slivers: [
        const SliverAppBar(
          pinned: true,
          floating: true,
          expandedHeight: 160,
          backgroundColor: Colors.orange,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('slivers appbar'),
            background: FlutterLogo(),
          ),
        ),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 30,
          child: Center(
            child: Text('Scroll...............................'),
          ),
        )),
        SliverFixedExtentList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.orange[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            }),
            itemExtent: 50)
      ])),
    );
  }
}
