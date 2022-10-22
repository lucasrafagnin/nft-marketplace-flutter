import 'package:intl/intl.dart';

class Collection {
  final String name;
  final String description;
  final String logo;
  final String contract;
  final String category;
  final double marketCapUSD;
  final double marketCapChangePercentage;

  const Collection({
    required this.name,
    required this.description,
    required this.logo,
    required this.contract,
    required this.category,
    required this.marketCapUSD,
    required this.marketCapChangePercentage,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      name: json['name'],
      description: json['description'],
      logo: json['logo'],
      contract: json['contracts'][0],
      category: json['categories']?[0],
      marketCapUSD: json['market_cap_usd'],
      marketCapChangePercentage: json['market_cap_change_percentage'] ?? 0
    );
  }

  String getCategoryName() => "${category.toUpperCase()} collection";

  String getMarketCapFormatted() {
    final currencyFormatter = NumberFormat('#,##0.00', 'en_US');
    return "\$${currencyFormatter.format(marketCapUSD)}";
  }

  String getMarketCapChangeAsPercentage() {
    return "${marketCapChangePercentage.toStringAsFixed(2)}%";
  }
}
