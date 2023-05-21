import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_demo/src/menu_app.dart';

class draw1 extends StatefulWidget {
  const draw1({Key? key}) : super(key: key);

  @override
  State<draw1> createState() => _draw1State();
}

class _draw1State extends State<draw1> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int index_color = 0;

  List<charts.Series<MyData, String>> _createSampleData() {
    final data = [
       MyData('Category 1', 5),
       MyData('Category 2', 3),
       MyData('Category 3', 1),
       MyData('Category 4', 7),
    ];

    return [
       charts.Series<MyData, String>(
        id: 'Data',
        domainFn: (MyData data, _) => data.category,
        measureFn: (MyData data, _) => data.value,
        data: data,
      )

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Chart'),
        elevation: 0,
      ),
      drawer: const MenuApp(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  const Text(
                    'chart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: List.generate(4, (index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index_color = index;
        });
      },
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              index_color == index ? Colors.pink : Colors.white,
        ),
        alignment: Alignment.center,
        child: Text(
          day[index],
          style: TextStyle(
            color: index_color == index
                ? Colors.white
                : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(


                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Expense',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ColumnChart(_createSampleData(), animate: true),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Top Spending',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.swap_vert,
                          size: 25,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      'iconUpwork.png',
                      height: 40,
                    ),
                    title: const Text(
                      'mcdonald',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      'jannuary 30,2022',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: const Text(
                      '-100 đ',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyData {
  final String category;
  final int value;

  MyData(this.category, this.value);
}

class ColumnChart extends StatelessWidget {
  final List<charts.Series<MyData, String>> seriesList;
  final bool animate;
  ColumnChart(this.seriesList, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator(
        labelPosition: charts.BarLabelPosition.outside,
        labelAnchor: charts.BarLabelAnchor.middle,
        outsideLabelStyleSpec: charts.TextStyleSpec(
          fontSize: 14,
          color: charts.MaterialPalette.black,
        ),
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelRotation: 0,
          labelAnchor: charts.TickLabelAnchor.centered,
          labelStyle: charts.TextStyleSpec(
            fontSize: 16,
            color: charts.MaterialPalette.black,
          ),
          labelOffsetFromAxisPx: 60
          , 
        ),
      ),
    );
  }
}