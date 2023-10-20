// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_node/Controlleur/IndexControlleur.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<FlSpot> spots = const [
    FlSpot(1.68, 21.04),
    FlSpot(2.84, 26.23),
    FlSpot(5.19, 19.82),
    FlSpot(6.01, 24.49),
    FlSpot(7.81, 19.82),
    FlSpot(9.49, 23.50),
    FlSpot(12.26, 19.57),
    FlSpot(15.63, 20.90),
    FlSpot(20.39, 39.20),
    FlSpot(23.69, 75.62),
    FlSpot(26.21, 46.58),
    FlSpot(29.87, 42.97),
    FlSpot(32.49, 46.54),
    FlSpot(35.09, 40.72),
    FlSpot(38.74, 43.18),
    FlSpot(41.47, 59.91),
    FlSpot(43.12, 53.18),
    FlSpot(46.30, 90.10),
    FlSpot(47.88, 81.59),
    FlSpot(51.71, 75.53),
    FlSpot(54.21, 78.95),
    FlSpot(55.23, 86.94),
    FlSpot(57.40, 78.98),
    FlSpot(60.49, 74.38),
    FlSpot(64.30, 48.34),
    FlSpot(67.17, 70.74),
    FlSpot(70.35, 75.43),
    FlSpot(73.39, 69.88),
    FlSpot(75.87, 80.04),
    FlSpot(77.32, 74.38),
    FlSpot(81.43, 68.43),
    FlSpot(86.12, 69.45),
    FlSpot(90.06, 78.60),
    FlSpot(94.68, 46.05),
    FlSpot(98.35, 42.80),
    FlSpot(101.25, 53.05),
    FlSpot(103.07, 46.06),
    FlSpot(106.65, 42.31),
    FlSpot(108.20, 32.64),
    FlSpot(110.40, 45.14),
    FlSpot(114.24, 53.27),
    FlSpot(116.60, 42.13),
    FlSpot(118.52, 57.60),
  ];

  final leftTitle = {
    0: '24000,00',
    20: '25000,00',
    40: '26500,00',
    60: '27000,00',
    80: '27500,00',
    100: '28000,00'
  };

  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'May',
    50: 'Jun',
    60: 'Jul',
    70: 'Aug',
    80: 'Sep',
    90: 'Oct',
    100: 'Nov',
    110: 'Dec',
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              color: Color.fromRGBO(6, 11, 39, 0.767),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "H",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "J",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "S",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "M",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "S",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(10, 23, 95, 0.897),

                            //Color.fromARGB(255, 243, 63, 146),
                          )),
                      child: Text(
                        "A",
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 10),
                    color: Color.fromRGBO(6, 11, 39, 0.767),
                    child: Stack(
                      children: [
                        Center(
                          heightFactor: 0,
                          child: Text('Performance',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                'Roboto',
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                              handleBuiltInTouches: true,
                            ),
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 32,
                                  interval: 1,
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    return bottomTitle[value.toInt()] != null
                                        ? SideTitleWidget(
                                            axisSide: meta.axisSide,
                                            space: 10,
                                            child: Text(
                                                bottomTitle[value.toInt()]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[400])),
                                          )
                                        : const SizedBox();
                                  },
                                ),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    return leftTitle[value.toInt()] != null
                                        ? Text(
                                            leftTitle[value.toInt()].toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[400]))
                                        : const SizedBox();
                                  },
                                  showTitles: true,
                                  interval: 1,
                                  reservedSize: 50,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                  isCurved: true,
                                  curveSmoothness: 0,
                                  color: Theme.of(context).primaryColor,
                                  barWidth: 2.5,
                                  isStrokeCapRound: true,
                                  belowBarData: BarAreaData(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        Colors.transparent
                                      ],
                                    ),
                                    show: true,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                  ),
                                  dotData: FlDotData(show: false),
                                  spots: spots)
                            ],
                            minX: 0,
                            maxX: 120,
                            maxY: 105,
                            minY: -5,
                          ),
                          //swapAnimationDuration: const Duration(milliseconds: 250),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          color: Color.fromRGBO(6, 11, 39, 0.767),
                          child: Stack(
                            children: [
                              Center(
                                heightFactor: 0,
                                child: Text('Répartition',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              LayoutBuilder(builder: (context, constraints) {
                                double width = constraints.maxWidth;
                                double height = constraints.maxHeight;
                                return PieChart(
                                  PieChartData(
                                    sections: [
                                      PieChartSectionData(
                                        color: const Color(0xff0293ee),
                                        value: 40,
                                        title: '40%',
                                      ),
                                      PieChartSectionData(
                                        color: const Color(0xfff8b250),
                                        value: 30,
                                        title: '30%',
                                      ),
                                      PieChartSectionData(
                                        color: const Color(0xff845bef),
                                        value: 15,
                                        title: '15%',
                                      ),
                                      PieChartSectionData(
                                        color: const Color(0xff13d38e),
                                        value: 15,
                                        title: '15%',
                                      ),
                                    ],
                                    centerSpaceRadius: width > height
                                        ? height * 0.15
                                        : width * 0.15,
                                    sectionsSpace: 0,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(3),
                          //width: 200,
                          color: Color.fromRGBO(6, 11, 39, 0.767),
                          child: Stack(
                            children: [
                              Center(
                                heightFactor: 0,
                                child: Text('Rant',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Center(
                                child: Text("952.56 £",
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(3),
                          //width: 200,
                          color: Color.fromRGBO(6, 11, 39, 0.767),
                          child: Stack(
                            children: [
                              Center(
                                heightFactor: 0,
                                child: Text('Epargne',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Center(
                                child: Text("952.56 £",
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /*Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    color: Color.fromRGBO(6, 11, 39, 0.767),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.wallet,
                          size: 150,
                          color: Colors.green,
                        ),
                        Text("952.56 £",
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    color: Color.fromRGBO(6, 11, 39, 0.767),
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text('Cryptomonaie',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                        DataColumn(
                            label: Text('Volume',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                        DataColumn(
                            label: Text('Cours',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                        DataColumn(
                            label: Text('% 24 ',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                        DataColumn(
                            label: Text('Initial',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(
                            'Bitcoin',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '£ 335.65',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '£ 0.000013',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '- 1.84 %',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '225.23 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            'Bitcoin',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '£ 0.000013',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '£ 0.000013',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '- 1.84 %',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '225.23 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ]),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                    color: Color.fromRGBO(161, 61, 255, 0.534),
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Text('Gain',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                        DataColumn(
                            label: Text('%',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                        DataColumn(
                            label: Text('Portefeuille',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(
                            '-4.85 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '-1.85 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '489.89 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(
                            '-4.85 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '-1.85 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '489.89 £',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
