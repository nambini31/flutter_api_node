import 'dart:convert';

class CoinModel {
  final double price;
  final double volume;
  final double percentChange24h;

  CoinModel(this.price, this.volume, this.percentChange24h);
}
