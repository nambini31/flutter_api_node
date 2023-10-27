// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_node/connect/models/coinModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_api_node/connect/Controlleur/coinControlleur.dart';

class Repartition extends StatefulWidget {
  const Repartition({super.key});

  @override
  State<Repartition> createState() => _RepartitionState();
}

class _RepartitionState extends State<Repartition> {
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
      double calculatedRapport = calculatedGain / 1239.35;
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
      fit: FlexFit.tight,
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
                        centerSpaceRadius:
                            width > height ? height * 0.13 : width * 0.15,
                        sectionsSpace: 0,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(3),
              //width: 200,
              color: Color.fromRGBO(6, 11, 39, 0.767),
              child: Stack(
                children: [
                  Center(
                    heightFactor: 0,
                    child: Text('Rente',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Roboto',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Center(
                    child: Text("---€",
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
                    child: Text(portefeuille.toStringAsFixed(2) + '€',
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
    );
  }
}
