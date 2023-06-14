import 'package:flutter/material.dart';
import 'package:flutter_demo/src/widgets/overview/product.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_demo/ThemeProvider.dart';
import 'package:flutter_demo/src/menu_app.dart';
import 'package:provider/provider.dart';

import '../widgets/overview/header_widget.dart';
import '../widgets/overview/plus_button_widget.dart';

class Money {
  final double account;
  final DateTime date;
  final String desc;
  final String type;

  Money({
    required this.account,
    required this.date,
    required this.desc,
    required this.type,
  });
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final CollectionReference<Map<String, dynamic>> collectionRef =
      FirebaseFirestore.instance.collection('modal');

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
      'account': account.toString(),
      'desc': desc,
      'type': type,
      'date': DateFormat('yyyy-MM-dd').format(date),
    };

    collectionRef.add(data);
  }

  void handleFormSubmit(
      double? account, String? desc, String? type, DateTime? date) {
    if (account != null && desc != null && type != null && date != null) {
      handleDataEntered(account, desc, type, date);
    } else {
      // Handle the case where any values are null
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
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 300,
              child: ProductListPage(),
            ),
            // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            //   stream:
            //       FirebaseFirestore.instance.collection('modal').snapshots(),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
            //           snapshot) {
            //     if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     }

            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const CircularProgressIndicator();
            //     }

            //     List<Money> moneyItems = snapshot.data!.docs.map((doc) {
            //       return Money(
            //         account: double.parse(doc['account'].toString()),
            //         date: DateTime.parse(doc['date']),
            //         desc: doc['desc'].toString(),
            //         type: doc['type'].toString(),
            //       );
            //     }).toList();

            //     List<CardBody> cardBodies = moneyItems.map((item) {
            //       return CardBody(
            //         indexCard: moneyItems.indexOf(item),
            //         item: item,
            //       );
            //     }).toList();

            //     return Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 15),
            //       child: Column(
            //         children: cardBodies,
            //       ),
            //     );
            //   },
            // ),
            const SizedBox(
              height: 10,
            ),
          ],
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
