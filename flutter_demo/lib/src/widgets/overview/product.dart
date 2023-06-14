import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

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
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                DateTime date = data['date'] != null
                    ? data['date'].toDate()
                    : DateTime.now();
                String productDesc = data['desc'] ?? '';
                String type = data['type'] ?? '';
                Color priceColor = type == 'income' ? Colors.green : Colors.red;
                double productPrice = (data['account'] ?? 1).toDouble();
                String priceText = type == 'income'
                    ? '+ ${productPrice.toStringAsFixed(2)}'
                    : '- ${productPrice.toStringAsFixed(2)}';
                Color tileColor =
                    index % 2 == 0 ? Colors.lightBlueAccent : Colors.green;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: tileColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          tileColor:
                              Colors.transparent, // Xóa đường kẻ dưới ListTile
                          leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/img/apple.png')),
                          title: Text(productDesc),
                          subtitle: Text(DateFormat('dd/MM/yyyy').format(date)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                priceText,
                                style: TextStyle(color: priceColor),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Khoảng cách 10 giữa các ListTile
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
