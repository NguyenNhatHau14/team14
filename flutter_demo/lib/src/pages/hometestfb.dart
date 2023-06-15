import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  final CollectionReference pr = FirebaseFirestore.instance.collection('op');
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String _selectedUnit = 'income';
  double totalIncome = 0.0;
  bool _isScrolling = false;

  Future<void> _update(DocumentSnapshot? documentSnapshot) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toString();
    }
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  onChanged: (value) {
                    if (value.isNotEmpty && double.tryParse(value) == null) {
                      _priceController.clear();
                    }
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedUnit,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedUnit = newValue!;
                    });
                  },
                  items: <String>['income', 'expenses']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Unit',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                        double.tryParse(_priceController.text);
                    if (price != null) {
                      await pr.doc(documentSnapshot!.id).update({
                        'name': name,
                        'price': price,
                        'unit': _selectedUnit,
                        'date': selectedDate,
                      });
                      _nameController.clear();
                      _priceController.clear();
                      _selectedUnit = 'income';
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Future<void> _create() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  onChanged: (value) {
                    if (value.isNotEmpty && double.tryParse(value) == null) {
                      _priceController.clear();
                    }
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedUnit,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedUnit = newValue!;
                    });
                  },
                  items: <String>['income', 'expenses']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Unit',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                        double.tryParse(_priceController.text);
                    if (price != null) {
                      await pr.add({
                        'name': name,
                        'price': price,
                        'unit': _selectedUnit,
                        'date': selectedDate,
                      });
                      _nameController.clear();
                      _priceController.clear();
                      _selectedUnit = 'income';
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  Future<void> _calculateTotalIncome() async {
    final QuerySnapshot snapshot = await pr.get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    double total = 0.0;
    for (final DocumentSnapshot document in documents) {
      final double price = document['price'] ?? 0.0;
      if (document['unit'] == 'income') {
        total += price;
      } else {
        total -= price;
      }
    }
    
    setState(() {
      totalIncome = total;
    });
  }

  Future<void> _delete(String productId) async {
    await pr.doc(productId).delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        opacity: _isScrolling ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            setState(() {
              _isScrolling = true;
            });
          } else if (scrollNotification is ScrollEndNotification) {
            setState(() {
              _isScrolling = false;
            });
          }
          return true;
        },
        child: StreamBuilder<QuerySnapshot>(
          stream: pr.snapshots(),
          builder: (context, streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  final DateTime date = documentSnapshot['date'].toDate();
                  final bool isIncome =
                      documentSnapshot['unit'] == 'income' ? true : false;
                  final TextStyle priceTextStyle = TextStyle(
                    color: isIncome ? Colors.green : Colors.red,
                  );
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: const CircleAvatar(
                          backgroundImage: AssetImage('assets/img/apple.png')),
                      title: Text(documentSnapshot['name'] ?? ''),
                      subtitle: Text(
                        '${date.day}/${date.month}/${date.year}',
                      ),
                      trailing: SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              ' ${documentSnapshot['price'].toString()}',
                              style: priceTextStyle,
                            ),
                            IconButton(
                              onPressed: () => _update(documentSnapshot),
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () => _delete(documentSnapshot.id),
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

