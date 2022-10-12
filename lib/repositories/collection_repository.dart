import '../model/nft.dart';
import '../model/ranking.dart';

abstract class CollectionRepository {
  Future<Ranking> getCollectionRanking();
  Future<List<Nft>> getNFTsByCollection(String contract);
}
