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
  @override
  void initState() {
    super.initState();
    final coinModelStream = getCryptoData(coinDataList);

    coinModelStream.listen((coinModel) {
      // Mettez à jour la liste de données avec les nouvelles valeurs
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
          rows: coinDataList.map((coinModel) {
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
                '€ ${coinModel.volume.toStringAsFixed(2)}', // Utilisez le volume de la cryptomonnaie
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                '€ ${coinModel.price.toStringAsFixed(2)}', // Utilisez le prix de la cryptomonnaie
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                '${coinModel.percentChange24h.toStringAsFixed(2)}%', // Utilisez la variation en 24 heures
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                '1 239.35 €', // Vous pouvez remplacer cette valeur par les données correctes si nécessaire
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
