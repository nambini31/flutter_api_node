import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../Model/coinModel.dart';

void main() {
  final coinModelStream = getCryptoData();
  

  coinModelStream.listen((coinModel) {
    print('Prix du Bitcoin (EUR): ${coinModel.price}');
    print('Volume (EUR): ${coinModel.volume}');
    print('Variation en 24 heures (%): ${coinModel.percentChange24h}');
  });
}

Stream<CoinModel> getCryptoData() {
  return Stream.periodic(Duration(seconds: 60)).asyncMap((_) async {
    final CoinModel coinModel = await fetchCryptoData();
    return coinModel;
  });
}

Future<CoinModel> fetchCryptoData() async {
  final coinId = 'bitcoin';
  try {
    final response = await http.get(
      Uri.parse(
          'https://api.coingecko.com/api/v3/coins/$coinId'), // Endpoint pour obtenir des informations détaillées sur la crypto-monnaie
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final currentPrice =
          data['market_data']['current_price']['eur']; // Prix actuel en euros
      final volume =
          data['market_data']['total_volume']['eur']; // Volume en euros
      final percentChange24h = data['market_data'][
          'price_change_percentage_24h']; // Variation en 24 heures en pourcentage

      return CoinModel(currentPrice, volume, percentChange24h);
    } else {
      throw Exception(
          'Erreur de chargement de données: ${response.statusCode}');
    }
  } catch (e) {
    print('Erreur lors de la requête API: $e');
    return CoinModel(
        0.0, 0.0, 0.0); // Gestion d'erreur, renvoie des valeurs par défaut
  }
}
 