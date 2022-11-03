import 'package:dio/dio.dart';
import 'package:nft_showcase/features/nft/models/ranking_nft.dart';
import 'package:nft_showcase/repositories/collection_repository.dart';
import 'package:nft_showcase/service/api_service.dart';

import '../features/nft/models/nft.dart';
import '../features/collection/models/ranking_collection.dart';

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
  Future<RankingNft> getNftRanking(String category) async {
    try {
      var response = await apiService.getHttpClient().get(
          "${ApiService.baseUrl}/eth/v1/market/rank/nft/30d?by=highest_price&category=$category");
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

  @override
  Future<Nft> getNFTDetail(String contract, String tokenId) async {
    try {
      Response response = await apiService
          .getHttpClient()
          .get("${ApiService.baseUrl}/eth/v1/nft/$contract/$tokenId/info");
      return Nft.fromJson(response.data);
    } catch (ignored) {
      throw Exception("");
    }
  }
}
