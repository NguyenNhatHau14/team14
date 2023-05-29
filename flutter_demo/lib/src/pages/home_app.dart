import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/src/data/1.dart';
import 'package:flutter_demo/src/menu_app.dart';
import 'package:flutter_demo/src/widgets/overview/card_body_widget.dart';
import 'package:flutter_demo/ThemeProvider.dart';
import 'package:provider/provider.dart';
import '../widgets/header_widget.dart';
import '../widgets/overview/plus_button_widget.dart';
import 'package:intl/intl.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  //function delete

  final List<Money> moneyItems = [
    Money(
        img: 'iconUpwork.png',
        name: 'up work',
        date: 'today',
        fee: '650',
        type: 'Income'),
    Money(
        img: 'iconUpwork.png',
        name: 'ăn sáng',
        date: 'today',
        fee: '650',
        type: "Expense"),
  ];
  // Function to delete item
  void deleteItem(Money item) {
    setState(() {
      moneyItems.remove(item);
    });
  }

  void handleDataEntered(
    String acount,
    String desc,
    String type,
    DateTime date,
  ) {
    setState(() {
      moneyItems.add(
        Money(
          img: 'iconUpwork.png',
          name: desc,
          date: DateFormat('HH:mm dd/MM/yyyy').format(date),
          fee: acount,
          type: type,
        ),
      );
    });
  }

  // fution lưu giá trị
  void handleEnter(
    String acount,
  ) {}
  bool _visible = true;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

// tránh rò rỉ bộ nhớ
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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Over view'),
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
                      'Transitons History',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black),
                    ),
                    const Text(
                      'see all',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    children: moneyItems
                        .map((item) => CardBody(
                            indexCard: moneyItems.indexOf(item), item: item))
                        .toList()),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: PlusButton(
        visible: _visible,
        onDataEntered: handleDataEntered,
        onTypeSelected: (String) {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
