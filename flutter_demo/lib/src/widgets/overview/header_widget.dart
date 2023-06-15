import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  final double totalIncome;
  const HeaderApp({super.key, required this.totalIncome});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
          ],
        ),
        Positioned(
          top: 60,
          left: 40,
          right: 40,
          child: Container(
            width: 320,
            height: 170,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      spreadRadius: 6,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                      color: Colors.black38)
                ],
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 19, 93, 154)),
            child: const Column(
              children: [
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Balance',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white54,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.more_horiz,
                          size: 34,
                          color: Colors.white,
                        )
                      ]),
                ),
                SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        '\$ 123.5',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.white54,
                            child: Icon(
                              Icons.arrow_upward,
                              size: 25,
                              color: Color.fromARGB(255, 36, 139, 39),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.greenAccent,
                                fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: Colors.white54,
                            child: Icon(
                              Icons.arrow_downward,
                              size: 25,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Expenses',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' 55',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$ 234.5',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
