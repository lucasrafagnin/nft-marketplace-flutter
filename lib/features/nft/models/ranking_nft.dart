import 'package:nft_showcase/features/nft/models/nft.dart';

class RankingNft {
  final int total;
  final List<Nft> nfts;

  const RankingNft({
    required this.total,
    required this.nfts,
  });

  factory RankingNft.fromJson(Map<String, dynamic> json) {
    return RankingNft(
      total: json['total'],
      nfts: (json['nfts'] as List).map((e) => Nft.fromJson(e)).toList(),
    );
  }
}
