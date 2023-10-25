import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_api_node/connect/Controlleur/coinControlleur.dart';
import 'package:flutter_api_node/connect/models/coinModel.dart';

class TabGain extends StatefulWidget {
  const TabGain({super.key});

  @override
  State<TabGain> createState() => _TabGainState();
}

class _TabGainState extends State<TabGain> {
  double gain = 0.0;
  double rapport = 0.0;
  double portefeuille = 24787.0; // Initial value

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
      double calculatedPortefeuille = portefeuille + calculatedGain;

      // Calcul du rapport
      double calculatedRapport = calculatedGain / 24787;

      setState(() {
        gain = calculatedGain;
        rapport = calculatedRapport;
        portefeuille = calculatedPortefeuille;
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
                gain.toStringAsFixed(2), // Affiche le gain calculé
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: Colors.white,
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
              DataCell(Text(
                portefeuille.toStringAsFixed(2), // Affiche le portefeuille
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
    );
  }
}
