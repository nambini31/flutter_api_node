import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_api_node/connect/Controlleur/coinControlleur.dart';
import 'package:flutter_api_node/connect/models/coinModel.dart';
import 'package:intl/intl.dart';

class TabGain extends StatefulWidget {
  const TabGain({super.key});

  @override
  State<TabGain> createState() => _TabGainState();
}

class _TabGainState extends State<TabGain> {
  double gain = 0.0;
  double rapport = 0.0;
  double portefeuille = 0.0;
  double portefeuilleBTC = 0.0; // Initial value

  @override
  void initState() {
    super.initState();
    final coinModelStream = getCryptoData();

    coinModelStream.listen((coinModel) {
      print('Prix du Bitcoin (EUR): ${coinModel.price}');

      // Calcul des gains
      double prixDuBTCDuMoment = coinModel.price;
      double calculatedGain = (0.05 * prixDuBTCDuMoment) - (0.05 * 24787);

      // Mise à jour du portefeuille
      double calculatedPortefeuille = 1239.35 + calculatedGain;

      // Calcul du rapport
      double calculatedRapport = calculatedGain * 100 / 1239.35;
      double equivalence = calculatedPortefeuille / coinModel.price;
      setState(() {
        gain = calculatedGain;
        rapport = calculatedRapport;
        portefeuille = calculatedPortefeuille;
        portefeuilleBTC = equivalence;
      });
    });
  }

  Stream<CoinModel> getCryptoData() {
    return Stream.periodic(Duration(seconds: 60)).asyncMap((_) async {
      final CoinModel realTimeData = await fetchCryptoData();
      return realTimeData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      fit: FlexFit.tight,
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        color: Color.fromRGBO(161, 61, 255, 0.534),
        child: DataTable(
          columns: [
            DataColumn(
              label: Text(
                'Gain',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                '%',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Portefeuille',
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(
                gain.toStringAsFixed(2) + '€', // Affiche le gain calculé
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                rapport.toStringAsFixed(2) + '%', // Affiche le rapport calculé
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Column(
                children: <Widget>[
                  Text(
                    portefeuille.toStringAsFixed(2) + '€',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    portefeuilleBTC.toStringAsFixed(2) + 'BTC',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                '0', // Affiche le gain calculé
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Text(
                '0', // Affiche le rapport calculé
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              )),
              DataCell(Column(
                children: <Widget>[
                  Text(
                    '0',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '0 WT',
                    style: GoogleFonts.getFont(
                      'Roboto',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            ]),
          ],
        ),
      ),
    );
  }
}
