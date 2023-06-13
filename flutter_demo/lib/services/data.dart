import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  final String documentId;

  const Data({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference<Map<String, dynamic>> products =
        FirebaseFirestore.instance.collection('products');
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: products.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            Map<String, dynamic>? data = snapshot.data!.data();
            if (data != null && data.containsKey('name')) {
              return Text('${data['name']}');
            }
          }
          return const Text('No data available');
        }
        return const Text('Loading...');
      },
    );
  }
}
