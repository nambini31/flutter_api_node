import 'dart:convert';

class CoinModel {
  final DateTime time;
  final double price;
  final double volume;
  final double percentChange24h;

  CoinModel(this.time,this.price, this.volume, this.percentChange24h);
}

