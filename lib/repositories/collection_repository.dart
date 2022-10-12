import '../models/nft.dart';
import '../models/ranking.dart';

abstract class CollectionRepository {
  Future<Ranking> getCollectionRanking();
  Future<List<Nft>> getNFTsByCollection(String contract);
}
