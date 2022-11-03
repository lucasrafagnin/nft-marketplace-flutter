import 'package:nft_showcase/features/nft/models/ranking_nft.dart';

import '../features/nft/models/nft.dart';
import '../features/collection/models/ranking_collection.dart';

abstract class CollectionRepository {
  Future<RankingCollection> getCollectionRanking();
  Future<RankingNft> getNftRanking(String category);
  Future<List<Nft>> getNFTsByCollection(String contract);
  Future<Nft> getNFTDetail(String contract, String tokenId);
}
