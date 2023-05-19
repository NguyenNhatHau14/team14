import 'package:flutter/material.dart';

class ImgBackground extends StatelessWidget {
  const ImgBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Img_button"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/imgdemo.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Column(
          children: const [
            ListTile(
              leading: FlutterLogo(),
              title: Text(
                "day la vi du",
                style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('hau'),
              ),
              title: Text('circle avata here'),
              trailing: Icon(Icons.abc),
            )
          ],
        ),
      ),
    );
  }
}
