import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_demo/ThemeProvider.dart';
import 'package:flutter_demo/src/data/1.dart';
import 'package:flutter_demo/src/menu_app.dart';
import 'package:flutter_demo/src/widgets/overview/card_body_widget.dart';
import 'package:flutter_demo/src/widgets/overview/header_widget.dart';
import 'package:flutter_demo/src/widgets/overview/plus_button_widget.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('madal');

  bool _visible = true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _visible = true;
      });
    } else {
      setState(() {
        _visible = false;
      });
    }
  }

 void handleDataEntered(
  double account, String desc, String type, DateTime date) {
  Map<String, dynamic> data = {
    'acount': account.toString(),
    'desc': desc,
    'type': type,
    'date': date.toString(),
  };

  collectionRef.add(data);
}

  void handleFormSubmit(
      String? account, String? desc, String? type, DateTime? date) {
    if (account != null && desc != null && type != null && date != null) {
      double parsedAccount = double.tryParse(account) ?? 0.0;
      handleDataEntered(parsedAccount, desc, type, date);
    } else {
      // Xử lý trường hợp các giá trị null
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
        elevation: 0,
      ),
      drawer: const MenuApp(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
                child: HeaderApp(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transitions History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    const Text(
                      'See All',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot<Object?>>(
                stream: collectionRef.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  List<Money> moneyItems = snapshot.data!.docs.map((doc) {
                    Map<String, dynamic>? data =
                        doc.data() as Map<String, dynamic>?;

                    return Money(
                      img: data!['img'],
                      name: data['name'],
                      date: DateFormat('HH:mm dd/MM/yyyy')
                          .format(data['date'].toDate()),
                      fee: data['fee'],
                      type: data['type'],
                    );
                  }).toList();

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: moneyItems
                          .map(
                            (item) => CardBody(
                              indexCard: moneyItems.indexOf(item),
                              item: item,
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: PlusButton(
        visible: _visible,
        onDataEntered: handleFormSubmit,
        onTypeSelected: (String) {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
