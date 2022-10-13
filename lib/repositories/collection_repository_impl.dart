import 'package:dio/dio.dart';
import 'package:nft_showcase/models/ranking_nft.dart';
import 'package:nft_showcase/repositories/collection_repository.dart';
import 'package:nft_showcase/service/api_service.dart';

import '../models/nft.dart';
import '../models/ranking_collection.dart';

class CollectionRepositoryImpl extends CollectionRepository {
  final ApiService apiService;

  CollectionRepositoryImpl(this.apiService);

  @override
  Future<RankingCollection> getCollectionRanking() async {
    try {
      var response = await apiService
          .getHttpClient()
          .get("${ApiService.baseUrl}/eth/v1/market/rank/collection/30d");
      return RankingCollection.fromJson(response.data);
    } catch (ignored) {
      return const RankingCollection(collection: [], total: 1);
    }
  }

  @override
  Future<RankingNft> getNftRanking() async {
    try {
      var response = await apiService.getHttpClient().get(
          "${ApiService.baseUrl}/eth/v1/market/rank/nft/30d?by=highest_price&category=ALL");
      return RankingNft.fromJson(response.data);
    } catch (ignored) {
      return const RankingNft(nfts: [], total: 1);
    }
  }

  @override
  Future<List<Nft>> getNFTsByCollection(String contract) async {
    try {
      Response response = await apiService
          .getHttpClient()
          .get("${ApiService.baseUrl}/eth/v1/collection/$contract/nfts");
      return (response.data['nfts'] as List)
          .map((e) => Nft.fromJson(e))
          .toList();
    } catch (ignored) {
      return [];
    }
  }
}
