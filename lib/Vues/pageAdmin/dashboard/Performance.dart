import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_api_node/connect/Controlleur/coinControlleur.dart';
import 'package:flutter_api_node/connect/models/historical_model.dart';

class Performance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChartData>>(
      future: fetchHistoricalData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return Text('Aucune donnée disponible.');
        } else {
          return Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
              color: Color.fromRGBO(6, 11, 39, 0.767),
              child: Stack(
                children: [
                  Center(
                    heightFactor: 0,
                    child: Text('Performance',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  LineChartWidget(historicalData: snapshot.data!),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class LineChartWidget extends StatelessWidget {
  final List<ChartData> historicalData;

  LineChartWidget({required this.historicalData});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(),
      primaryYAxis: NumericAxis(
        minimum: 20000, // Valeur minimale du prix
        maximum: 35000, // Valeur maximale du prix
      ),
      series: <LineSeries<ChartData, DateTime>>[
        LineSeries<ChartData, DateTime>(
          dataSource: historicalData,
          xValueMapper: (ChartData data, _) => data.timestamp,
          yValueMapper: (ChartData data, _) => data.price,
          color: const Color.fromARGB(255, 4, 79, 141), // Personnalisez la couleur de la ligne
        ),
      ],
    );
  }
}
