import 'package:dio/dio.dart';
import 'package:nft_showcase/models/ranking_nft.dart';
import 'package:nft_showcase/repositories/collection_repository.dart';

import '../models/nft.dart';
import '../models/ranking_collection.dart';

class CollectionRepositoryImpl extends CollectionRepository {
  final dio = Dio();
  final _baseUrl = 'https://data-api.nftgo.io';
  final _apiKey = "0a8dc216-2f59-4165-937a-7476993b2fff";

  @override
  Future<RankingCollection> getCollectionRanking() async {
    Dio dio = Dio(BaseOptions(headers: {
      "X-API-KEY": _apiKey,
    }));

    try {
      Response response =
          await dio.get("$_baseUrl/eth/v1/market/rank/collection/30d");
      return RankingCollection.fromJson(response.data);
    } catch (ignored) {
      return const RankingCollection(collection: [], total: 1);
    }
  }

  @override
  Future<RankingNft> getNftRanking() async {
    Dio dio = Dio(BaseOptions(headers: {
      "X-API-KEY": _apiKey,
    }));
    try {
      Response response = await dio.get(
          "$_baseUrl/eth/v1/market/rank/nft/30d?by=highest_price&category=ALL");
      return RankingNft.fromJson(response.data);
    } catch (ignored) {
      return const RankingNft(nfts: [], total: 1);
    }
  }

  @override
  Future<List<Nft>> getNFTsByCollection(String contract) async {
    Dio dio = Dio(BaseOptions(headers: {
      "X-API-KEY": _apiKey,
    }));

    try {
      Response response =
          await dio.get("$_baseUrl/eth/v1/collection/$contract/nfts");
      return (response.data['nfts'] as List)
          .map((e) => Nft.fromJson(e))
          .toList();
    } catch (ignored) {
      return [];
    }
  }
}
