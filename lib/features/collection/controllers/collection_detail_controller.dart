import 'package:flutter/foundation.dart';
import 'package:nft_showcase/features/nft/models/nft.dart';
import 'package:nft_showcase/repositories/collection_repository.dart';

class CollectionDetailController {
  final CollectionRepository repository;
  var nftList = ValueNotifier<List<Nft>>([]);

  CollectionDetailController(this.repository);

  fetchNFTsByCollection(String contract) async {
    nftList.value = await repository.getNFTsByCollection(contract);
  }
}
