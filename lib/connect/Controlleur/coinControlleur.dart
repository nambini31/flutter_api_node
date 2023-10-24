import 'dart:convert';
import 'dart:async';
import 'package:flutter_api_node/connect/models/historical_model.dart';
import 'package:http/http.dart' as http;
import '../models/coinModel.dart';

void main() {
  final List<CoinModel> coinDataList =
      []; // Liste pour stocker les instantanés de données
  final coinModelStream = getCryptoData(coinDataList);

  coinModelStream.listen((coinModel) {
    print('Prix du Bitcoin (EUR): ${coinModel.price}');
    print('Volume (EUR): ${coinModel.volume}');
    print('Variation en 24 heures (%): ${coinModel.percentChange24h}');
  });
}

Stream<CoinModel> getCryptoData(List<CoinModel> coinDataList) {
  return Stream.periodic(Duration(seconds: 60)).asyncMap((_) async {
    final CoinModel realTimeData = await fetchCryptoData();
    coinDataList.add(realTimeData);
    return realTimeData;
  });
}

Future<CoinModel> fetchCryptoData() async {
  final coinId = 'bitcoin';
  try {
    final response = await http.get(
      Uri.parse('https://api.coingecko.com/api/v3/coins/$coinId'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final currentPrice = data['market_data']['current_price']['eur'];
      final volume = data['market_data']['total_volume']['eur'];
      final percentChange24h =
          data['market_data']['price_change_percentage_24h'];

      final coinModel = CoinModel(DateTime.now(), currentPrice, volume,
          percentChange24h); // Ajoutez la date et l'heure actuelles
      return coinModel;
    } else {
      throw Exception(
          'Erreur de chargement de données: ${response.statusCode}');
    }
  } catch (e) {
    print('Erreur lors de la requête API: $e');
    return CoinModel(DateTime.now(), 0.0, 0.0,
        0.0); // Gestion d'erreur, renvoie des valeurs par défaut
  }
}

Future<List<List<num>>> fetchHistoricalData() async {
  final coinId = 'bitcoin';
  final days = '365'; // 365 jours d'historique
  final interval = 'daily'; // Interval quotidien

  final Uri url = Uri.https(
    'api.coingecko.com',
    '/api/v3/coins/$coinId/market_chart',
    {'vs_currency': 'eur', 'days': days, 'interval': interval},
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final dynamic data = json.decode(response.body);
    if (data is Map<String, dynamic> && data.containsKey('prices')) {
      final historicalData = HistoricalData.fromJson(data);
      return historicalData.prices;
    } else {
      throw Exception("Les données de l'historique ne sont pas valides.");
    }
  } else {
    throw Exception(
        'Erreur de chargement de données historiques: ${response.statusCode}');
  }
}



