import 'package:nft_showcase/models/collection.dart';

class Ranking {
  final int total;
  final List<Collection> collection;

  const Ranking({
    required this.total,
    required this.collection,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      total: json['total'],
      collection: (json['collections'] as List)
          .map((e) => Collection.fromJson(e))
          .toList(),
    );
  }
}
