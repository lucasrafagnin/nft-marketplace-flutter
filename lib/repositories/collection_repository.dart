import 'package:nft_showcase/models/ranking_nft.dart';

import '../models/nft.dart';
import '../models/ranking_collection.dart';

abstract class CollectionRepository {
  Future<RankingCollection> getCollectionRanking();
  Future<RankingNft> getNftRanking();
  Future<List<Nft>> getNFTsByCollection(String contract);
}
