import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_api_node/connect/Controlleur/coinControlleur.dart';
import 'package:flutter_api_node/connect/models/historical_model.dart';
class Performance extends StatelessWidget {
    final String? param;
    const Performance({this.param});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChartData>>(
      future: fetchHistoricalData(param),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Text('Aucune donnée disponible.');
        } else {
          // Mettez à jour les données pour diviser le prix par 0.05
          final modifiedData = snapshot.data!.map((data) {
            return ChartData(data.timestamp, data.price * 0.05);
          }).toList();

          return Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
              color: Color.fromRGBO(6, 11, 39, 0.767),
              child: Stack(
                children: [
                  const Center(
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
                  LineChartWidget(historicalData: modifiedData),
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
      plotAreaBorderWidth: 0,
      tooltipBehavior: TooltipBehavior(enable: true),
      primaryXAxis: DateTimeAxis(),
      primaryYAxis: NumericAxis(
        minimum: 2000, // Valeur minimale du prix
        maximum: 1000, // Valeur maximale du prix
      ),
      series: <LineSeries<ChartData, DateTime>>[
        LineSeries<ChartData, DateTime>(
          dataSource: historicalData,
          xValueMapper: (ChartData data, _) => data.timestamp,
          yValueMapper: (ChartData data, _) => data.price,
          color: const Color.fromARGB(255, 4, 79, 141),
           width: 4.0, 
        ),
      ],
      
    );
  }
}
