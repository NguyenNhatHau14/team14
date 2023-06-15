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





class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {



  @override
  Widget build(BuildContext context) {
   
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
