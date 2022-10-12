import 'package:nft_showcase/models/collection.dart';

class RankingCollection {
  final int total;
  final List<Collection> collection;

  const RankingCollection({
    required this.total,
    required this.collection,
  });

  factory RankingCollection.fromJson(Map<String, dynamic> json) {
    return RankingCollection(
      total: json['total'],
      collection: (json['collections'] as List)
          .map((e) => Collection.fromJson(e))
          .toList(),
    );
  }
}
