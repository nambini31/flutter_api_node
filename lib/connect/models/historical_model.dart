class HistoricalData {
  final List<List<num>> prices; // Utilisation de num au lieu de double

  HistoricalData({required this.prices});

  factory HistoricalData.fromJson(Map<String, dynamic> json) {
    final prices = (json['prices'] as List<dynamic>).map((point) {
      final timestamp = (point[0] as num).toInt(); // Utilisation de num au lieu de double
      final price = point[1] as num; // Utilisation de num au lieu de double
      return [timestamp, price];
    }).toList();

    return HistoricalData(prices: prices);
  }
}
