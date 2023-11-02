// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_api_node/connect/Controlleur/coinControlleur.dart';
import 'package:flutter_api_node/connect/models/coinModel.dart';
import 'package:google_fonts/google_fonts.dart';

class TabCoin extends StatefulWidget {
  const TabCoin({super.key});

  @override
  State<TabCoin> createState() => _TabCoinState();
}

class _TabCoinState extends State<TabCoin> {
  List<CoinModel> coinDataList = [];
  List<DataRow> additionalRows = [
    DataRow(cells: [
      DataCell(Text(
        'WT',
        style: GoogleFonts.getFont(
          'Roboto',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      )),
      DataCell(Text(
        '0',
        style: GoogleFonts.getFont(
          'Roboto',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      )),
      DataCell(Text(
        '0',
        style: GoogleFonts.getFont(
          'Roboto',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      )),
      DataCell(Text(
        '0',
        style: GoogleFonts.getFont(
          'Roboto',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      )),
      DataCell(Text(
        '0',
        style: GoogleFonts.getFont(
          'Roboto',
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      )),
    ]),
  ];
  @override
  void initState() {
    super.initState();
    final coinModelStream = getCryptoData(coinDataList);

    coinModelStream.listen((coinModel) {
     
      setState(() {
        coinDataList.clear();
        coinDataList.add(coinModel);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      fit: FlexFit.tight,
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
            ...coinDataList.map((coinModel) {
              double volumeInMillions = coinModel.volume / 1000000;
              String volumeText = '€ ${volumeInMillions.toStringAsFixed(2)}M';

              return DataRow(cells: [
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
                  volumeText,
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                DataCell(Text(
                  '€ ${coinModel.price.toStringAsFixed(2)}',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                DataCell(
                  Text(
                    '${coinModel.percentChange24h.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: coinModel.percentChange24h >= 0
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ),
                DataCell(Text(
                  '1 239.35 €',
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ]);
            }).toList(),
            
            ...additionalRows,
          ],
        ),
      ),
    );
  }
}
