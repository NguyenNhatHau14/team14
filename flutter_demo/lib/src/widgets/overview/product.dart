import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('madal').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                String documentId = documents[index].id;
                Map<String, dynamic> data =
                    documents[index].data() as Map<String, dynamic>;

                String productDesc = data['desc'] ?? '';
                double productPrice = (data['account'] ?? 1).toDouble();

                return ListTile(
                  title: Text(productDesc),
                  subtitle: Text('Price: \$${productPrice.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
